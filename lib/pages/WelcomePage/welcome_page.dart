import 'package:e_book_app/components/my_button.dart';
import 'package:e_book_app/controller/auth_controller.dart';
import 'package:e_book_app/pages/HomePage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .6,
              color: Theme
                  .of(context)
                  .colorScheme
                  .primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("Assets/Images/book.png"),
                  const SizedBox(height: 40),
                  Text(
                    "E - Book Store",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .background),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Here you can find best book for you and you can also read book and listens book",
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .background),
                    textAlign: TextAlign.center,
                  ),

                ],
              )),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Text("Disclamer", style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium,),
                const SizedBox(height: 10),
                Text(
                  "n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum",
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelSmall,
                ),
              ],
            ),
          ),
          const Spacer(),
          Obx(() => authController.isLoading.value?const Center(child: CircularProgressIndicator()):
             MyButton(
                text: "LOGIN WITH GOOGLE",
                onTap: () {
                  authController.loginWithGoogle();
                }),
          ),
        ],
      ),
    );
  }
}
