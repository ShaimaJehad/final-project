import 'package:flutter/material.dart';

CircleAvatar BuildCircleAvatar(int num, selected_index) {
    return CircleAvatar(
      radius: 5,
      backgroundColor:
          selected_index == num ? Color(0xff444251) : Color(0xffD7D9DB),
    );
  }
