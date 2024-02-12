import 'package:e_book_app/pages/BookPage/book_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
class BookActionButton extends StatelessWidget {
  final String bookUrl;
  const BookActionButton({super.key, required this.bookUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      margin: EdgeInsets.all(10),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: ()=>Get.to(BookPage(bookUrl: bookUrl,)),
            child: Row(
              children: [
                SvgPicture.asset("Assets/Icons/book.svg"),
                SizedBox(width: 10),
                Text("READ BOOK", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.background,
                    letterSpacing: 1.2
                ),
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            width: 3,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(10)
            ),
          ),
          Row(
              children: [
                SvgPicture.asset("Assets/Icons/playe.svg"),
                SizedBox(width: 10),
                Text("PLAY BOOK", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.background,
                    letterSpacing: 1.2
                ),),
              ]
          ),
        ],
      ),
    );
  }
}
