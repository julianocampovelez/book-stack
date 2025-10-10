import 'package:app/core/entities/either_entity.dart';
import 'package:app/core/network/errors/failures.dart';
import 'package:app/features/home/domain/datasources/datasources.dart';
import 'package:app/features/home/domain/entities/book.dart';
import 'package:app/features/home/domain/repositories/repositories.dart';

class BooksRepositoryImpl extends BooksRepository {
  BooksRepositoryImpl(this.datasource);

  final BooksDatasource datasource;

  @override
  Future<Either<Failure, List<Book>>> getBooks({int page = 1}) {
    return datasource.getBooks(page: page);
  }
}
