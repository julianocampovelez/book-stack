import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app/core/network/dio_network.dart';
import 'package:app/features/home/infrastructure/datasources/itbook_api_datasource.dart';
import 'package:app/features/home/infrastructure/repositories/books_repository_impl.dart';

final dioProvider = Provider<DioNetwork>((ref) => DioNetwork());

final booksRepositoryProvider = Provider<BooksRepositoryImpl>(
  (ref) =>
      BooksRepositoryImpl(ItbookApiDatasource(ref.read(dioProvider).client)),
);
