import 'package:all_in_one_personal_app/models/calendar_event.dart';
import 'package:flutter/material.dart';

class EventDatabase extends ChangeNotifier {
  // Overall list of events
  List<Event> allEvents = [Event('Test')];
  // Get events
  List<Event> getAllEvents() {
    return allEvents;
  }

  // Add new event
  void addNewevent(Event event) {
    allEvents.add(event);
    notifyListeners();
  }

  // Delete event
  void deleteevent(Event event) {
    allEvents.remove(event);
    notifyListeners();
  }
}
