import 'package:all_in_one_personal_app/models/note.dart';
import 'package:hive/hive.dart';

class NoteDatabase {
  final _myBox = Hive.box('note_database');

  List<Note> loadNotes() {
    List<Note> savedNotesFormatted = [];

    if (_myBox.get("ALL_NOTES") != null) {
      List<dynamic> savedNotes = _myBox.get("ALL_NOTES");
      for (int i = 0; i < savedNotes.length; i++) {
        Note individualNote =
            Note(id: savedNotes[i][0], text: savedNotes[i][1]);
        savedNotesFormatted.add(individualNote);
      }
    }
    return savedNotesFormatted;
  }

  void savedNotes(List<Note> allNotes) {
    List<List<dynamic>> allNotesFormatted = [];
    for (var note in allNotes) {
      int id = note.id;
      String text = note.text;
      allNotesFormatted.add([id, text]);
    }

    _myBox.put("ALL_NOTES", allNotesFormatted);
  }
}
