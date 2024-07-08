import 'package:flutter/material.dart';
import 'package:heart/add_diary.dart';
import 'package:table_calendar/table_calendar.dart';
import '../Assets/utils.dart';

//빈칸에 감정변화 전 -> 후 보이게 << 이건 api열리고 나서
class Diary extends StatefulWidget {
  const Diary({super.key});

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    //Events에 조회하는 기능 만들기 , sharedpreferences에 저장해논 list가져오기
    return Events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diary Demo'),
      ),
      body: Column(
        children: [
          Container(
            child: TableCalendar(
              focusedDay: _focusedDay,
              firstDay: kFirstDay,
              lastDay: kLastDay,
              calendarFormat: _calendarFormat,
              eventLoader: _getEventsForDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  // Call `setState()` when updating the selected day
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  // Call `setState()` when updating calendar format
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                // No need to call `setState()` here
                _focusedDay = focusedDay;
              },
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddDiary(),
            )),
        label: Icon(
          Icons.add,
          size: 50,
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
