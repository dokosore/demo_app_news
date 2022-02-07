import 'package:flutter/material.dart';

class ViewFunctions {
  // DateTime to "2021/10/10"
  String dateToYMD(DateTime date) {
    String dateString =
        "${date.year.toString()}/${date.month.toString()}/${date.day.toString().padLeft(2, '0')}";
    return dateString;
  }

  void showSnack(String text, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(text),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  String enumToString(value) {
    return value.toString().split('.')[1];
  }

  String cuttedText(String text, int max) {
    if (text.split('\n').length > 1) {
      return text.toString().split('\n')[0] + "...";
    } else if (text.length > max) {
      return text.substring(0, max) + "...";
    } else {
      return text;
    }
  }
}
