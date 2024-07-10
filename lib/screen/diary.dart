import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../assets/utils.dart';

class Diary extends StatefulWidget {
  const Diary({super.key});

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    const TextStyle customTextStyle = TextStyle(
      fontFamily: 'single_day',
      fontSize: 16,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFBA0),
      ),
      body: TableCalendar(
        focusedDay: _focusedDay,
        firstDay: kFirstDay,
        lastDay: kLastDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
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
        calendarStyle: CalendarStyle(
          defaultTextStyle: customTextStyle,
          weekendTextStyle: customTextStyle,
          selectedTextStyle: customTextStyle.copyWith(color: Colors.white),
          todayTextStyle: customTextStyle.copyWith(color: const Color.fromARGB(255, 2, 2, 2)),
          selectedDecoration: const BoxDecoration(
            color: Color.fromARGB(255, 89, 181, 81), 
            shape: BoxShape.circle,
          ),
          todayDecoration: const BoxDecoration(
            color: Color(0xFFFFFBA0), 
            shape: BoxShape.circle,
          ),
        ),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: customTextStyle,
          weekendStyle: customTextStyle,
        ),
        headerStyle: HeaderStyle(
          titleTextStyle: customTextStyle.copyWith(fontSize: 25),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'single_day',
      ),
      home: const Diary(),
    ),
  );
}

