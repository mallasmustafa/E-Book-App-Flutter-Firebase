import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_book_app/Models/book_model.dart';
import 'package:e_book_app/config/Messages.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class BookController extends GetxController {
  TextEditingController booktitle = TextEditingController();
  TextEditingController bookdescription = TextEditingController();
  TextEditingController authorName = TextEditingController();
  TextEditingController aboutAuthor = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController pages = TextEditingController();
  TextEditingController language = TextEditingController();
  TextEditingController audioLength = TextEditingController();
  final storage = FirebaseStorage.instance;
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxString imageUrl = "".obs;
  RxString pdfUrl = "".obs;
  ImagePicker imagePicker = ImagePicker();
  RxBool isImageUploading = false.obs;
  RxBool isPostUploading = false.obs;
  RxBool isPdfUploading = false.obs;
  RxBool isBookDeleting = false.obs;

  final uId = const Uuid();
  RxList<BookModel> bookData= <BookModel>[].obs;
  RxList<BookModel> currentUserBooks = <BookModel>[].obs;

  @override
  void onInit() {
    getAllBooks();
    //getUserBooks();
    super.onInit();

  }
   //getting all book in firebase
  void getAllBooks()async{
    bookData.clear();
    var books = await db.collection("Book").get();
    for(var book in books.docs){
      bookData.add(BookModel.fromJson(book.data()));
    }
  }
  //getting user email base books in firebase
  void getUserBooks()async{
    currentUserBooks.clear();
    var books = await db.collection("userBook").doc(auth.currentUser!.uid).collection("Books").get();
    for(var book in books.docs){
      currentUserBooks.add(BookModel.fromJson(book.data()));
    }
  }
  //picking image
  void pickImage() async {
    isImageUploading.value = true;
    final XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      //print(image.path);
      uploadImageToFirebase(File(image.path));
    }
  }
  //image upload to firebase
  void uploadImageToFirebase(File image) async {
    var uuid = Uuid();
    var filename = uuid.v1();
    var storageRef = storage.ref().child("Images/$filename");
    var response = await storageRef.putFile(image);
    String dawnloadUrl = await storageRef.getDownloadURL();
    imageUrl.value = dawnloadUrl;
    print("Dawnload URL: $dawnloadUrl");
    isImageUploading.value=false;
  }
  //pick pdf function
  void pickPDF() async {
    isPdfUploading.value=true;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      File file = File(result.files.first.path!);

      if (file.existsSync()) {
        Uint8List fileBytes = await file.readAsBytes();
        String fileName = result.files.first.name;
        print("File Bytes: $fileBytes");

        final response =
            await storage.ref().child("Pdf/$fileName").putData(fileBytes);

        final downloadURL = await response.ref.getDownloadURL();
        pdfUrl.value = downloadURL;
        print(downloadURL);
      } else {
        print("File does not exist");
      }
    } else {
      print("No file selected");
    }
    isPdfUploading.value = false;
  }
 //create book and add show in home and userprofile
  void createBook()async{
    isPostUploading.value=true;
    String id = uId.v4();
    var newBook = BookModel(
      id: id,
      title: booktitle.text,
      description: bookdescription.text,
      coverUrl: imageUrl.value,
      bookurl: pdfUrl.value,
      author: authorName.text,
      aboutAuthor: aboutAuthor.text,
      price: int.parse(price.text),
      pages: int.parse(pages.text),
      language: language.text,
      audioLen: audioLength.text,
      audioUrl: "",
      rating: "",
    );
    await db.collection("Book").doc(id).set(newBook.toJson());
    addBookToDb(newBook);
    isPostUploading.value=false;
    booktitle.clear();
    bookdescription.clear();
    authorName.clear();
    aboutAuthor.clear();
    price.clear();
    pages.clear();
    language.clear();
    audioLength.clear();
    imageUrl.value="";
    pdfUrl.value="";
    successMessage("Book added to the db");
    getAllBooks();
    getUserBooks();
  }
   //add data to user profile
  void addBookToDb(BookModel book)async{
    await db.collection("userBook").doc(auth.currentUser!.uid).collection("Books").add(book.toJson());
  }

  //delete id base in data user profile and home screen
  Future<void> deleteBookByCustomId(String customId) async {
    isBookDeleting.value=true;
    try {
      // Query Firestore to find the document with matching customId
      QuerySnapshot querySnapshot = await db
          .collection("userBook")
          .doc(auth.currentUser!.uid)
          .collection("Books")
          .where("id", isEqualTo: customId)
          .get();
      await db.collection("Book").doc(customId).delete();

      // If document(s) found, delete each one
      for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
        await docSnapshot.reference.delete();
        getUserBooks();
        getAllBooks();
        successMessage("Book deleted Successfully");
        print("Book with customId '$customId' deleted successfully.");
      }
    } catch (error) {
      isBookDeleting.value=false;
      errorMessage("Something went wrong book not deleted");
      print("Failed to delete book with customId '$customId': $error");
    }
    isBookDeleting.value=false;
  }
}
