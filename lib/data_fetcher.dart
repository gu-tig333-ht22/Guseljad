import 'dart:async';
import 'package:flutter/foundation.dart';
import 'task.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class DataFetcher with ChangeNotifier {
  static String url_key = "key=875c02ff-b0b8-41e0-b7f9-53f951704372";

  static List<minuppgift> notes = [];
  static List<minuppgift> doneNotes = [];
  static List<minuppgift> notDoneNotes = [];

  static Future<List<minuppgift>?> getNotes() async {
    List<minuppgift> notes = [];
    var url = Uri.parse('https://todoapp-api.apps.k8s.gu.se/todos?$url_key');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as List;

      print('All notes from internet json: $jsonResponse');

      notes = List<minuppgift>.from(
          jsonResponse.map<minuppgift>((dynamic i) => minuppgift.fromJson(i)));
      return notes;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  static Future<List<minuppgift>?> getDoneNotes() async {
    List<minuppgift> doneNotes = [];
    var url = Uri.parse('https://todoapp-api.apps.k8s.gu.se/todos?$url_key');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as List;

      List<minuppgift> notes = List<minuppgift>.from(
          jsonResponse.map<minuppgift>((dynamic i) => minuppgift.fromJson(i)));
      for (int i = 0; i < notes.length; i++) {
        if (notes[i].done) {
          doneNotes.add(notes[i]);
        }
      }
      return doneNotes;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  static Future<List<minuppgift>?> getNotDoneNotes() async {
    List<minuppgift> notDoneNotes = [];
    var url = Uri.parse('https://todoapp-api.apps.k8s.gu.se/todos?$url_key');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as List;

      List<minuppgift> notes = List<minuppgift>.from(
          jsonResponse.map<minuppgift>((dynamic i) => minuppgift.fromJson(i)));

      for (int i = 0; i < notes.length; i++) {
        if (!notes[i].done) {
          notDoneNotes.add(notes[i]);
        }
      }
      return notDoneNotes;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  Future<List<minuppgift>?> addNewNote(minuppgift note) async {
    var response = await http.post(
      Uri.parse('https://todoapp-api.apps.k8s.gu.se/todos?$url_key'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(note.toMap()),
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as List;
      List<minuppgift> notes = List<minuppgift>.from(
          jsonResponse.map<minuppgift>((dynamic i) => minuppgift.fromJson(i)));

      return notes;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  Future<List<minuppgift>?> deleteNote(String todo) async {
    var response = await http.delete(
        Uri.parse("https://todoapp-api.apps.k8s.gu.se/todos/$todo?$url_key"));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as List;
      List<minuppgift> notes = List<minuppgift>.from(
          jsonResponse.map<minuppgift>((dynamic i) => minuppgift.fromJson(i)));

      return notes;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  static Future<List<minuppgift>?> updateNote(
      minuppgift todo, String todoId, bool done) async {
    todo.done = done;
    Map<String, dynamic> obj = todo.toJson();
    var jsonString = jsonEncode(obj);

    print("Note to update::::" + jsonString);
    var response = await http.put(
      Uri.parse("https://todoapp-api.apps.k8s.gu.se/todos/$todoId?$url_key"),
      body: jsonString,
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as List;
      List<minuppgift> notes = List<minuppgift>.from(
          jsonResponse.map<minuppgift>((dynamic i) => minuppgift.fromJson(i)));
      print("update:...:" + response.body);
      return notes;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  } //end
}
