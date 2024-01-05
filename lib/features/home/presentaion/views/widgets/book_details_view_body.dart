import 'package:flutter/material.dart';
import '../../../../../core/models/book_model/book_model.dart';
import 'custom_book_details_app_bar.dart';
import 'details_book_section1.dart';
import 'details_book_section2.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: BookDetailsCustomAppBar(),
            ),
            DetailsBookSection(bookModel: bookModel),
            const Expanded(
              child: SizedBox(
                height: 30,
              ),
            ),
            DetailsListViewSection(bookModel: bookModel),
          ],
        ),
      )
    ]);
  }
}
