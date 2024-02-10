import 'package:hive_flutter/hive_flutter.dart';

Future<void>hiveData()async{
  await Hive.initFlutter();
  await Hive.openBox('daily');
  await Hive.openBox('date');
  await Hive.openBox('user');
  await Hive.openBox('Dtrack');
  await Hive.openBox('quranData');
}