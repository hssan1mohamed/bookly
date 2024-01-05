import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/search/persentaion/views/widgets/serach_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../home/presentaion/views/widgets/book_list_view_item.dart';
import '../../manager/search_cubit/search_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchTextField(onSubmitted: (e) {
          print(e);
        BlocProvider.of<SearchCubit>(context).fetchSimilarBooks(category: e);
        }),
       const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            'Results',
            style: Styles.textStyle18,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const SearchResultListView(),
      ],
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit,SearchState>(
      builder: (context, state) {
        if (state is SearchDone) {
          return Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: state.books.length,
                itemBuilder: (context, index) {

                  return  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child:BookListViewItem(bookModel: state.books[index]!),
                  );
                }),
          );
        }else if (state is SearchError) {
          return CustomErrorWidget(
            errMessage: state.error,
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
