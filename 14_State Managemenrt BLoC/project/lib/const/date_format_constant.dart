import 'package:intl/intl.dart';

class DateFormatConstant {
  static String getDayDateHours(DateTime dateTime) {
    return DateFormat('EEEE,dd MMMM yyyy').format(
      dateTime,
    );
  }
}
