import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:testedio/app/modules/home/home_controller.dart';
import 'package:testedio/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());

  HomeController home;

  setUp(() {
    home = HomeModule.to.get<HomeController>();
  });

}
