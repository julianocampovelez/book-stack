import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

import 'package:app/core/entities/either_entity.dart';
import 'package:app/core/env/config_env.dart';
import 'package:app/core/network/errors/failures.dart';
import 'package:app/features/home/domain/entities/book.dart';
import 'package:app/features/home/infrastructure/repositories/books_repository_impl.dart';
import 'package:app/features/home/presentation/providers/providers.dart';
import 'package:app/features/home/presentation/screens/home_screen.dart';

class MockBooksRepository extends Mock implements BooksRepositoryImpl {}

void main() {
  late MockBooksRepository mockRepository;

  setUpAll(() async {
    await ConfigEnv.loadEnvironment();
  });

  setUp(() {
    mockRepository = MockBooksRepository();
  });

  Widget createWidgetUnderTest(Widget child) {
    return ProviderScope(
      overrides: [booksRepositoryProvider.overrideWithValue(mockRepository)],
      child: MaterialApp(home: child),
    );
  }

  group('[HomeScreen Test]', () {
    testWidgets('Shows the books when the upload is successful.', (
      WidgetTester tester,
    ) async {
      // Arrange
      final books = [
        Book(
          title: 'Clean Code',
          subtitle: 'A Handbook of Agile Software Craftsmanship',
          isbn13: '9780132350884',
          price: 30.0,
          image: 'https://itbook.store/img/books/9780132350884.png',
          url: 'https://itbook.store/books/9780132350884',
        ),
      ];

      when(
        () => mockRepository.getBooks(),
      ).thenAnswer((_) async => Right(books));

      // Act
      await tester.pumpWidget(createWidgetUnderTest(const HomeScreen()));
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Assert
      expect(find.text('Clean Code'), findsOneWidget);
    });

    testWidgets('Shows an error message when a Failure occurs.', (
      WidgetTester tester,
    ) async {
      // Arrange
      when(
        () => mockRepository.getBooks(),
      ).thenAnswer((_) async => Left(UnknownFailure('Error al cargar', -1)));

      // Act
      await tester.pumpWidget(createWidgetUnderTest(const HomeScreen()));
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Assert
      expect(find.text('Error al cargar'), findsOneWidget);
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });

    testWidgets('Opens the SearchDelegate when the search button is pressed', (
      tester,
    ) async {
      final books = [
        Book(
          title: 'Clean Code',
          subtitle: 'A Handbook of Agile Software Craftsmanship',
          isbn13: '9780132350884',
          price: 30.0,
          image: 'https://itbook.store/img/books/9780132350884.png',
          url: 'https://itbook.store/books/9780132350884',
        ),
      ];
      when(
        () => mockRepository.getBooks(),
      ).thenAnswer((_) async => Right(books));

      when(() => mockRepository.searchBooks()).thenAnswer(
        (_) async => Right([
          Book(
            title: 'Domain-Driven Design',
            subtitle: 'Tackling Complexity in the Heart of Software',
            isbn13: '9780321125217',
            price: 42.0,
            image: 'https://itbook.store/img/books/9780321125217.png',
            url: 'https://itbook.store/books/9780321125217',
          ),
        ]),
      );

      await tester.pumpWidget(createWidgetUnderTest(const HomeScreen()));
      await tester.pump();

      final searchButton = find.byIcon(Icons.search);
      expect(searchButton, findsOneWidget);

      await tester.tap(searchButton);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.text('Buscar libros...'), findsOneWidget);
      expect(find.text('Domain-Driven Design'), findsOneWidget);
    });
  });
}
