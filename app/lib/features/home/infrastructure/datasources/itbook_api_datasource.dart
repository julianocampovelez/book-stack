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
  ItbookApiDatasource(this._dio);

  /// The HTTP client used to communicate with the Itbook API.
  final Dio _dio;

  // Internal helper function to fetch and map book lists from a given [path].
  ///
  /// Performs a `GET` request, validates the HTTP response, and maps the
  /// JSON data into a list of [Book] domain entities.
  Future<Either<Failure, List<Book>>> _fetchBooksFromPath(String path) async {
    try {
      final Response response = await _dio.get(path);

      if (response.statusCode != HttpStatusCode.ok) {
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

  /// Retrieves a paginated list of books from the Itbook API.
  ///
  /// [page] defines the page number to fetch (defaults to `1`).
  @override
  Future<Either<Failure, List<Book>>> getBooks({int page = 1}) async {
    final String path = NetworkPaths.getBooksPath(page);
    return _fetchBooksFromPath(path);
  }

  /// Retrieves detailed information about a specific book by its [isbn13].
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

  /// Searches for books in the Itbook API matching the given [query].
  ///
  /// Optionally supports pagination through the [page] parameter.
  @override
  Future<Either<Failure, List<Book>>> searchBooks({
    String query = '',
    int page = 1,
  }) async {
    final String path = NetworkPaths.searchBooksPath(query, page);
    return _fetchBooksFromPath(path);
  }
}
