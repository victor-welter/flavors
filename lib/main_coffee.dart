import 'package:flutter/material.dart';

import 'flavor_config.dart';
import 'main.dart';

void main() {
  mainCommon(
    FlavorConfig()
      ..title = "Main coffee"
      ..icon = Icons.coffee_rounded
      ..theme = ThemeData.light().copyWith(primaryColor: Colors.brown),
  );
}
