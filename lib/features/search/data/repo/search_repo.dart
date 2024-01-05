import 'package:dartz/dartz.dart';

import '../../../../core/Errors/failures.dart';
import '../../../../core/models/book_model/book_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> fetchSearchSata(
      {required String category});
}
