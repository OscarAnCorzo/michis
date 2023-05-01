import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:michis/src/core/failures.dart';

void eitherError(Failure l) {
  Future.delayed(Duration(seconds: 0), (){
    Get.snackbar(
      "",
      "",
      duration: Duration(seconds: 3),
      snackPosition: SnackPosition.TOP,
      titleText: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.bug_report_outlined, color: Colors.black),
          SizedBox(
            width: 16,
          ),
          Flexible(
            child: Text(
              "¡Ups, algo va mal!",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black
              )
            )
          )
        ]
      ),
      messageText: Row(
        children: [
          Flexible(
            child: Text(
              l.message,
              style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w300, color: Colors.black
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          )
        ]
      ),
      backgroundColor: Colors.white,
      borderColor: Colors.grey[200],
      borderRadius: 8.0,
      borderWidth: 1,
    );
  });
}