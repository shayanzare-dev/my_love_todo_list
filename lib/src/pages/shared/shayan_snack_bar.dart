import 'package:flutter/material.dart';
import 'package:get/get.dart';

void shayanShowSnackBar(
        {required String title, required String message, Color? color}) =>
    Get.showSnackbar(GetSnackBar(
      title: title,
      backgroundColor: color ?? Colors.red,
      message: message,
    ));
