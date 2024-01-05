import 'package:bloc/bloc.dart';
import 'package:bookly/features/search/data/repo/search_repo_imp.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/book_model/book_model.dart';


part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepoImp searchRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchSata(category: category);
    result.fold((failure) {
      emit(SearchError(failure.errorMessage));
    }, (books) {
      emit(SearchDone(books));
    });
  }
}
