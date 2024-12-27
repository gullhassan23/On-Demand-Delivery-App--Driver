// // // Copyright 2019 Aleksander Woźniak
// // // SPDX-License-Identifier: Apache-2.0

// // import 'dart:collection';

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:table_calendar/table_calendar.dart';

// // /// Example event class.
// // class Event {
// //   final String title;

// //   const Event(this.title);

// //   @override
// //   String toString() => title;
// // }

// // Map<DateTime, List<Event>> _kEventSource = {};

// // /// Example events.
// // ///
// // /// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
// // final kEvents = LinkedHashMap<DateTime, List<Event>>(
// //   equals: isSameDay,
// //   hashCode: getHashCode,
// // )..addAll(_kEventSource);

// // Future<Map<DateTime, List<Event>>> fetchEventsFromFirestore() async {
// //   final FirebaseFirestore firestore = FirebaseFirestore.instance;

// //   // Fetch data from Firestore collection (change 'Jobs' to your collection name)
// //   QuerySnapshot<Map<String, dynamic>> querySnapshot =
// //       await firestore.collection('Jobs').get();

// //   Map<DateTime, List<Event>> fetchedEvents = {};

// //   // Iterate through fetched documents and convert them to Event objects
// //   querySnapshot.docs.forEach((doc) {
// //     Timestamp timestamp = doc[
// //         'date']; // Assuming date is stored as a Timestamp field in Firestore
// //     DateTime date1 = timestamp.toDate();
// //     DateTime originalDateTime =
// //         date1; // Replace this with your original DateTime object
// //     TimeOfDay newTime =
// //         TimeOfDay(hour: 0, minute: 0); // Replace with the desired new time

// //     DateTime date = DateTime(
// //       originalDateTime.year,
// //       originalDateTime.month,
// //       originalDateTime.day,
// //       newTime.hour,
// //       newTime.minute,
// //     );
// //     // Accessing the 'title' field
// //     dynamic eventNames = doc['title'];

// //     // Assuming 'title' is a String field, not a List
// //     if (eventNames is String) {
// //       // Create a single Event object from the title String
// //       Event event = Event(eventNames);

// //       if (fetchedEvents.containsKey(date)) {
// //         // If events for this date already exist, add the event to the existing list
// //         fetchedEvents[date]!.add(event);
// //       } else {
// //         // If events for this date don't exist, create a new list for this date and add the event
// //         fetchedEvents[date] = [event];
// //       }
// //     }
// //   });

// //   // Update existing _kEventSource by merging fetchedEvents with existing data
// //   fetchedEvents.forEach((date, events) {
// //     if (_kEventSource.containsKey(date.toString().substring(0, 10))) {
// //       print("if");
// //       _kEventSource[date]!.addAll(events);
// //     } else {
// //       print("else");

// //       _kEventSource[date] = events;
// //     }
// //   });

// //   return _kEventSource;
// // }

// // int getHashCode(DateTime key) {
// //   return key.day * 1000000 + key.month * 10000 + key.year;
// // }

// // /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
// // List<DateTime> daysInRange(DateTime first, DateTime last) {
// //   final dayCount = last.difference(first).inDays + 1;
// //   return List.generate(
// //     dayCount,
// //     (index) => DateTime.utc(first.year, first.month, first.day + index),
// //   );
// // }

// // final kToday = DateTime.now();
// // final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
// // final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

// // class TableEventsExample extends StatefulWidget {
// //   @override
// //   _TableEventsExampleState createState() => _TableEventsExampleState();
// // }

// // class _TableEventsExampleState extends State<TableEventsExample> {
// //   ValueNotifier<List<Event>> _selectedEvents = ValueNotifier([]);
// //   CalendarFormat _calendarFormat = CalendarFormat.month;
// //   RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
// //       .toggledOff; // Can be toggled on/off by longpressing a date
// //   DateTime _focusedDay = DateTime.now();
// //   DateTime? _selectedDay;
// //   DateTime? _rangeStart;
// //   DateTime? _rangeEnd;

// //   @override
// //   void initState() {
// //     super.initState();

// //     _selectedDay = _focusedDay;
// //     // _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
// //     print("before call ");

// //     fetchEventsFromFirestore().then((events) {
// //       setState(() {
// //         _kEventSource = events;
// //         print("from call events${events}");

// //         print("from call ${_kEventSource}");
// //         // print(DateTime(
// //         //   DateTime.now().year,
// //         //   DateTime.now().month,
// //         //   DateTime.now().day,
// //         //   0,
// //         //   0,
// //         // ));
// //         _selectedEvents = ValueNotifier(_getEventsForDay(DateTime(
// //           DateTime.now().year,
// //           DateTime.now().month,
// //           DateTime.now().day,
// //           0,
// //           0,
// //         )));
// //         print("from call ${_selectedEvents}");
// //       });
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _selectedEvents.dispose();
// //     super.dispose();
// //   }

// //   List<Event> _getEventsForDay(DateTime day) {
// //     print("days ${day}");
// //     print("kEvents ${kEvents[day]}");

// //     // Implementation example
// //     return kEvents[day] ?? [];
// //   }

// //   List<Event> _getEventsForRange(DateTime start, DateTime end) {
// //     // Implementation example
// //     final days = daysInRange(start, end);

// //     return [
// //       for (final d in days) ..._getEventsForDay(d),
// //     ];
// //   }

// //   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
// //     if (!isSameDay(_selectedDay, selectedDay)) {
// //       setState(() {
// //         _selectedDay = selectedDay;
// //         _focusedDay = focusedDay;
// //         _rangeStart = null; // Important to clean those
// //         _rangeEnd = null;
// //         _rangeSelectionMode = RangeSelectionMode.toggledOff;
// //       });

// //       _selectedEvents.value = _getEventsForDay(selectedDay);
// //     }
// //   }

// //   void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
// //     setState(() {
// //       _selectedDay = null;
// //       _focusedDay = focusedDay;
// //       _rangeStart = start;
// //       _rangeEnd = end;
// //       _rangeSelectionMode = RangeSelectionMode.toggledOn;
// //     });

// //     // `start` or `end` could be null
// //     if (start != null && end != null) {
// //       _selectedEvents.value = _getEventsForRange(start, end);
// //     } else if (start != null) {
// //       _selectedEvents.value = _getEventsForDay(start);
// //     } else if (end != null) {
// //       _selectedEvents.value = _getEventsForDay(end);
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('TableCalendar - Events'),
// //       ),
// //       body: Column(
// //         children: [
// //           _kEventSource.isNotEmpty
// //               ? TableCalendar<Event>(
// //                   firstDay: kFirstDay,
// //                   lastDay: kLastDay,
// //                   focusedDay: _focusedDay,
// //                   selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
// //                   rangeStartDay: _rangeStart,
// //                   rangeEndDay: _rangeEnd,
// //                   calendarFormat: _calendarFormat,
// //                   rangeSelectionMode: _rangeSelectionMode,
// //                   eventLoader: _getEventsForDay,
// //                   startingDayOfWeek: StartingDayOfWeek.monday,
// //                   calendarStyle: CalendarStyle(
// //                     // Use `CalendarStyle` to customize the UI
// //                     outsideDaysVisible: false,
// //                   ),
// //                   onDaySelected: _onDaySelected,
// //                   onRangeSelected: _onRangeSelected,
// //                   onFormatChanged: (format) {
// //                     if (_calendarFormat != format) {
// //                       setState(() {
// //                         _calendarFormat = format;
// //                       });
// //                     }
// //                   },
// //                   onPageChanged: (focusedDay) {
// //                     _focusedDay = focusedDay;
// //                   },
// //                 )
// //               : Container(),
// //           const SizedBox(height: 8.0),
// //           Expanded(
// //             child: ValueListenableBuilder<List<Event>>(
// //               valueListenable: _selectedEvents,
// //               builder: (context, value, _) {
// //                 return ListView.builder(
// //                   itemCount: value.length,
// //                   itemBuilder: (context, index) {
// //                     return Container(
// //                       margin: const EdgeInsets.symmetric(
// //                         horizontal: 12.0,
// //                         vertical: 4.0,
// //                       ),
// //                       decoration: BoxDecoration(
// //                         border: Border.all(),
// //                         borderRadius: BorderRadius.circular(12.0),
// //                       ),
// //                       child: ListTile(
// //                         onTap: () => print('${value[index]}'),
// //                         title: Text('${value[index]}'),
// //                       ),
// //                     );
// //                   },
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // Copyright 2019 Aleksander Woźniak
// // SPDX-License-Identifier: Apache-2.0

// import 'dart:collection';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:driverapp/models/jobs.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:intl/intl.dart';

// import '../constants/icons.dart';
// import 'Row.dart';

// /// Example event class.
// // class Event {
// //   final String title;

// //   const Event(this.title);

// //   @override
// //   String toString() => title;
// // }

// Map<DateTime, List<JobModel>> _kEventSource = {};

// /// Example events.
// ///
// /// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
// final kEvents = LinkedHashMap<DateTime, List<JobModel>>(
//   equals: isSameDay,
//   hashCode: getHashCode,
// )..addAll(_kEventSource);

// Future<Map<DateTime, List<JobModel>>> fetchEventsFromFirestore() async {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   // Fetch data from Firestore collection (change 'Jobs' to your collection name)
//   QuerySnapshot<Map<String, dynamic>> querySnapshot =
//       await firestore.collection('Jobs').get();
//       List<JobModel> jobs = [];

// querySnapshot.docs.forEach((doc) {
//   jobs.add(JobModel.fromMap(doc.data()));
// });
// // print(jobs.first.amount);
// // print(jobs.first.date);
// // print(jobs.first.date);


//   Map<DateTime, List<JobModel>> fetchedEvents = {};
//   // Iterate through fetched documents and convert them to Event objects
//   querySnapshot.docs.forEach((doc) {
//    Timestamp timestamp = doc[
//         'date']; // Assuming date is stored as a Timestamp field in Firestore
//     DateTime date1 = timestamp.toDate();
//     DateTime originalDateTime =
//         date1; // Replace this with your original DateTime object
//     TimeOfDay newTime =
//         TimeOfDay(hour: 0, minute: 0); // Replace with the desired new time

//     DateTime date = DateTime(
//       originalDateTime.year,
//       originalDateTime.month,
//       originalDateTime.day,
//       newTime.hour,
//       newTime.minute,
//     );
//     // Accessing the 'title' field
//     dynamic eventNames = doc['title'];
//   // Assuming 'title' is a String field, not a List
//     if (eventNames is String) {
//       // Create a single Event object from the title String
//       JobModel event = JobModel.fromMap(doc.data());

//       if (fetchedEvents.containsKey(date)) {
//         // If events for this date already exist, add the event to the existing list
//         fetchedEvents[date]!.add(event);
//       } else {
//         // If events for this date don't exist, create a new list for this date and add the event
//         fetchedEvents[date] = [event];
//       }
//     }
//   });

//   // Update existing _kEventSource by merging fetchedEvents with existing data
//   fetchedEvents.forEach((date, events) {
//     if (_kEventSource.containsKey(date.toString().substring(0, 10))) {
//       print("if");
//       _kEventSource[date]!.addAll(events);
//     } else {
//       print("else");

//       _kEventSource[date] = events;
//     }
//   });

//   return _kEventSource;
// }

// int getHashCode(DateTime key) {
//   return key.day * 1000000 + key.month * 10000 + key.year;
// }

// /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
// List<DateTime> daysInRange(DateTime first, DateTime last) {
//   final dayCount = last.difference(first).inDays + 1;
//   return List.generate(
//     dayCount,
//     (index) => DateTime.utc(first.year, first.month, first.day + index),
//   );
// }

// final kToday = DateTime.now();
// final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
// final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

// class TableEventsExample extends StatefulWidget {
//   @override
//   _TableEventsExampleState createState() => _TableEventsExampleState();
// }

// class _TableEventsExampleState extends State<TableEventsExample> {
//   ValueNotifier<List<JobModel>> _selectedEvents = ValueNotifier([]);
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
//       .toggledOff; // Can be toggled on/off by longpressing a date
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   DateTime? _rangeStart;
//   DateTime? _rangeEnd;

//   @override
//   void initState() {
//     super.initState();

//     _selectedDay = _focusedDay;

//     fetchEventsFromFirestore().then((events) {
//       setState(() {
//         _kEventSource = events;
       
//         _selectedEvents = ValueNotifier(_getEventsForDay(DateTime(
//           DateTime.now().year,
//           DateTime.now().month,
//           DateTime.now().day,
//           0,
//           0,
//         )));
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _selectedEvents.dispose();
//     super.dispose();
//   }

//   List<JobModel> _getEventsForDay(DateTime day) {
   

//     // Implementation example
//     return kEvents[day] ?? [];
//   }

//   List<JobModel> _getEventsForRange(DateTime start, DateTime end) {
//     // Implementation example
//     final days = daysInRange(start, end);

//     return [
//       for (final d in days) ..._getEventsForDay(d),
//     ];
//   }

//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     if (!isSameDay(_selectedDay, selectedDay)) {
//       setState(() {
//         _selectedDay = selectedDay;
//         _focusedDay = focusedDay;
//         _rangeStart = null; // Important to clean those
//         _rangeEnd = null;
//         _rangeSelectionMode = RangeSelectionMode.toggledOff;
//       });

//       _selectedEvents.value = _getEventsForDay(selectedDay);
//     }
//   }

//   void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
//     setState(() {
//       _selectedDay = null;
//       _focusedDay = focusedDay;
//       _rangeStart = start;
//       _rangeEnd = end;
//       _rangeSelectionMode = RangeSelectionMode.toggledOn;
//     });

//     // `start` or `end` could be null
//     if (start != null && end != null) {
//       _selectedEvents.value = _getEventsForRange(start, end);
//     } else if (start != null) {
//       _selectedEvents.value = _getEventsForDay(start);
//     } else if (end != null) {
//       _selectedEvents.value = _getEventsForDay(end);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TableCalendar - Events'),
//       ),
//       body: Column(
//         children: [
//           _kEventSource.isNotEmpty
//               ? TableCalendar<JobModel>(
//                   firstDay: kFirstDay,
//                   lastDay: kLastDay,
//                   focusedDay: _focusedDay,
//                   selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//                   rangeStartDay: _rangeStart,
//                   rangeEndDay: _rangeEnd,
//                   calendarFormat: _calendarFormat,
//                   rangeSelectionMode: _rangeSelectionMode,
//                   eventLoader: _getEventsForDay,
//                   startingDayOfWeek: StartingDayOfWeek.monday,
//                   calendarStyle: CalendarStyle(
//                     // Use `CalendarStyle` to customize the UI
//                     outsideDaysVisible: false,
//                   ),
//                   onDaySelected: _onDaySelected,
//                   onRangeSelected: _onRangeSelected,
//                   onFormatChanged: (format) {
//                     if (_calendarFormat != format) {
//                       setState(() {
//                         _calendarFormat = format;
//                       });
//                     }
//                   },
//                   onPageChanged: (focusedDay) {
//                     _focusedDay = focusedDay;
//                   },
//                 )
//               : Container(),
//           const SizedBox(height: 8.0),
//           Expanded(
//             child: ValueListenableBuilder<List<JobModel>>(
//               valueListenable: _selectedEvents,
//               builder: (context, value, _) {
//                 return ListView.builder(
//                   itemCount: value.length,
//                   itemBuilder: (context, index) {
//                     String date = DateFormat('yyyy-MM-dd').format(_focusedDay);
//                     return Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               ScheduledJobRow(
//                                   heading: '${value[index].title}',
//                                   bodyText: date,
//                                   // '12-Aug-2023',
//                                   IconData: AppIcons.Box),
//                             ],
//                           ),
                    
//                         Divider(),
                    
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
