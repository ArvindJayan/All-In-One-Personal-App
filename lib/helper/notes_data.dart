import 'package:all_in_one_personal_app/models/note.dart';
import 'package:flutter/material.dart';

class NoteData extends ChangeNotifier {
  // final db = NoteDatabase();
  // Overall list of notes
  List<Note> allNotes = [
    Note(id: 0, text: 'First Note'),
    Note(id: 1, text: 'Second Note')
  ];

  void initializeNotes() {
    // allNotes = db.loadNotes();
  }

  // Get notes
  List<Note> getAllNotes() {
    return allNotes;
  }

  // Add new note
  void addNewNote(Note note) {
    allNotes.add(note);
    notifyListeners();
  }

  // Update note
  void updateNote(Note note, String text) {
    for (int i = 0; i < allNotes.length; i++) {
      if (allNotes[i].id == note.id) {
        allNotes[i].text = text;
      }
    }
    notifyListeners();
  }

  // Delete note
  void deleteNote(Note note) {
    allNotes.remove(note);
    notifyListeners();
  }
}
