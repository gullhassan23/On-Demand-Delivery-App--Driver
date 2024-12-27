import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driverapp/global/refs.dart';
import 'package:driverapp/models/jobs.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../../constants/icons.dart';
import '../../controllers/user_controller.dart';
import '../../services/user_services.dart';
import '../../widgets/Row.dart';

Map<DateTime, List<JobModel>> _kEventSource = {};

var kEvents = LinkedHashMap<DateTime, List<JobModel>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class ScheduledJobs extends StatefulWidget {
  @override
  _ScheduledJobsState createState() => _ScheduledJobsState();
}

class _ScheduledJobsState extends State<ScheduledJobs> {
  ValueNotifier<List<JobModel>> _selectedEvents = ValueNotifier([]);
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  Stream<QuerySnapshot<Map<String, dynamic>>>? querySnapshot;
UserController _userController=Get.find<UserController>();
  UserServices _userServices = Get.find<UserServices>();

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;

    fetchEventsFromFirestore().then((events) {
      setState(() {
        // _kEventSource = events;

        // _selectedEvents = ValueNotifier(_getEventsForDay(DateTime(
        //   DateTime.now().year,
        //   DateTime.now().month,
        //   DateTime.now().day,
        //   0,
        //   0,
        // )));
        // print("select event ${_kEventSource}");
        // print("select event ${_selectedEvents}");
      });
    });
  }

  Future<Map<DateTime, List<JobModel>>> fetchEventsFromFirestore() async {
    // Fetch data from Firestore collection (change 'Jobs' to your collection name)
    UserServices controller = Get.find<UserServices>();
    
    if (controller.driver.approved.toString() == "true") {
      querySnapshot = await jobsRef
          .where("status", isEqualTo: 0)
          .where("driver",isEqualTo: controller.driver.id.toString() )
          .where("type", isEqualTo: 1)
          .where("vehicle", isEqualTo: _userServices.driver.asset!.vehiclecategory!.id)

          .snapshots();
      int i = 0;
      querySnapshot!.listen((query) async {
        Map<DateTime, List<JobModel>> fetchedEvents = {};
        _kEventSource.clear();

        print("query snapsshot call");
        // Iterate through fetched documents and convert them to Event objects
        query.docs.forEach((doc) {
          Timestamp timestamp = doc[
              'date']; // Assuming date is stored as a Timestamp field in Firestore
          DateTime date1 = timestamp.toDate();
          DateTime originalDateTime =
              date1; // Replace this with your original DateTime object
          TimeOfDay newTime = TimeOfDay(
              hour: 0, minute: 0); // Replace with the desired new time

          DateTime date = DateTime(
            originalDateTime.year,
            originalDateTime.month,
            originalDateTime.day,
            newTime.hour,
            newTime.minute,
          );
          // Accessing the 'title' field
          dynamic eventNames = doc['title'];
          // Assuming 'title' is a String field, not a List
          if (eventNames is String) {
            // Create a single Event object from the title String
            JobModel event = JobModel.fromMap(doc.data());

            if (fetchedEvents.containsKey(date)) {
              // If events for this date already exist, add the event to the existing list
              fetchedEvents[date]!.add(event);
            } else {
              // If events for this date don't exist, create a new list for this date and add the event
              fetchedEvents[date] = [event];
            }
          }
        });
        print("after delete _event ${_kEventSource}");

        // Update existing _kEventSource by merging fetchedEvents with existing data
        fetchedEvents.forEach((date, events) {
          if (_kEventSource.containsKey(date.toString().substring(0, 10))) {
            // print("if");
            _kEventSource[date]!.addAll(events);
          } else {
            // print("else");

            _kEventSource[date] = events;
          }
        });
        // print(_kEventSource);
        setState(() {});

        print("select event ${_kEventSource}");
        //
        // _selectedEvents.value.clear();
        // if(i!=0){
        // kEvents.clear();
        // }
        kEvents = LinkedHashMap<DateTime, List<JobModel>>(
          equals: isSameDay,
          hashCode: getHashCode,
        )..addAll(_kEventSource);

        _selectedEvents = await ValueNotifier([]);
        print("after empty select event ${_selectedEvents}");
        setState(() {});
        // if (i == 0) {
        print("object call one time $i");
        _selectedEvents = await ValueNotifier(_getEventsForDay(DateTime(
          _selectedDay!.year,
          _selectedDay!.month,
          _selectedDay!.day,
          0,
          0,
        )));
        // }
        i = 1;
        setState(() {});
        print("select event ee${_kEventSource}");
        print("select event ee${_selectedEvents}");
      });
    }
    return _kEventSource;
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<JobModel> _getEventsForDay(DateTime day) {
    // Implementation example
    print("kEvents[day] ${kEvents[day]}");
    return kEvents[day] ?? [];
  }

  List<JobModel> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
      // _selectedEvents = ValueNotifier([]);
      // _selectedEvents.value.clear();
      // print(_selectedEvents);

      _selectedEvents.value = _getEventsForDay(selectedDay);
      // print(_selectedEvents);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Headline('Scheduled Orders'),
      ),
      body: Column(
        children: [
          // Text(_getEventsForDay.toString()),
          // SizedBox(
          //   height: 20,
          // ),
          // Text(_kEventSource.toString()),
          // SizedBox(
          //   height: 20,
          // ),
          // Text(_selectedEvents.toString()),
          TableCalendar<JobModel>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _kEventSource.isNotEmpty ? _getEventsForDay : null,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: StreamBuilder(
                stream: querySnapshot,
                builder: (context, snapshot) {
                  return ValueListenableBuilder<List<JobModel>>(
                    valueListenable: _selectedEvents,
                    builder: (context, value, _) {
                      return ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          String date =
                              DateFormat('yyyy-MM-dd').format(_focusedDay);
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ScheduledJobRow(
                                      heading: '${value[index].title}',
                                      bodyText: date,
                                      // '12-Aug-2023',
                                      IconData: AppIcons.Box,
                                      data: value[index],
                                    ),
                                  ],
                                ),
                                Divider(),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}

// // ignore_for_file: file_names
// import 'package:driverapp/constants/icons.dart';
// import 'package:driverapp/widgets/Row.dart';
// import 'package:driverapp/widgets/font.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// class ScheduledJobs extends StatefulWidget {
//   ScheduledJobs({super.key});

//   @override
//   State<ScheduledJobs> createState() => _ScheduledJobsState();
// }

// class _ScheduledJobsState extends State<ScheduledJobs> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;

//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           color: Colors.transparent,
//           padding: EdgeInsets.all(0),
//           splashRadius: 40,
//           splashColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//         ),
//         title: Headline('Scheduled Jobs'),
//         centerTitle: true,
//       ),
//       body: Container(
//         // Wrap Scaffold with Container
//         padding: EdgeInsets.all(16), // Add padding from all sides
//         child: ListView(
//           children: [
//             TableCalendar(
//               firstDay: DateTime.utc(2023, 1, 1),
//               lastDay: DateTime.utc(2023, 12, 31),
//               focusedDay: _focusedDay,
//               calendarFormat: _calendarFormat,
//               onFormatChanged: (format) {
//                 setState(() {
//                   _calendarFormat = format;
//                 });
//               },
//               onPageChanged: (focusedDay) {
//                 setState(() {
//                   _focusedDay = focusedDay;
//                 });
//               },
//               selectedDayPredicate: (day) {
//                 return isSameDay(_selectedDay, day);
//               },
//               onDaySelected: (selectedDay, focusedDay) {
//                 setState(() {
//                   _selectedDay = selectedDay;
//                 });
//               },
//             ),
//             Divider(),
//             SizedBox(height: screenSize.height * 0.03),
//             Row(
//               children: [
//                 ScheduledJobRow(
//                     heading: 'MM09132005',
//                     bodyText: '12-Aug-2023',
//                     IconData: AppIcons.Box),
//               ],
//             ),
//             Divider(),
//             Row(
//               children: [
//                 ScheduledJobRow(
//                     heading: 'MM09132005',
//                     bodyText: '12-Aug-2023',
//                     IconData: AppIcons.Box),
//               ],
//             ),
//             Divider(),
//             Row(
//               children: [
//                 ScheduledJobRow(
//                     heading: 'MM09132005',
//                     bodyText: '12-Aug-2023',
//                     IconData: AppIcons.Box),
//               ],
//             ),
//             Divider(),
//             Row(
//               children: [
//                 ScheduledJobRow(
//                     heading: 'MM09132005',
//                     bodyText: '12-Aug-2023',
//                     IconData: AppIcons.Box),
//               ],
//             ),
//             Divider(),
//           ],
//         ),
//       ),
//     );
//   }
// }
