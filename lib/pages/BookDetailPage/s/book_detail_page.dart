import 'package:e_book_app/Models/book_model.dart';
import 'package:e_book_app/pages/BookDetailPage/s/Widgets/book_action_button.dart';
import 'package:e_book_app/pages/BookDetailPage/s/Widgets/header_widget.dart';
import 'package:e_book_app/components/backButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class BookDetailPage extends StatelessWidget {
  final BookModel bookModel;
  const BookDetailPage({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
             // height: MediaQuery.of(context).size.height*.7,
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  //appbar
                  Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     BackPageButton(),
                     SvgPicture.asset("Assets/Icons/heart.svg"),
                   ],
                 ),
                  const SizedBox(height: 20),
                  HeaderWidget(bookModel: bookModel),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("About book",style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 5),
                  Text(
                      bookModel.description!,
                      style: Theme.of(context).textTheme.labelMedium
                  ),
                  const SizedBox(height: 10),
                  Text("About Author",style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 5),
                  Text(bookModel.aboutAuthor!,
                      style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
            ),
             BookActionButton(bookUrl: bookModel.bookurl.toString(),),
          ],
        ),
      ),
    );
  }
}
