import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static String formatDate(DateTime? date) {
    return date != null ? DateFormat('dd MMM yyyy, HH:mm').format(date) : '';
  }
}
