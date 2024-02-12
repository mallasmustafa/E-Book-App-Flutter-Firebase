import 'package:e_book_app/Models/data.dart';
import 'package:e_book_app/components/backButton.dart';
import 'package:e_book_app/components/book_tile.dart';
import 'package:e_book_app/components/not_uploaded_book.dart';
import 'package:e_book_app/controller/auth_controller.dart';
import 'package:e_book_app/controller/book_controller.dart';
import 'package:e_book_app/pages/AddNewBookPage/add_new_book.dart';
import 'package:e_book_app/pages/BookDetailPage/s/book_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    BookController bookController = Get.put(BookController());
    AuthController authController = AuthController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddNewBook());
        },
        child: Icon(Icons.add, color: Theme
            .of(context)
            .colorScheme
            .background),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              color: Theme
                  .of(context)
                  .colorScheme
                  .primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BackPageButton(),
                            Text(
                              "PROFILE",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .background,
                              ),
                            ),
                            IconButton(onPressed: () {
                              authController.logOut();
                            }, icon: Icon(Icons.logout, color: Theme
                                .of(context)
                                .colorScheme
                                .background,),),
                          ],
                        ),
                        const SizedBox(height: 60),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .background,
                                width: 2),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              authController.auth.currentUser!.photoURL!,
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          authController.auth.currentUser!.displayName!,
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
                        Text(
                          authController.auth.currentUser!.email!,
                          style: Theme
                              .of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .background),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
             Obx(() =>
                bookController.isBookDeleting.value? Center(child: CircularProgressIndicator())
              : bookController.currentUserBooks.isNotEmpty?
               Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Books",
                        style: Theme
                            .of(context)
                            .textTheme
                            .labelMedium),
                    const SizedBox(height: 20),
                       Column(
                        children: bookController.currentUserBooks.map((e) {
                          return BookTile(
                            isProfile: true,
                            image: e.coverUrl!,
                            bookTitle: e.title!,
                            author: e.author!,
                            price: e.price!,
                            ratting: e.rating!,
                            id: e.id,
                            numberOfRatting: "20",
                            onTap: () {
                              Get.to(BookDetailPage(bookModel: e));
                            },
                          );
                        }).toList(),
                      ),
                  ],
                ),
              ):Center(child: NotUploadedBook()),
            )
          ],
        ),
      ),
    );
  }
}
