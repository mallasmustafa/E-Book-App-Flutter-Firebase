import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
class BackPageButton extends StatelessWidget {
  const BackPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ()=>Get.back(),
      child: Container(
        child: Row(
          children: [
            SvgPicture.asset("Assets/Icons/back.svg"),
            const SizedBox(width: 10),
            Text("Back",style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.background),)
          ],
        ),
      ),
    );
  }
}
