import 'package:flutter/material.dart';

import '../../../../../core/models/book_model/book_model.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating_widget.dart';
import 'custom_book_image.dart';
import 'details_book_buttons.dart';


class DetailsBookSection extends StatelessWidget {
  const DetailsBookSection({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.25),
            child:  CustomBookImage(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail??'',)),
        const SizedBox(
          height: 24,
        ),
         Text(
         bookModel.volumeInfo.title.toString(),
          textAlign: TextAlign.center,
          style: Styles.textStyle30,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo.authors.toString() ,
            style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
          BookRating(
             rating: bookModel.volumeInfo.averageRating??0,
              count: bookModel.volumeInfo.ratingsCount??0,
             mainAxisAlignment: MainAxisAlignment.center),
        const SizedBox(
          height: 18,
        ),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: BookAction(bookModel: bookModel),
        ),
      ],
    );
  }
}
