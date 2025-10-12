import 'package:app/features/home/domain/repositories/repositories.dart';
import 'package:app/features/home/infrastructure/datasources/drift_local_storage_datasource.dart';
import 'package:app/features/home/infrastructure/repositories/repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localSorageRepositoryProvider = Provider<LocalStorageRepository>((ref) {
  return LocalStorageRepositoryImpl(DriftLocalStorageDatasource());
});
