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

  // Add a sample section
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

  // Insert a reading (make sure en/ar/cop fields are present in the DB schema)
  Future<void> insertReading({
    required String en,
    required String ar,
    required String cop,
    required int sectionId,
    required int order,
  }) async {
    await into(readings).insert(
      ReadingsCompanion.insert(
        en: en,
        ar: ar,
        cop: cop,
        sectionId: sectionId,
        order: order,
      ),
    );
  }

  // Get a reading by English title (en field)
  Future<Reading?> getReadingByTitle(String titleEn) async {
    return (select(readings)..where((tbl) => tbl.en.equals(titleEn))).getSingleOrNull();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'madi7i_reader.db'));
    return NativeDatabase(file);
  });
}
