import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'color_model.g.dart';

@HiveType(typeId: 1)
class ColorModelClass {
  @HiveField(0)
  final Color appColor;


  ColorModelClass({
    required this.appColor,
  });
}
