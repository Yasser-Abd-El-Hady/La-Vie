import 'package:flutter/material.dart';
import 'package:la_vie/utils/color.dart';

Widget answerItem(
    {required int value,
    required int groupValue,
    required void Function(int?)? onChanged}) {
  return ListTile(
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: AppColors.primary, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
    title: const Text(
      "The user experience is how the developer feels about a user.",
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    ),
    trailing: Radio(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: AppColors.primary,
    ),
  );
}
