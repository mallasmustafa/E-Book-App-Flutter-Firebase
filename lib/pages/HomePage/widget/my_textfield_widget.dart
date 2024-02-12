import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class MyTextFieldWidget extends StatelessWidget {
  const MyTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Row(
        children: [
          SizedBox(width: 20),
          SvgPicture.asset("Assets/Icons/search.svg"),
          SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Search book",
                  border: InputBorder.none
              ),
            ),
          ),
        ],
      ),
    );
  }
}
