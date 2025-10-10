import 'package:flutter_riverpod/legacy.dart';

enum PriceOrder { ascending, descending, none }

final sortBooksProvider = StateProvider<PriceOrder>((_) => PriceOrder.none);
