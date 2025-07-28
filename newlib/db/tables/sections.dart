import 'package:drift/drift.dart';

class Sections extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nameEn => text()();
  TextColumn get nameAr => text()();
  TextColumn get route => text()(); // the route like '/plamSunday'
  IntColumn get order => integer()();
}
