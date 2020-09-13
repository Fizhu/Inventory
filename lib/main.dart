import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/bloc/barang/barang_bloc.dart';
import 'package:inventory/bloc/bloc_observer.dart';
import 'package:inventory/data/pref/pref.dart';
import 'package:inventory/data/repository/app_repository.dart';
import 'package:inventory/ui/add/add.dart';
import 'package:inventory/ui/detail/detail.dart';
import 'package:inventory/ui/home/home.dart';
import 'package:inventory/ui/login/login.dart';

String _route = LoginPage.routeName;
bool _isLogin;

Future<void> main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  _isLogin = await UserPref.getStatus();
  if (_isLogin) {
    _route = HomePage.routeName;
  } else {
    _route = LoginPage.routeName;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        accentColor: Colors.orangeAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: _route,
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        HomePage.routeName: (context) => BlocProvider(
              create: (context) => BarangBloc(repository: AppRepository()),
              child: HomePage(),
            ),
        DetailPage.routeName: (context) => DetailPage(),
        AddPage.routeName: (context) => AddPage(),
      },
    );
  }
}
