import 'package:e_book_app/components/backButton.dart';
import 'package:e_book_app/components/multiline_Textformfield.dart';
import 'package:e_book_app/components/my_textformfield.dart';
import 'package:e_book_app/config/Colors.dart';
import 'package:e_book_app/controller/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewBook extends StatelessWidget {
  const AddNewBook({super.key});

  @override
  Widget build(BuildContext context) {
    BookController bookController = Get.put(BookController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              color: Theme
                  .of(context)
                  .colorScheme
                  .primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const BackPageButton(),
                            Text(
                              "ADD NEW BOOK",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .background,
                              ),
                            ),
                            const SizedBox(
                              width: 60,
                            )
                          ],
                        ),
                        const SizedBox(height: 60),
                        InkWell(
                          onTap: () {
                            bookController.pickImage();
                          },
                          child: Obx(() {
                            return Container(
                                height: 190,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                    Theme
                                        .of(context)
                                        .colorScheme
                                        .background),
                                child: Center(
                                  child: bookController.isImageUploading.value
                                      ? const CircularProgressIndicator(
                                      color: primaryColor)
                                      : bookController.imageUrl.value == ""
                                      ? Image.asset("Assets/Icons/addImage.png")
                                      : Image.network(
                                      bookController.imageUrl.value,
                                      fit: BoxFit.cover),
                                ));
                          }),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Obx(() {
                          return Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: bookController.pdfUrl.value == "" ? Theme
                                    .of(context)
                                    .colorScheme
                                    .primary
                                    : backgroudColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: bookController.isPdfUploading.value
                                  ? const Center(
                                  child: CircularProgressIndicator(
                                      color: backgroudColor))
                                  : bookController.pdfUrl.value == ""
                                  ? InkWell(
                                onTap: () => bookController.pickPDF(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("Assets/Icons/upload.png"),
                                    const SizedBox(width: 8),
                                    Text("Book Pdf", style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                      color: Theme
                                          .of(context)
                                          .colorScheme
                                          .background,
                                    ),)
                                  ],
                                ),
                              ) : InkWell(
                                onTap: () => bookController.pdfUrl.value = "",
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("Assets/Icons/delete.png"),
                                    const SizedBox(width: 8),
                                    Text("Delete Pdf", style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                      color: Theme
                                          .of(context)
                                          .colorScheme
                                          .primary,
                                    ),)
                                  ],
                                ),
                              )

                          );
                        }),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField(
                      hintText: "Book title",
                      icon: Icons.book,
                      controller: bookController.booktitle),
                  const SizedBox(height: 10),
                  MultiLineTextFormField(
                      hintText: "Book Description",
                      controller: bookController.bookdescription),
                  const SizedBox(height: 10),
                  MyTextFormField(
                      hintText: "Author Name",
                      icon: Icons.person,
                      controller: bookController.authorName),
                  const SizedBox(height: 10),
                  MyTextFormField(
                      hintText: "About Author",
                      icon: Icons.person,
                      controller: bookController.aboutAuthor),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextFormField(
                            isNumber: true,
                            hintText: "Price",
                            icon: Icons.price_change_rounded,
                            controller: bookController.price),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: MyTextFormField(
                            isNumber: true,
                            hintText: "Pages",
                            icon: Icons.pages,
                            controller: bookController.pages),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextFormField(
                            hintText: "Language",
                            icon: Icons.language,
                            controller: bookController.language),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: MyTextFormField(
                            hintText: "Audio Len",
                            icon: Icons.audiotrack,
                            controller: bookController.audioLength),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .primary
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.close, color: Theme
                                  .of(context)
                                  .colorScheme
                                  .primary,),
                              const SizedBox(width: 8),
                              Text("Cencel", style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .primary
                              ),)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Obx(() {
                          return Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: bookController.isPostUploading.value
                                ? Center(child: CircularProgressIndicator(color: backgroudColor,))
                                : InkWell(
                                  onTap: (){
                                    bookController.createBook();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  Icon(Icons.upload_sharp, color: Theme
                                      .of(context)
                                      .colorScheme
                                      .background,
                                  ),
                                  const SizedBox(width: 8),
                                  Text("Post ", style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                    color: Theme
                                        .of(context)
                                        .colorScheme
                                        .background,
                                  ),)
                                    ],
                                  ),
                                ),
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
