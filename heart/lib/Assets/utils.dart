//Diary
final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}
