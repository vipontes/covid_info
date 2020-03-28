import 'package:intl/intl.dart';

class DateHelper {
  static String currentDateAsString() {
    DateTime dateTime = DateTime.now();
    return DateFormat("yyyy-MM-dd").format(dateTime);
  }
}
