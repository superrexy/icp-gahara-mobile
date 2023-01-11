class Helpers {
  static countRangeDays(DateTime start, DateTime end) {
    return end.difference(start).inDays;
  }
}
