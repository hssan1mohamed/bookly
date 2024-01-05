import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'book_list_view_item.dart';
import 'custom_app_bar.dart';
import 'featured_list_view.dart';
import 'newest_book_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeaturedBookListView(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'Newest Books ',
                  style: Styles.textStyle18,
                ),
              ),
            ],
          ),
        ),
        NewestBooksListViewItem()
      ],
    );
  }
}
