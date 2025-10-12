import 'package:flutter_riverpod/legacy.dart';

import 'package:app/features/home/domain/repositories/repositories.dart';
import 'package:app/features/home/presentation/providers/providers.dart';

final scoreBooksProvider =
    StateNotifierProvider<ScoreBooksNotifier, ScoreBooks>((ref) {
      final localStorageRepository = ref.watch(localStorageRepositoryProvider);
      return ScoreBooksNotifier(localStorageRepository: localStorageRepository);
    });

typedef ScoreBooks = Map<String, int>;

class ScoreBooksNotifier extends StateNotifier<ScoreBooks> {
  final LocalStorageRepository localStorageRepository;

  ScoreBooksNotifier({required this.localStorageRepository}) : super({});

  Future<void> loadScoreBook({required String isbn13}) async {
    if (state.containsKey(isbn13)) return;

    final score = await localStorageRepository.getScoreBook(isbn13);
    state = {...state, isbn13: score};
  }

  Future<void> setScoreBook({
    required String isbn13,
    required int score,
  }) async {
    if (state[isbn13] == score) return;

    await localStorageRepository.setScoreBook(isbn13: isbn13, score: score);
    state = {...state, isbn13: score};
  }
}
