part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchDone extends SearchState {
  final List <BookModel>books;

  SearchDone(this.books);
}

class SearchError extends SearchState {
  final String error;

  SearchError(this.error);
}
