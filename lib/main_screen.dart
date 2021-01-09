import 'package:dynamic_theme_change/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isDark = false;
  Future<dynamic> d;
  var _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<ThemeProvider>(context).getThemePref();

      setState(() {
        d = Provider.of<ThemeProvider>(context).getThemePref();
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic theme changer'),
        actions: [
          Switch(
              value: Provider.of<ThemeProvider>(context, listen: false).isDark,
              onChanged: (value) {
                setState(() {
                  _isDark = value;
                  print(_isDark);
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme(_isDark);
                });
              }),
        ],
      ),
      body: Center(
        child: Text('Theme Changer Dynamically'),
      ),
    );
  }
}
