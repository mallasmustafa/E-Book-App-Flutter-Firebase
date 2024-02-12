import 'dart:async';
import 'package:e_book_app/pages/HomePage/home_page.dart';
import 'package:e_book_app/pages/WelcomePage/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  final auth = FirebaseAuth.instance;
  @override
  void onInit() {
    splashFunction();
    super.onInit();
  }
  void splashFunction(){
    Timer(const Duration(seconds: 5), () {
      if(auth.currentUser!=null){
        Get.offAll(const HomePage());
      }else{
        Get.offAll(const WelcomePage());
      }
    });
  }
}