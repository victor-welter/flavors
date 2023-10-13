import 'package:flutter/material.dart';

import 'flavor_config.dart';
import 'main.dart';

void main() {
  mainCommon(
    FlavorConfig()
      ..title = "Main cookie"
      ..icon = Icons.cookie_rounded
      ..theme = ThemeData.dark().copyWith(primaryColor: Colors.red[900]),
  );
}
