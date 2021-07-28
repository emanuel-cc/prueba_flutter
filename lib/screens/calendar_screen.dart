import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
//import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<CleanCalendarEvent> _eventos = [];
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _eventos.addAll([
        CleanCalendarEvent('Holiday',
            startTime: DateTime(
              2021, 
              7,
              3,
            ),
            endTime: DateTime(
              2021, 
              7,
              3,
            ),
            description: 'Public Holiday',
            color: Colors.red),
        CleanCalendarEvent('Test',
            startTime: DateTime(
              2021, 
              7,
              8,
            ),
            endTime: DateTime(
              2021, 
              7,
              8,
            ),
            color: Colors.green,
            description: "Geometric Weekly test"),
     
        CleanCalendarEvent(
          'Event',
            startTime: 
            DateTime(DateTime.now().year, 
            DateTime.now().month,
            DateTime.now().day + 2, 14, 30,
        ),
            endTime: DateTime(
              DateTime.now().year, 
              DateTime.now().month,
              DateTime.now().day + 2, 17, 0
            ),
            color: Colors.yellow,
            description: "Events"
          ),
    ]);
    final Map<DateTime, List<CleanCalendarEvent>> _events = {
      DateTime(
        2021, 
        7,
        3,): [
        CleanCalendarEvent('Holiday',
            startTime: DateTime(
              2021, 
              7,
              3,
            ),
            endTime: DateTime(
              2021, 
              7,
              3,
            ),
            description: 'Public Holiday',
            color: Colors.red),
      ],
      DateTime(
        2021, 
        7,
        8,):
          [
        CleanCalendarEvent('Test',
            startTime: DateTime(
              2021, 
              7,
              8,
            ),
            endTime: DateTime(
              2021, 
              7,
              8,
            ),
            color: Colors.green,
            description: "Geometric Weekly test"),
        
      ],
      DateTime(
        DateTime.now().year, 
        DateTime.now().month,
        DateTime.now().day
      ):[
        CleanCalendarEvent(
          'Event',
            startTime: 
            DateTime(DateTime.now().year, 
            DateTime.now().month,
            DateTime.now().day + 2, 14, 30,
        ),
            endTime: DateTime(
              DateTime.now().year, 
              DateTime.now().month,
              DateTime.now().day + 2, 17, 0
            ),
            color: Colors.yellow,
            description: "Events"
          ),
      ]
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: size.height * 0.6,
          child: Calendar(
            startOnMonday: true,
            events: _events,
            weekDays: ['Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo'],
            isExpandable: true,
            isExpanded: true,
            eventDoneColor: Colors.green,
            selectedColor: Colors.red,
            todayColor: Colors.green,
            eventColor: Colors.yellow,
            locale: 'es_ES',
            dayOfWeekStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 11
            ),
            expandableDateFormat: 'EEEE, dd. MMMM yyyy',
            /*eventListBuilder: (BuildContext context, eventListBuilder){
              return Container(
                child: Text(eventListBuilder.first.startTime.day.toString()),
              );
            },*/
          ),
        ),
        
      ],
    );
  }
}