import 'package:e_book_app/Models/book_model.dart';
import 'package:flutter/material.dart';
class HeaderWidget extends StatelessWidget {
  final BookModel bookModel;
  const HeaderWidget({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(2, 2)
                )
              ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              bookModel.coverUrl.toString(),
              width: 170,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(bookModel.title!,style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.background),
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text("Author: ${bookModel.author}", style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.background),),
        const SizedBox(height: 20),
        Text("${bookModel.description}",
          maxLines: 2,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.background),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("Ratting",style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.background),),
                Text("12",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.background),)
              ],
            ),Column(
              children: [
                Text("Pages",style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.background),),
                Text(bookModel.pages.toString(),style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.background),)
              ],
            ),Column(
              children: [
                Text("Language",style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.background),),
                Text(bookModel.language!,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.background),)
              ],
            ),Column(
              children: [
                Text("Audio",style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.background),),
                Text(bookModel.audioLen!,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.background),)
              ],
            ),

          ],
        )
      ],
    );
  }
}
