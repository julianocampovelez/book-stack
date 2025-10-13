// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ScoreBooksTable extends ScoreBooks
    with TableInfo<$ScoreBooksTable, ScoreBook> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScoreBooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _isbn13Meta = const VerificationMeta('isbn13');
  @override
  late final GeneratedColumn<String> isbn13 = GeneratedColumn<String>(
    'isbn13',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, isbn13, score];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'score_books';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScoreBook> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('isbn13')) {
      context.handle(
        _isbn13Meta,
        isbn13.isAcceptableOrUnknown(data['isbn13']!, _isbn13Meta),
      );
    } else if (isInserting) {
      context.missing(_isbn13Meta);
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {isbn13};
  @override
  ScoreBook map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScoreBook(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      isbn13: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}isbn13'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}score'],
      )!,
    );
  }

  @override
  $ScoreBooksTable createAlias(String alias) {
    return $ScoreBooksTable(attachedDatabase, alias);
  }
}

class ScoreBook extends DataClass implements Insertable<ScoreBook> {
  final int id;
  final String isbn13;
  final int score;
  const ScoreBook({
    required this.id,
    required this.isbn13,
    required this.score,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['isbn13'] = Variable<String>(isbn13);
    map['score'] = Variable<int>(score);
    return map;
  }

  ScoreBooksCompanion toCompanion(bool nullToAbsent) {
    return ScoreBooksCompanion(
      id: Value(id),
      isbn13: Value(isbn13),
      score: Value(score),
    );
  }

  factory ScoreBook.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScoreBook(
      id: serializer.fromJson<int>(json['id']),
      isbn13: serializer.fromJson<String>(json['isbn13']),
      score: serializer.fromJson<int>(json['score']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'isbn13': serializer.toJson<String>(isbn13),
      'score': serializer.toJson<int>(score),
    };
  }

  ScoreBook copyWith({int? id, String? isbn13, int? score}) => ScoreBook(
    id: id ?? this.id,
    isbn13: isbn13 ?? this.isbn13,
    score: score ?? this.score,
  );
  ScoreBook copyWithCompanion(ScoreBooksCompanion data) {
    return ScoreBook(
      id: data.id.present ? data.id.value : this.id,
      isbn13: data.isbn13.present ? data.isbn13.value : this.isbn13,
      score: data.score.present ? data.score.value : this.score,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScoreBook(')
          ..write('id: $id, ')
          ..write('isbn13: $isbn13, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, isbn13, score);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScoreBook &&
          other.id == this.id &&
          other.isbn13 == this.isbn13 &&
          other.score == this.score);
}

class ScoreBooksCompanion extends UpdateCompanion<ScoreBook> {
  final Value<int> id;
  final Value<String> isbn13;
  final Value<int> score;
  final Value<int> rowid;
  const ScoreBooksCompanion({
    this.id = const Value.absent(),
    this.isbn13 = const Value.absent(),
    this.score = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScoreBooksCompanion.insert({
    required int id,
    required String isbn13,
    this.score = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       isbn13 = Value(isbn13);
  static Insertable<ScoreBook> custom({
    Expression<int>? id,
    Expression<String>? isbn13,
    Expression<int>? score,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isbn13 != null) 'isbn13': isbn13,
      if (score != null) 'score': score,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScoreBooksCompanion copyWith({
    Value<int>? id,
    Value<String>? isbn13,
    Value<int>? score,
    Value<int>? rowid,
  }) {
    return ScoreBooksCompanion(
      id: id ?? this.id,
      isbn13: isbn13 ?? this.isbn13,
      score: score ?? this.score,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isbn13.present) {
      map['isbn13'] = Variable<String>(isbn13.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScoreBooksCompanion(')
          ..write('id: $id, ')
          ..write('isbn13: $isbn13, ')
          ..write('score: $score, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ScoreBooksTable scoreBooks = $ScoreBooksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [scoreBooks];
}

typedef $$ScoreBooksTableCreateCompanionBuilder =
    ScoreBooksCompanion Function({
      required int id,
      required String isbn13,
      Value<int> score,
      Value<int> rowid,
    });
typedef $$ScoreBooksTableUpdateCompanionBuilder =
    ScoreBooksCompanion Function({
      Value<int> id,
      Value<String> isbn13,
      Value<int> score,
      Value<int> rowid,
    });

class $$ScoreBooksTableFilterComposer
    extends Composer<_$AppDatabase, $ScoreBooksTable> {
  $$ScoreBooksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get isbn13 => $composableBuilder(
    column: $table.isbn13,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ScoreBooksTableOrderingComposer
    extends Composer<_$AppDatabase, $ScoreBooksTable> {
  $$ScoreBooksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get isbn13 => $composableBuilder(
    column: $table.isbn13,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ScoreBooksTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScoreBooksTable> {
  $$ScoreBooksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get isbn13 =>
      $composableBuilder(column: $table.isbn13, builder: (column) => column);

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);
}

class $$ScoreBooksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScoreBooksTable,
          ScoreBook,
          $$ScoreBooksTableFilterComposer,
          $$ScoreBooksTableOrderingComposer,
          $$ScoreBooksTableAnnotationComposer,
          $$ScoreBooksTableCreateCompanionBuilder,
          $$ScoreBooksTableUpdateCompanionBuilder,
          (
            ScoreBook,
            BaseReferences<_$AppDatabase, $ScoreBooksTable, ScoreBook>,
          ),
          ScoreBook,
          PrefetchHooks Function()
        > {
  $$ScoreBooksTableTableManager(_$AppDatabase db, $ScoreBooksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScoreBooksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScoreBooksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScoreBooksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> isbn13 = const Value.absent(),
                Value<int> score = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ScoreBooksCompanion(
                id: id,
                isbn13: isbn13,
                score: score,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required String isbn13,
                Value<int> score = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ScoreBooksCompanion.insert(
                id: id,
                isbn13: isbn13,
                score: score,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ScoreBooksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScoreBooksTable,
      ScoreBook,
      $$ScoreBooksTableFilterComposer,
      $$ScoreBooksTableOrderingComposer,
      $$ScoreBooksTableAnnotationComposer,
      $$ScoreBooksTableCreateCompanionBuilder,
      $$ScoreBooksTableUpdateCompanionBuilder,
      (ScoreBook, BaseReferences<_$AppDatabase, $ScoreBooksTable, ScoreBook>),
      ScoreBook,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ScoreBooksTableTableManager get scoreBooks =>
      $$ScoreBooksTableTableManager(_db, _db.scoreBooks);
}
