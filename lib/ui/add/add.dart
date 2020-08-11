import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  static const routeName = '/add';

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
      ),
      body: Center(
        child: Text('Add'),
      ),
    );
  }
}
