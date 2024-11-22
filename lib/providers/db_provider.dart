import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

final dbProvider = Provider((ref) async {
  var db = await openDatabase('tikbili.db', version: 1,
      onCreate: (db, version) async {
    await db.execute(
        'CREATE TABLE t_video (id INTEGER PRIMARY KEY, bvid TEXT, cid TEXT, title TEXT, '
            'coverUrl TEXT, videoUrl TEXT, videoWidth INTEGER, videoHeight INTEGER, duration INTEGER, byteSize INTEGER, stat TEXT, poster TEXT)');
  });
  return db;
});
