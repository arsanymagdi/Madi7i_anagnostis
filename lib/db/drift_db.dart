import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/sections.dart';
import 'tables/readings.dart';

part 'drift_db.g.dart';

@DriftDatabase(tables: [Sections, Readings])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Sample insert method
  Future<void> addSampleSection() async {
    into(sections).insert(
      SectionsCompanion.insert(
        nameEn: 'Palm Sunday',
        nameAr: 'أحد الشعانين',
        route: '/palmSunday',
        order: 1,
      ),
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'madi7i_reader.db'));
    return NativeDatabase(file);
  });
}
