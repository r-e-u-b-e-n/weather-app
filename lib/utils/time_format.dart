String formatTime(String timeStr) {
  final time = DateTime.parse(timeStr);
  final hour = time.hour;
  final period = hour >= 12 ? 'PM' : 'AM';
  final formattedHour = hour == 0
      ? 12
      : hour > 12
      ? hour - 12
      : hour;
  return '$formattedHour $period';
}
