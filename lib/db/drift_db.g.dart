// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_db.dart';

// ignore_for_file: type=lint
class $SectionsTable extends Sections with TableInfo<$SectionsTable, Section>{
@override final GeneratedDatabase attachedDatabase;
final String? _alias;
$SectionsTable(this.attachedDatabase, [this._alias]);
static const VerificationMeta _idMeta = const VerificationMeta('id');
@override
late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false, hasAutoIncrement: true, type: DriftSqlType.int, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
@override
late final GeneratedColumn<String> nameEn = GeneratedColumn<String>('name_en', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: true);
static const VerificationMeta _nameArMeta = const VerificationMeta('nameAr');
@override
late final GeneratedColumn<String> nameAr = GeneratedColumn<String>('name_ar', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: true);
static const VerificationMeta _routeMeta = const VerificationMeta('route');
@override
late final GeneratedColumn<String> route = GeneratedColumn<String>('route', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: true);
static const VerificationMeta _orderMeta = const VerificationMeta('order');
@override
late final GeneratedColumn<int> order = GeneratedColumn<int>('order', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: true);
@override
List<GeneratedColumn> get $columns => [id, nameEn, nameAr, route, order];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'sections';
@override
VerificationContext validateIntegrity(Insertable<Section> instance, {bool isInserting = false}) {
final context = VerificationContext();
final data = instance.toColumns(true);
if (data.containsKey('id')) {
context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));}if (data.containsKey('name_en')) {
context.handle(_nameEnMeta, nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));} else if (isInserting) {
context.missing(_nameEnMeta);
}
if (data.containsKey('name_ar')) {
context.handle(_nameArMeta, nameAr.isAcceptableOrUnknown(data['name_ar']!, _nameArMeta));} else if (isInserting) {
context.missing(_nameArMeta);
}
if (data.containsKey('route')) {
context.handle(_routeMeta, route.isAcceptableOrUnknown(data['route']!, _routeMeta));} else if (isInserting) {
context.missing(_routeMeta);
}
if (data.containsKey('order')) {
context.handle(_orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));} else if (isInserting) {
context.missing(_orderMeta);
}
return context;
}
@override
Set<GeneratedColumn> get $primaryKey => {id};
@override Section map(Map<String, dynamic> data, {String? tablePrefix})  {
final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';return Section(id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!, nameEn: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}name_en'])!, nameAr: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}name_ar'])!, route: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}route'])!, order: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}order'])!, );
}
@override
$SectionsTable createAlias(String alias) {
return $SectionsTable(attachedDatabase, alias);}}class Section extends DataClass implements Insertable<Section> 
{
final int id;
final String nameEn;
final String nameAr;
final String route;
final int order;
const Section({required this.id, required this.nameEn, required this.nameAr, required this.route, required this.order});@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};map['id'] = Variable<int>(id);
map['name_en'] = Variable<String>(nameEn);
map['name_ar'] = Variable<String>(nameAr);
map['route'] = Variable<String>(route);
map['order'] = Variable<int>(order);
return map; 
}
SectionsCompanion toCompanion(bool nullToAbsent) {
return SectionsCompanion(id: Value(id),nameEn: Value(nameEn),nameAr: Value(nameAr),route: Value(route),order: Value(order),);
}
factory Section.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return Section(id: serializer.fromJson<int>(json['id']),nameEn: serializer.fromJson<String>(json['nameEn']),nameAr: serializer.fromJson<String>(json['nameAr']),route: serializer.fromJson<String>(json['route']),order: serializer.fromJson<int>(json['order']),);}
@override Map<String, dynamic> toJson({ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return <String, dynamic>{
'id': serializer.toJson<int>(id),'nameEn': serializer.toJson<String>(nameEn),'nameAr': serializer.toJson<String>(nameAr),'route': serializer.toJson<String>(route),'order': serializer.toJson<int>(order),};}Section copyWith({int? id,String? nameEn,String? nameAr,String? route,int? order}) => Section(id: id ?? this.id,nameEn: nameEn ?? this.nameEn,nameAr: nameAr ?? this.nameAr,route: route ?? this.route,order: order ?? this.order,);Section copyWithCompanion(SectionsCompanion data) {
return Section(
id: data.id.present ? data.id.value : this.id,nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,nameAr: data.nameAr.present ? data.nameAr.value : this.nameAr,route: data.route.present ? data.route.value : this.route,order: data.order.present ? data.order.value : this.order,);
}
@override
String toString() {return (StringBuffer('Section(')..write('id: $id, ')..write('nameEn: $nameEn, ')..write('nameAr: $nameAr, ')..write('route: $route, ')..write('order: $order')..write(')')).toString();}
@override
 int get hashCode => Object.hash(id, nameEn, nameAr, route, order);@override
bool operator ==(Object other) => identical(this, other) || (other is Section && other.id == this.id && other.nameEn == this.nameEn && other.nameAr == this.nameAr && other.route == this.route && other.order == this.order);
}class SectionsCompanion extends UpdateCompanion<Section> {
final Value<int> id;
final Value<String> nameEn;
final Value<String> nameAr;
final Value<String> route;
final Value<int> order;
const SectionsCompanion({this.id = const Value.absent(),this.nameEn = const Value.absent(),this.nameAr = const Value.absent(),this.route = const Value.absent(),this.order = const Value.absent(),});
SectionsCompanion.insert({this.id = const Value.absent(),required String nameEn,required String nameAr,required String route,required int order,}): nameEn = Value(nameEn), nameAr = Value(nameAr), route = Value(route), order = Value(order);
static Insertable<Section> custom({Expression<int>? id, 
Expression<String>? nameEn, 
Expression<String>? nameAr, 
Expression<String>? route, 
Expression<int>? order, 
}) {
return RawValuesInsertable({if (id != null)'id': id,if (nameEn != null)'name_en': nameEn,if (nameAr != null)'name_ar': nameAr,if (route != null)'route': route,if (order != null)'order': order,});
}SectionsCompanion copyWith({Value<int>? id, Value<String>? nameEn, Value<String>? nameAr, Value<String>? route, Value<int>? order}) {
return SectionsCompanion(id: id ?? this.id,nameEn: nameEn ?? this.nameEn,nameAr: nameAr ?? this.nameAr,route: route ?? this.route,order: order ?? this.order,);
}
@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};if (id.present) {
map['id'] = Variable<int>(id.value);}
if (nameEn.present) {
map['name_en'] = Variable<String>(nameEn.value);}
if (nameAr.present) {
map['name_ar'] = Variable<String>(nameAr.value);}
if (route.present) {
map['route'] = Variable<String>(route.value);}
if (order.present) {
map['order'] = Variable<int>(order.value);}
return map; 
}
@override
String toString() {return (StringBuffer('SectionsCompanion(')..write('id: $id, ')..write('nameEn: $nameEn, ')..write('nameAr: $nameAr, ')..write('route: $route, ')..write('order: $order')..write(')')).toString();}
}
class $ReadingsTable extends Readings with TableInfo<$ReadingsTable, Reading>{
@override final GeneratedDatabase attachedDatabase;
final String? _alias;
$ReadingsTable(this.attachedDatabase, [this._alias]);
static const VerificationMeta _idMeta = const VerificationMeta('id');
@override
late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false, hasAutoIncrement: true, type: DriftSqlType.int, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
static const VerificationMeta _sectionIdMeta = const VerificationMeta('sectionId');
@override
late final GeneratedColumn<int> sectionId = GeneratedColumn<int>('section_id', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: true);
static const VerificationMeta _enMeta = const VerificationMeta('en');
@override
late final GeneratedColumn<String> en = GeneratedColumn<String>('en', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: true);
static const VerificationMeta _copMeta = const VerificationMeta('cop');
@override
late final GeneratedColumn<String> cop = GeneratedColumn<String>('cop', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: true);
static const VerificationMeta _arMeta = const VerificationMeta('ar');
@override
late final GeneratedColumn<String> ar = GeneratedColumn<String>('ar', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: true);
static const VerificationMeta _orderMeta = const VerificationMeta('order');
@override
late final GeneratedColumn<int> order = GeneratedColumn<int>('order', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: true);
@override
List<GeneratedColumn> get $columns => [id, sectionId, en, cop, ar, order];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'readings';
@override
VerificationContext validateIntegrity(Insertable<Reading> instance, {bool isInserting = false}) {
final context = VerificationContext();
final data = instance.toColumns(true);
if (data.containsKey('id')) {
context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));}if (data.containsKey('section_id')) {
context.handle(_sectionIdMeta, sectionId.isAcceptableOrUnknown(data['section_id']!, _sectionIdMeta));} else if (isInserting) {
context.missing(_sectionIdMeta);
}
if (data.containsKey('en')) {
context.handle(_enMeta, en.isAcceptableOrUnknown(data['en']!, _enMeta));} else if (isInserting) {
context.missing(_enMeta);
}
if (data.containsKey('cop')) {
context.handle(_copMeta, cop.isAcceptableOrUnknown(data['cop']!, _copMeta));} else if (isInserting) {
context.missing(_copMeta);
}
if (data.containsKey('ar')) {
context.handle(_arMeta, ar.isAcceptableOrUnknown(data['ar']!, _arMeta));} else if (isInserting) {
context.missing(_arMeta);
}
if (data.containsKey('order')) {
context.handle(_orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));} else if (isInserting) {
context.missing(_orderMeta);
}
return context;
}
@override
Set<GeneratedColumn> get $primaryKey => {id};
@override Reading map(Map<String, dynamic> data, {String? tablePrefix})  {
final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';return Reading(id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!, sectionId: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}section_id'])!, en: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}en'])!, cop: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}cop'])!, ar: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}ar'])!, order: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}order'])!, );
}
@override
$ReadingsTable createAlias(String alias) {
return $ReadingsTable(attachedDatabase, alias);}}class Reading extends DataClass implements Insertable<Reading> 
{
final int id;
final int sectionId;
final String en;
final String cop;
final String ar;
final int order;
const Reading({required this.id, required this.sectionId, required this.en, required this.cop, required this.ar, required this.order});@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};map['id'] = Variable<int>(id);
map['section_id'] = Variable<int>(sectionId);
map['en'] = Variable<String>(en);
map['cop'] = Variable<String>(cop);
map['ar'] = Variable<String>(ar);
map['order'] = Variable<int>(order);
return map; 
}
ReadingsCompanion toCompanion(bool nullToAbsent) {
return ReadingsCompanion(id: Value(id),sectionId: Value(sectionId),en: Value(en),cop: Value(cop),ar: Value(ar),order: Value(order),);
}
factory Reading.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return Reading(id: serializer.fromJson<int>(json['id']),sectionId: serializer.fromJson<int>(json['sectionId']),en: serializer.fromJson<String>(json['en']),cop: serializer.fromJson<String>(json['cop']),ar: serializer.fromJson<String>(json['ar']),order: serializer.fromJson<int>(json['order']),);}
@override Map<String, dynamic> toJson({ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return <String, dynamic>{
'id': serializer.toJson<int>(id),'sectionId': serializer.toJson<int>(sectionId),'en': serializer.toJson<String>(en),'cop': serializer.toJson<String>(cop),'ar': serializer.toJson<String>(ar),'order': serializer.toJson<int>(order),};}Reading copyWith({int? id,int? sectionId,String? en,String? cop,String? ar,int? order}) => Reading(id: id ?? this.id,sectionId: sectionId ?? this.sectionId,en: en ?? this.en,cop: cop ?? this.cop,ar: ar ?? this.ar,order: order ?? this.order,);Reading copyWithCompanion(ReadingsCompanion data) {
return Reading(
id: data.id.present ? data.id.value : this.id,sectionId: data.sectionId.present ? data.sectionId.value : this.sectionId,en: data.en.present ? data.en.value : this.en,cop: data.cop.present ? data.cop.value : this.cop,ar: data.ar.present ? data.ar.value : this.ar,order: data.order.present ? data.order.value : this.order,);
}
@override
String toString() {return (StringBuffer('Reading(')..write('id: $id, ')..write('sectionId: $sectionId, ')..write('en: $en, ')..write('cop: $cop, ')..write('ar: $ar, ')..write('order: $order')..write(')')).toString();}
@override
 int get hashCode => Object.hash(id, sectionId, en, cop, ar, order);@override
bool operator ==(Object other) => identical(this, other) || (other is Reading && other.id == this.id && other.sectionId == this.sectionId && other.en == this.en && other.cop == this.cop && other.ar == this.ar && other.order == this.order);
}class ReadingsCompanion extends UpdateCompanion<Reading> {
final Value<int> id;
final Value<int> sectionId;
final Value<String> en;
final Value<String> cop;
final Value<String> ar;
final Value<int> order;
const ReadingsCompanion({this.id = const Value.absent(),this.sectionId = const Value.absent(),this.en = const Value.absent(),this.cop = const Value.absent(),this.ar = const Value.absent(),this.order = const Value.absent(),});
ReadingsCompanion.insert({this.id = const Value.absent(),required int sectionId,required String en,required String cop,required String ar,required int order,}): sectionId = Value(sectionId), en = Value(en), cop = Value(cop), ar = Value(ar), order = Value(order);
static Insertable<Reading> custom({Expression<int>? id, 
Expression<int>? sectionId, 
Expression<String>? en, 
Expression<String>? cop, 
Expression<String>? ar, 
Expression<int>? order, 
}) {
return RawValuesInsertable({if (id != null)'id': id,if (sectionId != null)'section_id': sectionId,if (en != null)'en': en,if (cop != null)'cop': cop,if (ar != null)'ar': ar,if (order != null)'order': order,});
}ReadingsCompanion copyWith({Value<int>? id, Value<int>? sectionId, Value<String>? en, Value<String>? cop, Value<String>? ar, Value<int>? order}) {
return ReadingsCompanion(id: id ?? this.id,sectionId: sectionId ?? this.sectionId,en: en ?? this.en,cop: cop ?? this.cop,ar: ar ?? this.ar,order: order ?? this.order,);
}
@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};if (id.present) {
map['id'] = Variable<int>(id.value);}
if (sectionId.present) {
map['section_id'] = Variable<int>(sectionId.value);}
if (en.present) {
map['en'] = Variable<String>(en.value);}
if (cop.present) {
map['cop'] = Variable<String>(cop.value);}
if (ar.present) {
map['ar'] = Variable<String>(ar.value);}
if (order.present) {
map['order'] = Variable<int>(order.value);}
return map; 
}
@override
String toString() {return (StringBuffer('ReadingsCompanion(')..write('id: $id, ')..write('sectionId: $sectionId, ')..write('en: $en, ')..write('cop: $cop, ')..write('ar: $ar, ')..write('order: $order')..write(')')).toString();}
}
abstract class _$AppDatabase extends GeneratedDatabase{
_$AppDatabase(QueryExecutor e): super(e);
$AppDatabaseManager get managers => $AppDatabaseManager(this);
late final $SectionsTable sections = $SectionsTable(this);
late final $ReadingsTable readings = $ReadingsTable(this);
@override
Iterable<TableInfo<Table, Object?>> get allTables => allSchemaEntities.whereType<TableInfo<Table, Object?>>();
@override
List<DatabaseSchemaEntity> get allSchemaEntities => [sections, readings];
}
typedef $$SectionsTableCreateCompanionBuilder = SectionsCompanion Function({Value<int> id,required String nameEn,required String nameAr,required String route,required int order,});
typedef $$SectionsTableUpdateCompanionBuilder = SectionsCompanion Function({Value<int> id,Value<String> nameEn,Value<String> nameAr,Value<String> route,Value<int> order,});
class $$SectionsTableFilterComposer extends Composer<
        _$AppDatabase,
        $SectionsTable> {
        $$SectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          ColumnFilters<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) =>
      ColumnFilters(column));
      
ColumnFilters<String> get nameEn => $composableBuilder(
      column: $table.nameEn,
      builder: (column) =>
      ColumnFilters(column));
      
ColumnFilters<String> get nameAr => $composableBuilder(
      column: $table.nameAr,
      builder: (column) =>
      ColumnFilters(column));
      
ColumnFilters<String> get route => $composableBuilder(
      column: $table.route,
      builder: (column) =>
      ColumnFilters(column));
      
ColumnFilters<int> get order => $composableBuilder(
      column: $table.order,
      builder: (column) =>
      ColumnFilters(column));
      
        }
      class $$SectionsTableOrderingComposer extends Composer<
        _$AppDatabase,
        $SectionsTable> {
        $$SectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) =>
      ColumnOrderings(column));
      
ColumnOrderings<String> get nameEn => $composableBuilder(
      column: $table.nameEn,
      builder: (column) =>
      ColumnOrderings(column));
      
ColumnOrderings<String> get nameAr => $composableBuilder(
      column: $table.nameAr,
      builder: (column) =>
      ColumnOrderings(column));
      
ColumnOrderings<String> get route => $composableBuilder(
      column: $table.route,
      builder: (column) =>
      ColumnOrderings(column));
      
ColumnOrderings<int> get order => $composableBuilder(
      column: $table.order,
      builder: (column) =>
      ColumnOrderings(column));
      
        }
      class $$SectionsTableAnnotationComposer extends Composer<
        _$AppDatabase,
        $SectionsTable> {
        $$SectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          GeneratedColumn<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) => column);
      
GeneratedColumn<String> get nameEn => $composableBuilder(
      column: $table.nameEn,
      builder: (column) => column);
      
GeneratedColumn<String> get nameAr => $composableBuilder(
      column: $table.nameAr,
      builder: (column) => column);
      
GeneratedColumn<String> get route => $composableBuilder(
      column: $table.route,
      builder: (column) => column);
      
GeneratedColumn<int> get order => $composableBuilder(
      column: $table.order,
      builder: (column) => column);
      
        }
      class $$SectionsTableTableManager extends RootTableManager    <_$AppDatabase,
    $SectionsTable,
    Section,
    $$SectionsTableFilterComposer,
    $$SectionsTableOrderingComposer,
    $$SectionsTableAnnotationComposer,
    $$SectionsTableCreateCompanionBuilder,
    $$SectionsTableUpdateCompanionBuilder,
    (Section,BaseReferences<_$AppDatabase,$SectionsTable,Section>),
    Section,
    PrefetchHooks Function()
    > {
    $$SectionsTableTableManager(_$AppDatabase db, $SectionsTable table) : super(
      TableManagerState(
        db: db,
        table: table,
        createFilteringComposer: () => $$SectionsTableFilterComposer($db: db,$table:table),
        createOrderingComposer: () => $$SectionsTableOrderingComposer($db: db,$table:table),
        createComputedFieldComposer: () => $$SectionsTableAnnotationComposer($db: db,$table:table),
        updateCompanionCallback: ({Value<int> id = const Value.absent(),Value<String> nameEn = const Value.absent(),Value<String> nameAr = const Value.absent(),Value<String> route = const Value.absent(),Value<int> order = const Value.absent(),})=> SectionsCompanion(id: id,nameEn: nameEn,nameAr: nameAr,route: route,order: order,),
        createCompanionCallback: ({Value<int> id = const Value.absent(),required String nameEn,required String nameAr,required String route,required int order,})=> SectionsCompanion.insert(id: id,nameEn: nameEn,nameAr: nameAr,route: route,order: order,),
        withReferenceMapper: (p0) => p0
              .map(
                  (e) =>
                     (e.readTable(table), BaseReferences(db, table, e))
                  )
              .toList(),
        prefetchHooksCallback: null,
        ));
        }
    typedef $$SectionsTableProcessedTableManager = ProcessedTableManager    <_$AppDatabase,
    $SectionsTable,
    Section,
    $$SectionsTableFilterComposer,
    $$SectionsTableOrderingComposer,
    $$SectionsTableAnnotationComposer,
    $$SectionsTableCreateCompanionBuilder,
    $$SectionsTableUpdateCompanionBuilder,
    (Section,BaseReferences<_$AppDatabase,$SectionsTable,Section>),
    Section,
    PrefetchHooks Function()
    >;typedef $$ReadingsTableCreateCompanionBuilder = ReadingsCompanion Function({Value<int> id,required int sectionId,required String en,required String cop,required String ar,required int order,});
typedef $$ReadingsTableUpdateCompanionBuilder = ReadingsCompanion Function({Value<int> id,Value<int> sectionId,Value<String> en,Value<String> cop,Value<String> ar,Value<int> order,});
class $$ReadingsTableFilterComposer extends Composer<
        _$AppDatabase,
        $ReadingsTable> {
        $$ReadingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          ColumnFilters<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) =>
      ColumnFilters(column));
      
ColumnFilters<int> get sectionId => $composableBuilder(
      column: $table.sectionId,
      builder: (column) =>
      ColumnFilters(column));
      
ColumnFilters<String> get en => $composableBuilder(
      column: $table.en,
      builder: (column) =>
      ColumnFilters(column));
      
ColumnFilters<String> get cop => $composableBuilder(
      column: $table.cop,
      builder: (column) =>
      ColumnFilters(column));
      
ColumnFilters<String> get ar => $composableBuilder(
      column: $table.ar,
      builder: (column) =>
      ColumnFilters(column));
      
ColumnFilters<int> get order => $composableBuilder(
      column: $table.order,
      builder: (column) =>
      ColumnFilters(column));
      
        }
      class $$ReadingsTableOrderingComposer extends Composer<
        _$AppDatabase,
        $ReadingsTable> {
        $$ReadingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) =>
      ColumnOrderings(column));
      
ColumnOrderings<int> get sectionId => $composableBuilder(
      column: $table.sectionId,
      builder: (column) =>
      ColumnOrderings(column));
      
ColumnOrderings<String> get en => $composableBuilder(
      column: $table.en,
      builder: (column) =>
      ColumnOrderings(column));
      
ColumnOrderings<String> get cop => $composableBuilder(
      column: $table.cop,
      builder: (column) =>
      ColumnOrderings(column));
      
ColumnOrderings<String> get ar => $composableBuilder(
      column: $table.ar,
      builder: (column) =>
      ColumnOrderings(column));
      
ColumnOrderings<int> get order => $composableBuilder(
      column: $table.order,
      builder: (column) =>
      ColumnOrderings(column));
      
        }
      class $$ReadingsTableAnnotationComposer extends Composer<
        _$AppDatabase,
        $ReadingsTable> {
        $$ReadingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          GeneratedColumn<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) => column);
      
GeneratedColumn<int> get sectionId => $composableBuilder(
      column: $table.sectionId,
      builder: (column) => column);
      
GeneratedColumn<String> get en => $composableBuilder(
      column: $table.en,
      builder: (column) => column);
      
GeneratedColumn<String> get cop => $composableBuilder(
      column: $table.cop,
      builder: (column) => column);
      
GeneratedColumn<String> get ar => $composableBuilder(
      column: $table.ar,
      builder: (column) => column);
      
GeneratedColumn<int> get order => $composableBuilder(
      column: $table.order,
      builder: (column) => column);
      
        }
      class $$ReadingsTableTableManager extends RootTableManager    <_$AppDatabase,
    $ReadingsTable,
    Reading,
    $$ReadingsTableFilterComposer,
    $$ReadingsTableOrderingComposer,
    $$ReadingsTableAnnotationComposer,
    $$ReadingsTableCreateCompanionBuilder,
    $$ReadingsTableUpdateCompanionBuilder,
    (Reading,BaseReferences<_$AppDatabase,$ReadingsTable,Reading>),
    Reading,
    PrefetchHooks Function()
    > {
    $$ReadingsTableTableManager(_$AppDatabase db, $ReadingsTable table) : super(
      TableManagerState(
        db: db,
        table: table,
        createFilteringComposer: () => $$ReadingsTableFilterComposer($db: db,$table:table),
        createOrderingComposer: () => $$ReadingsTableOrderingComposer($db: db,$table:table),
        createComputedFieldComposer: () => $$ReadingsTableAnnotationComposer($db: db,$table:table),
        updateCompanionCallback: ({Value<int> id = const Value.absent(),Value<int> sectionId = const Value.absent(),Value<String> en = const Value.absent(),Value<String> cop = const Value.absent(),Value<String> ar = const Value.absent(),Value<int> order = const Value.absent(),})=> ReadingsCompanion(id: id,sectionId: sectionId,en: en,cop: cop,ar: ar,order: order,),
        createCompanionCallback: ({Value<int> id = const Value.absent(),required int sectionId,required String en,required String cop,required String ar,required int order,})=> ReadingsCompanion.insert(id: id,sectionId: sectionId,en: en,cop: cop,ar: ar,order: order,),
        withReferenceMapper: (p0) => p0
              .map(
                  (e) =>
                     (e.readTable(table), BaseReferences(db, table, e))
                  )
              .toList(),
        prefetchHooksCallback: null,
        ));
        }
    typedef $$ReadingsTableProcessedTableManager = ProcessedTableManager    <_$AppDatabase,
    $ReadingsTable,
    Reading,
    $$ReadingsTableFilterComposer,
    $$ReadingsTableOrderingComposer,
    $$ReadingsTableAnnotationComposer,
    $$ReadingsTableCreateCompanionBuilder,
    $$ReadingsTableUpdateCompanionBuilder,
    (Reading,BaseReferences<_$AppDatabase,$ReadingsTable,Reading>),
    Reading,
    PrefetchHooks Function()
    >;class $AppDatabaseManager {
final _$AppDatabase _db;
$AppDatabaseManager(this._db);
$$SectionsTableTableManager get sections => $$SectionsTableTableManager(_db, _db.sections);
$$ReadingsTableTableManager get readings => $$ReadingsTableTableManager(_db, _db.readings);
}
