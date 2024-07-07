import 'dart:async';
import 'package:flutter/material.dart';

Future<void> snackBarWidget(
  String msg,
  Color iconcolor,
  Color texcolor,
  Color backgroundColor,
  int time,
  GlobalKey<ScaffoldState> scaffoldKey,
) async {
  final completer = Completer<void>();
  final snackbar = SnackBar(
    shape: const StadiumBorder(),
    behavior: SnackBarBehavior.floating,
    backgroundColor: backgroundColor,
    margin: const EdgeInsets.only(bottom: 20, left: 6, right: 6),
    duration: Duration(seconds: time),
    content: SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                msg,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: texcolor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  // Using ScaffoldMessenger to show the snackbar
  ScaffoldMessenger.of(scaffoldKey.currentContext!)
      .showSnackBar(snackbar)
      .closed
      .then((reason) {
    if (!completer.isCompleted) {
      completer.complete();
    }
  });

  return completer.future;
}
