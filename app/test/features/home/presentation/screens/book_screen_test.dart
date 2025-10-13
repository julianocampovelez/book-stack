import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

import 'package:app/core/entities/either_entity.dart';
import 'package:app/core/env/config_env.dart';
import 'package:app/core/network/errors/failures.dart';
import 'package:app/features/home/domain/entities/book.dart';
import 'package:app/features/home/infrastructure/repositories/local_storage_repository_impl.dart';
import 'package:app/features/home/presentation/providers/providers.dart';
import 'package:app/features/home/presentation/screens/book_screen.dart';
import 'package:app/features/home/presentation/state/book_details_state.dart';

class MockScoreBooksRepository extends Mock
    implements LocalStorageRepositoryImpl {}

void main() {
  const String testIsbn = '1234567890';

  late MockScoreBooksRepository mockScoreBooksRepository;

  final Book mockBook = Book(
    title: 'Clean Architecture',
    subtitle: 'Eiusmod tempor',
    authors: 'Aliquip Excepteur',
    publisher: 'Pearson',
    language: 'English',
    isbn10: '0123456789',
    isbn13: testIsbn,
    pages: '100',
    year: '2022',
    rating: '5',
    desc: 'Dolore excepteur ullamco cupidatat irure in aliquip.',
    price: 45.00,
    image: 'https://example.com/image.jpg',
    url: 'https://example.com',
  );

  setUpAll(() async {
    await ConfigEnv.loadEnvironment();
  });

  setUp(() {
    mockScoreBooksRepository = MockScoreBooksRepository();
  });

  group('[BookDetailsScreen Tests]', () {
    testWidgets(
      'Displays a loading indicator while the workbook data is being fetched.',
      (tester) async {
        // Arrange
        final loadingState = BookDetailsMapState(
          books: {},
          failure: null,
          isLoading: true,
        );

        // Act
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              bookDetailsProvider.overrideWith((ref) {
                return BookDetailsNotifier(
                  getBookDetails: (_) async => Right(mockBook),
                )..state = loadingState;
              }),
              scoreBooksProvider.overrideWith((ref) {
                return ScoreBooksNotifier(
                  localStorageRepository: mockScoreBooksRepository,
                )..state = {testIsbn: 0};
              }),
            ],
            child: const MaterialApp(home: BookDetailsScreen(isbn13: testIsbn)),
          ),
        );

        // Assert
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );

    testWidgets(
      'Displays an error view when a Failure occurs while loading the book.',
      (tester) async {
        // Arrange
        final errorMessage = 'Error al cargar';
        final errorState = BookDetailsMapState(
          books: {},
          failure: UnknownFailure(errorMessage, -1),
          isLoading: false,
        );

        // Act
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              bookDetailsProvider.overrideWith((ref) {
                return BookDetailsNotifier(
                  getBookDetails: (_) async =>
                      Left(UnknownFailure(errorMessage, -1)),
                )..state = errorState;
              }),
              scoreBooksProvider.overrideWith((ref) {
                return ScoreBooksNotifier(
                  localStorageRepository: mockScoreBooksRepository,
                )..state = {testIsbn: 0};
              }),
            ],
            child: const MaterialApp(home: BookDetailsScreen(isbn13: testIsbn)),
          ),
        );

        await tester.pumpAndSettle();

        // Assert
        expect(find.textContaining(errorMessage), findsOneWidget);
      },
    );

    testWidgets('Displays the book details and its saved rating correctly.', (
      tester,
    ) async {
      // Arrange

      final loadedState = BookDetailsMapState(
        books: {testIsbn: mockBook},
        failure: null,
        isLoading: false,
      );

      // Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            bookDetailsProvider.overrideWith((ref) {
              return BookDetailsNotifier(
                getBookDetails: (_) async => Right(mockBook),
              )..state = loadedState;
            }),
            scoreBooksProvider.overrideWith((ref) {
              return ScoreBooksNotifier(
                localStorageRepository: mockScoreBooksRepository,
              )..state = {testIsbn: 3};
            }),
          ],
          child: const MaterialApp(home: BookDetailsScreen(isbn13: testIsbn)),
        ),
      );

      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Eiusmod tempor'), findsOneWidget);
      expect(find.textContaining('Aliquip Excepteur'), findsOneWidget);
      expect(find.textContaining('Pearson'), findsOneWidget);
      expect(find.byIcon(Icons.star), findsNWidgets(3));
    });
  });
}
