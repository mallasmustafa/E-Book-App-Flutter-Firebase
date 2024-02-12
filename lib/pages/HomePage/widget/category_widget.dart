import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class CategoryWidget extends StatelessWidget {
  final String iconPath;
  final String text;
  const CategoryWidget({super.key, required this.text, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        height: 50,
        margin: EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.background
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconPath),
            const SizedBox(width: 10),
             Text(text),
          ],
        ),
      ),
    );
  }
}
