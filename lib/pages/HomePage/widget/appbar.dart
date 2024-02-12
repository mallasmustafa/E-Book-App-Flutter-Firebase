import 'package:e_book_app/config/Colors.dart';
import 'package:e_book_app/controller/auth_controller.dart';
import 'package:e_book_app/pages/ProfilePage/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset("Assets/Icons/dashboard.svg"),
        Text(
          "E-BOOK",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
        InkWell(
          onTap: ()=>Get.to(const ProfilePage()),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.background,
            radius: 25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  authController.auth.currentUser!.photoURL!,
                  fit: BoxFit.cover,
                ),
              )
            ),
        ),
      ],
    );
  }
}
