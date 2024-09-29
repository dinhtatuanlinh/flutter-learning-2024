import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/models/place.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  // get path of database
  final dbPath = await sql.getDatabasesPath();
  // create db instance, path param will be the path to database if the database is not existing
  // it will be auto create
  // onCreate function will run at first
  final db = await sql.openDatabase(
    path.join(dbPath, "place.db"),
    onCreate: (db, version) {
      return db.execute(
          "create table user_places(id TEXT PRIMARY KEY, title TEXT, image_path TEXT)"
      );
    },
    version: 1,
  );
  return db;
}

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  Future<void> loadPlaces() async {
    final db = await _getDatabase();
    final places = await db.query("user_places");

    state = (await Future.wait(places.map((row) async {
      final imagePath = row["image_path"] as String;
      final file = File(imagePath);

      if (await file.exists()) {
        return Place(
          id: row["id"] as String,
          title: row["title"] as String,
          image: file,
        );
      } else {
        // File doesn't exist, remove the record from the database
        await db.delete(
          "user_places",
          where: "id = ?",
          whereArgs: [row["id"]],
        );
        return null;
      }
    }))).whereType<Place>().toList();
  }

  void addPlace(String title, File image) async {
    // the path_provider package help to get the directories in phone this path of directories will use to save file
    // the file save there will not be deleted by system
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    // path package help to get the parts of file path
    // here we can get the name of the file by this package
    final fileName = path.basename(image.path);
    final now = DateTime.now();
    final copiedImage = await image.copy("${appDir.path}/${now.toString()}-$fileName");

    final newPlace = Place(title: title, image: copiedImage);

    final db = await _getDatabase();

    db.insert("user_places", {
      "id": newPlace.id,
      "title": newPlace.title,
      "image_path": newPlace.image.path,
    });

    state = [newPlace, ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
        (ref) => UserPlacesNotifier());
