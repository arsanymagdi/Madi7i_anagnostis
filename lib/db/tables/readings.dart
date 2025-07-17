import 'package:drift/drift.dart';
import 'sections.dart'; 


class Readings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sectionId => integer().references(Sections, #id)();
  TextColumn get en => text()();
  TextColumn get cop => text()();
  TextColumn get ar => text()();
  IntColumn get order => integer()();
}
