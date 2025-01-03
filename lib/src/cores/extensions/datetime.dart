part of '../cores.dart';


extension DatetimeExtension on DateTime {
  String toStringByFormat(String newPattern) {
    return DateFormat(newPattern).format(this);
  }

  String toDDMMhmmaFormat() {
    return DateFormat('dd-MM h:mm a').format(this);
  }
}