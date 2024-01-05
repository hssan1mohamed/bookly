import 'package:flutter/material.dart';
import '../../../../../core/models/book_model/book_model.dart';
import '../../../../../core/utils/function/launch_url.dart';
import '../../../../../core/widgets/custom_button.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Expanded(
            child: CustomButton(
          text:'Free',

          backgroundColor: Colors.white,
          textColor: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
        )),
        Expanded(
            child: CustomButton(
              onPressed: () {
                launchCustomUr(context, bookModel.volumeInfo.previewLink);
              },
          text: 'Preview',
          fontSize: 16,
          backgroundColor: Colors.orangeAccent,
          textColor: Colors.white,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
        )),
      ],
    );
  }
}
