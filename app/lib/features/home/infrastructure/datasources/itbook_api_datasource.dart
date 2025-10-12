import 'package:dio/dio.dart';

import 'package:app/core/entities/either_entity.dart';
import 'package:app/core/network/errors/error_mapper.dart';
import 'package:app/core/network/errors/failures.dart';
import 'package:app/core/utils/constants/http_status_code.dart';
import 'package:app/core/utils/constants/network_paths.dart';
import 'package:app/features/home/domain/datasources/datasources.dart';
import 'package:app/features/home/domain/entities/book.dart';
import 'package:app/features/home/infrastructure/mappers/book_mapper.dart';
import 'package:app/features/home/infrastructure/models/models.dart';

class ItbookApiDatasource extends BooksDatasource {
  final Dio _dio;
  ItbookApiDatasource(this._dio);

  Future<Either<Failure, List<Book>>> _fetchBooksFromPath(String path) async {
    try {
      final Response response = await _dio.get(path);

      if (response.statusCode != HttpStatusCode.ok) {
        print('hola');
        return Left(
          ServerFailure(
            "Error del servidor: ${response.statusMessage}",
            response.statusCode ?? -1,
          ),
        );
      }

      final ItbookResponse responseData = ItbookResponse.fromJson(
        response.data,
      );

      print(responseData);

      final List<Book> books = responseData.books
          .map(BookMapper.itbookToEntity)
          .toList();

      return Right(books);
    } on DioException catch (e) {
      final Failure failure = ErrorMapper.mapDioError(e);
      return Left(failure);
    } catch (e) {
      return Left(UnknownFailure(e.toString(), -1));
    }
  }

  @override
  Future<Either<Failure, List<Book>>> getBooks({int page = 1}) async {
    final String path = NetworkPaths.getBooksPath(page);
    return _fetchBooksFromPath(path);
  }

  @override
  Future<Either<Failure, Book>> getBookByIsbn13(String isbn13) async {
    try {
      final Response response = await _dio.get(
        NetworkPaths.getBookByIsbn13Path(isbn13),
      );

      if (response.statusCode != HttpStatusCode.ok) {
        return Left(
          ServerFailure(
            "Error del servidor: ${response.statusMessage}",
            response.statusCode ?? -1,
          ),
        );
      }

      final ItbookDetailsResponse responseData = ItbookDetailsResponse.fromJson(
        response.data,
      );

      final Book book = BookMapper.itbookDetailsToEntity(responseData);

      return Right(book);
    } on DioException catch (e) {
      final Failure failure = ErrorMapper.mapDioError(e);
      return Left(failure);
    } catch (e) {
      return Left(UnknownFailure(e.toString(), -1));
    }
  }

  @override
  Future<Either<Failure, List<Book>>> searchBooks({
    String query = '',
    int page = 1,
  }) async {
    final String path = NetworkPaths.searchBooksPath(query, page);
    return _fetchBooksFromPath(path);
  }
}
