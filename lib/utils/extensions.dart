import 'package:flutter/material.dart';

extension SizedBoxExtensions on int{
  Widget get height => SizedBox(height: toDouble());
  Widget get width => SizedBox(width: toDouble());
}