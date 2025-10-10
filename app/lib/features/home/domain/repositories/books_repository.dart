import 'package:app/core/entities/either_entity.dart';
import 'package:app/core/network/errors/failure.dart';
import 'package:app/features/home/domain/entities/entities.dart';

abstract class BooksRepository {
  Future<Either<Failure, List<Book>>> getBooks({int page = 1});
}
