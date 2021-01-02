import 'package:flutter/material.dart';

// ignore: camel_case_types
class Snack_Bar {
  final String message;

  const Snack_Bar({
    @required this.message,
  });

  static show(
    BuildContext context,
    String message,
  ) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        content: Text(message),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        action: SnackBarAction(
          textColor: Color(0xFFFAF2FB),
          label: 'OK',
          onPressed: () {
            Scaffold.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}