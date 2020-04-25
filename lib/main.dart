import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webapp/screen/authen_fromContributor.dart';
import 'package:webapp/screen/authen_page.dart';
import 'package:webapp/screen/forgot_screen.dart';
import 'package:webapp/screen/form_info.dart';
import 'package:webapp/screen/homeContributor.dart';
import 'package:webapp/screen/intro_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      // systemNavigationBarDividerColor: Colors.red,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.transparent));
  runApp(
    // introScreen()
    // forgotScreen(),
// authenticate_page(),
// form_info(),
homeScreenContributor(),
    // authenticate_page_contributor(),
  );
}

/*
// ChangeNotifierProvider<themeNotifier>(
  //     create: (_) => themeNotifier(darkTheme), child: )
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsFlutterBinding.ensureInitialized();
 */
