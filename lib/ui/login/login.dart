import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inventory/ui/home/home.dart';
import 'package:inventory/utils/pref.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible;
  String _email, _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  double _getHeight() {
    if (MediaQuery
        .of(context)
        .orientation == Orientation.landscape) {
      return MediaQuery
          .of(context)
          .size
          .height / 2;
    } else {
      return MediaQuery
          .of(context)
          .size
          .height / 5;
    }
  }

  void _handleSubmit() async {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {} else {
      form.save();
      UserPref.setStatus();
      UserPref.setToken('555552sdgsdg');
      UserPref.setId(1);
      UserPref.setNama('Fizhu');
      UserPref.setEmail(_email);
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
  }

  Widget _pwFormInput() {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: !_passwordVisible,
        onSaved: (String value) {
          _password = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Password is Required';
          } else if (value.length < 6){
            return 'Password should contains more then 5 character';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          prefixIcon: Icon(
            Icons.lock,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _passwordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: _getHeight(),
                      child: SvgPicture.asset(
                        'assets/images/illust_login.svg',
                        semanticsLabel: 'Illust Login',
                      ),
                    ),
                    SizedBox(
                      height: 56.0,
                    ),
                    Container(
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (String value) {
                          _email = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Email is Required';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          prefixIcon: Icon(
                            Icons.mail,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    _pwFormInput(),
                    SizedBox(
                      height: 24.0,
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: RaisedButton(
                        padding: EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        textColor: Colors.white,
                        onPressed: () {
                          _handleSubmit();
                        },
                        child: Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
