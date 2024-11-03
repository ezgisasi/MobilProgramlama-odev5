import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = false;

  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Change Theme',
      theme: isDarkTheme ? darkTheme : lightTheme,
      home: ThemeSwitcher(
        toggleTheme: toggleTheme,
        isDarkTheme: isDarkTheme,
      ),
    );
  }
}

class ThemeSwitcher extends StatelessWidget {
  final Function toggleTheme;
  final bool isDarkTheme;

  ThemeSwitcher({required this.toggleTheme, required this.isDarkTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        backgroundColor:Colors.blue,
        title: Text(isDarkTheme ? 'Dark Theme' : 'Light Theme'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current Theme: ${isDarkTheme ? "Dark" : "Light"}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => toggleTheme(),
              child: Text('Change Theme'),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                Theme.of(context).buttonTheme.colorScheme?.primary,
                foregroundColor:
                Theme.of(context).buttonTheme.colorScheme?.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Açık Tema
final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  buttonTheme: ButtonThemeData(
    colorScheme: ColorScheme.light(
      primary: Colors.blue,
      onPrimary: Colors.white,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    headlineSmall: TextStyle(color: Colors.black),
  ),
);

// Karanlık Tema
final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
  buttonTheme: ButtonThemeData(
    colorScheme: ColorScheme.dark(
      primary: Colors.blue,
      onPrimary: Colors.black,
    ),
  ),
  scaffoldBackgroundColor: Colors.black,
  textTheme: TextTheme(
    headlineSmall: TextStyle(color: Colors.white),
  ),
);
