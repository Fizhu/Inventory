import 'package:flutter/material.dart';
import 'package:inventory/ui/add/add.dart';
import 'package:inventory/ui/detail/detail.dart';
import 'package:inventory/ui/home/home.dart';
import 'package:inventory/ui/login/login.dart';
import 'package:inventory/utils/pref.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _token;

  // This widget is the root of your application.
  Future<String> _getStatus() async {
    WidgetsFlutterBinding.ensureInitialized();
    _token = await UserPref().getToken();
  }

  @override
  void initState() {
    UserPref().setToken('ssss');
    _getStatus();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
        accentColor: Colors.red,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: _token == null ? LoginPage.routeName : HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        LoginPage.routeName: (context) => LoginPage(),
        DetailPage.routeName: (context) => DetailPage(),
        AddPage.routeName: (context) => AddPage(),
      },
    );
  }
}
