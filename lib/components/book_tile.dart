import 'package:e_book_app/controller/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class BookTile extends StatelessWidget {
  final String image;
  final String bookTitle;
  final String author;
  final int price;
  final String ratting;
  final String numberOfRatting;
  final VoidCallback onTap;
  final bool isProfile;
  final String? id;
  const BookTile({super.key, required this.image, required this.bookTitle, required this.author, required this.price, required this.ratting, required this.numberOfRatting, required this.onTap, this.isProfile=false, this.id});

  @override
  Widget build(BuildContext context) {
    BookController bookController = Get.put(BookController());
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(2, 2)
                    )
                  ]
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  width: 100,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      bookTitle,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyLarge
                  ),
                  const SizedBox(height: 5),
                  Text(
                      "By : $author",
                      style: Theme.of(context).textTheme.labelMedium
                  ),const SizedBox(height: 5),
                  Text(
                    "Price : $price",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("Assets/Icons/star.svg"),
                          const SizedBox(width: 5),
                          Text(ratting),
                          const SizedBox(width: 10),
                          Text("($numberOfRatting)"),
                        ],
                      ),
                          Row(
                            children: [
                              isProfile?IconButton(onPressed: (){
                                Get.defaultDialog(
                                   contentPadding: EdgeInsets.all(20),
                                  title: "Delete",
                                  content: Text("Are you sure you want to delete this book", style: Theme.of(context).textTheme.bodyLarge,),
                                  cancel: ElevatedButton(onPressed: (){
                                    Get.back();
                                  }, child: const Text("Cencel")),
                                  barrierDismissible: false,
                                  confirm: ElevatedButton(onPressed: (){
                                    bookController.deleteBookByCustomId(id??"");
                                    Get.back();
                                  }, child: const Text("Ok")),
                                );
                              }, icon: const Icon(Icons.delete))
                                  : const SizedBox(),
                            ],
                          )

                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
