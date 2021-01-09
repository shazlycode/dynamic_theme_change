import 'package:dynamic_theme_change/main_screen.dart';
import 'package:dynamic_theme_change/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // var _isInit = true;
  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     Provider.of<ThemeProvider>(context).getThemePref();
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => MaterialApp(
          theme: themeProvider.isDark
              ? themeProvider.darkThemeData
              : themeProvider.lightThemeData,
          home: MainScreen(),
        ),
      ),
    );
  }
}
