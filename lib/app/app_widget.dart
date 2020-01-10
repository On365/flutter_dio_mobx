import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testedio/app/modules/home/home_module.dart';

import 'modules/home/home_controller.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<HomeController>(create: (context) => HomeController())
        ],
        child: MaterialApp(
          title: 'Flutter Slidy',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: GoogleFonts.pTSerifCaptionTextTheme(
                  Theme.of(context).textTheme)),
          home: HomeModule(),
        ));
  }
}
