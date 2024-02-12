import 'package:e_book_app/config/Messages.dart';
import 'package:e_book_app/pages/HomePage/home_page.dart';
import 'package:e_book_app/pages/WelcomePage/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController{
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  void loginWithGoogle()async{
    isLoading.value=true;
    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      //create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await auth.signInWithCredential(credential);
      successMessage("Login Successfully");
      Get.offAll(const HomePage());
    }catch(e){
      isLoading.value=false;
      errorMessage("Login Failed try again");
      print(e);
    }
    isLoading.value=false;
  }
  void logOut()async{
   try{
     await auth.signOut();
     successMessage("Logout Successfully");
     Get.offAll(const WelcomePage());
   }catch(e){
     errorMessage("Error not logout try again");
     print(e);
   }
  }
}