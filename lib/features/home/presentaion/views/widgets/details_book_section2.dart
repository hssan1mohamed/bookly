import 'package:flutter/material.dart';

import '../../../../../core/models/book_model/book_model.dart';
import '../../../../../core/utils/styles.dart';
import 'details_list_view_book.dart';

class DetailsListViewSection extends StatelessWidget {
  const DetailsListViewSection({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 30,vertical: 12),
          child: Text(
            'You Can Also Like',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const DetailsListViewBook(),
      ],
    );
  }
}
