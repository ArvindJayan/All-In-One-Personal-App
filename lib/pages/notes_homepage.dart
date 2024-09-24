import 'package:all_in_one_personal_app/helper/edit_note.dart';
import 'package:all_in_one_personal_app/helper/notes_data.dart';
import 'package:all_in_one_personal_app/models/note.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesHomePage extends StatefulWidget {
  const NotesHomePage({super.key});

  @override
  State<NotesHomePage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesHomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NoteData>(context, listen: false).initializeNotes();
  }

  void createNewNote() {
    int id = Provider.of<NoteData>(context, listen: false).getAllNotes().length;
    Note newNote = Note(id: id, text: '');

    goToNotePage(newNote, true);
  }

  void goToNotePage(Note note, bool isNewNote) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditNotePage(
          note: note,
          isNewNote: isNewNote,
        ),
      ),
    );
  }

  void deleteNote(Note note) {
    Provider.of<NoteData>(context, listen: false).deleteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 0, 106),
          title: const Text(
            'Notes',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 246, 223, 230),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 255, 0, 106),
          onPressed: createNewNote,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // List of notes
            value.getAllNotes().isEmpty
                ? const Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Center(
                      child: Text('Nothing here..'),
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        top: 16.0,
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 8.0),
                      itemCount: value.getAllNotes().length,
                      itemBuilder: (context, index) {
                        final note = value.getAllNotes()[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 249, 238, 241),
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            title: Text(note.text),
                            onTap: () => goToNotePage(note, false),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => deleteNote(note),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
