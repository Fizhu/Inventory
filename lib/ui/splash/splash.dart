import 'package:flutter/material.dart';
import 'package:inventory/ui/home/home.dart';
import 'package:inventory/ui/login/login.dart';
import 'package:inventory/utils/navigation.dart';
import 'package:inventory/utils/pref.dart';

class Splash extends StatefulWidget {
  static const routeName = '/splash';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _isLogin = false;

  @override
  void initState() {
    super.initState();
    _getStatus();
  }

  _getStatus() async {
    _isLogin = await UserPref().getStatus() ?? false;
    if (_isLogin) {
      Navigation.intent(context, HomePage.routeName);
    } else {
      Navigation.intent(context, LoginPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
