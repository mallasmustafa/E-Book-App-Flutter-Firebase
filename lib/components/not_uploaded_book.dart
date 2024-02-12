import 'package:flutter/material.dart';

class NotUploadedBook extends StatelessWidget {
  const NotUploadedBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("Assets/Images/book.png", height: 220, width: 220),
        SizedBox(height: 10),
        Text(
          "You were not uploaded any book",
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }
}
