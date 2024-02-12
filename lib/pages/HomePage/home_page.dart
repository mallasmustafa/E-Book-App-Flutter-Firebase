import 'package:e_book_app/Models/data.dart';
import 'package:e_book_app/components/book_card.dart';
import 'package:e_book_app/components/book_tile.dart';
import 'package:e_book_app/controller/auth_controller.dart';
import 'package:e_book_app/controller/book_controller.dart';
import 'package:e_book_app/pages/BookDetailPage/s/book_detail_page.dart';
import 'package:e_book_app/pages/HomePage/widget/appbar.dart';
import 'package:e_book_app/pages/HomePage/widget/category_widget.dart';
import 'package:e_book_app/pages/HomePage/widget/my_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BookController bookController = Get.put(BookController());
    AuthController authController = Get.put(AuthController());
    bookController.getUserBooks();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              //height: MediaQuery.of(context).size.height*.6,
              color: Theme
                  .of(context)
                  .colorScheme
                  .primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const AppBarWidget(),
                  const SizedBox(height: 40),
                  Text(
                    "Good Morning, ${authController.auth.currentUser?.displayName}",
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .background),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Time to read book and inhance your knowledge",
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .background),
                  ),
                  const SizedBox(height: 20),
                  const MyTextFieldWidget(),
                  const SizedBox(height: 20),
                  Text(
                    "Topics",
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .background),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: categoryData.map((e) {
                          return CategoryWidget(
                              text: e["lebel"]!, iconPath: e["icon"]!);
                        }).toList()
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
            const SizedBox(height: 10),
            //trending list
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Trending", style: Theme
                      .of(context)
                      .textTheme
                      .labelMedium),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Obx(() {
                      return Row(
                          children: bookController.bookData.map((e) {
                            return BookCard(
                              onTap: () {
                                Get.to(BookDetailPage(bookModel: e,));
                              },
                              image: e.coverUrl!,
                              text: e.title!,
                            );
                          }).toList()
                      );
                    }),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Your Interests",
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelMedium,
                  ),
                  const SizedBox(height: 10),
                  Obx(() {
                    return Column(
                        children: bookController.bookData.map((e) {
                          return BookTile(image: e.coverUrl!,
                            bookTitle: e.title!,
                            author: e.author!,
                            price: e.price!,
                            ratting: e.rating!,
                            numberOfRatting: "12",
                            onTap: () {
                              Get.to(BookDetailPage(bookModel: e));
                            },
                          );
                        }).toList()
                    );
                  }),
                ],
              ),
            ),
            //interest list

          ],
        ),
      ),
    );
  }
}
