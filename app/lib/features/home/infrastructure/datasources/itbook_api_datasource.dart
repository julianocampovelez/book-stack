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

  @override
  Future<Either<Failure, List<Book>>> getBooks({int page = 1}) async {
    try {
      final Response response = await _dio.get(NetworkPaths.getBooksPath(page));

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
          .map((bookItbook) => BookMapper.itbookToEntity(bookItbook))
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
  Future<Either<Failure, Book>> getBookByIsbn13(String isbn13) async {
    try {
      final Response response = await _dio.get(
        NetworkPaths.getBookByIsbn13Path(isbn13),
      );

      print('Response data: ${response.data}');

      print('Response status code: ${response.data.runtimeType}');

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
      print('Mapped response data: $responseData');

      final Book book = BookMapper.itbookDetailsToEntity(responseData);

      return Right(book);
    } on DioException catch (e) {
      final Failure failure = ErrorMapper.mapDioError(e);
      return Left(failure);
    } catch (e) {
      return Left(UnknownFailure(e.toString(), -1));
    }
  }
}
