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
          title: Text('Add Item'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _formInput(
                    TextInputType.text, 'Item Name', null, (value) {}, (value) {}),
                SizedBox(height: 16.0,),
                _formInput(
                    TextInputType.text, 'Description', null, (value) {}, (value) {}),
                SizedBox(height: 16.0,),
                _formInput(
                    TextInputType.text, 'Date', IconButton(
                  icon: Icon(Icons.date_range),
                  onPressed: () {},
                ), (value) {}, (value) {}),
              ],
            ),
          ),
        ));
  }

  _formInput(TextInputType textInputType, String label, Widget suffixIcon,
          Function(String value) f, Function(String value) v) =>
      Container(
        child: TextFormField(
          keyboardType: textInputType,
          onSaved: f,
          validator: v,
          decoration: InputDecoration(
            labelText: label,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      );
}
