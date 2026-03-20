// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_riverpod/experimental/persist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_sqflite/riverpod_sqflite.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

part 'storage_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Storage<String, String>> storage(Ref ref) async {
  return JsonSqFliteStorage.open(
    join(await getDatabasesPath(), 'fynt.db'),
  );
}
