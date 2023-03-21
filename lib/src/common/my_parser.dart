import 'dart:developer';

import 'package:intl/intl.dart';

abstract class MyParser {
  // static String dateToMY(DateTime dt) => DateFormat('MMMM yyyy').format(dt);

  // static String dateToWMDY(DateTime? dt) {
  //   if (dt == null) return '';
  //   return DateFormat('EEE, MMM d yyyy').format(dt);
  // }

  // static String dateToFullDate(DateTime? dt) {
  //   if (dt == null) return '';
  //   return DateFormat('EEEE, MMMM d yyyy').format(dt);
  // }

  // static String dateToWeekDay(DateTime? dt) {
  //   if (dt == null) return '';
  //   return DateFormat('EEE').format(dt).toUpperCase();
  // }

  // static String dateToDateNumber(DateTime? dt) {
  //   if (dt == null) return '';
  //   return DateFormat('d').format(dt).toUpperCase();
  // }

  // static String dateToMonth(DateTime? dt) {
  //   if (dt == null) return '';
  //   return DateFormat('MMM').format(dt).toUpperCase();
  // }

  static String dateToYYYYMMDD(DateTime? dt) {
    if (dt == null) return '';
    return DateFormat('yyyy-MM-dd').format(dt).toUpperCase();
  }

  static String dateToMDY(DateTime? dt) {
    if (dt == null) return '';
    return DateFormat('MMM, d yyyy').format(dt);
  }

  static String dateToTime(DateTime? dt) {
    if (dt == null) return '';
    return DateFormat('hh:mm a').format(dt).toUpperCase();
  }

  static DateTime? timeToDate(String t) {
    try {
      return DateFormat('hh:mm a').parse(t);
    } catch (e, st) {
      log('Error in parsing -> $t <- time', error: e, stackTrace: st);
    }
    return null;
  }
}
