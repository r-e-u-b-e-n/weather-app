import 'package:intl/intl.dart';

String dateToDay(String dateString) {
  final date = DateTime.parse(dateString);
  return DateFormat('EEE').format(date);
}
