import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory/utils/app_constant.dart';

class AddPage extends StatefulWidget {
  static const routeName = '/add';

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  DateTime _dateTimeNow = DateTime.now();
  TextEditingController _dateController = TextEditingController();
  DateFormat _formatDateTime = DateFormat(AppConstant.DATE_TIME_FORMAT);

  @override
  void initState() {
    super.initState();
    _dateController.text = _formatDateTime.format(_dateTimeNow);
  }

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
                _formInput(TextInputType.text, 'Item Name', null, (value) {},
                    (value) {}),
                SizedBox(
                  height: 16.0,
                ),
                _formInput(TextInputType.text, 'Description', null, (value) {},
                    (value) {}),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  child: TextFormField(
                    keyboardType: TextInputType.datetime,
                    onSaved: (String value) {},
                    validator: (String value) {},
                    controller: _dateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Date Time',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.date_range),
                        onPressed: () {
                          _selectDate(context);
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  _selectDate(BuildContext context) async {
    final DateTime dateTime = await showDatePicker(
        context: context,
        initialDate: _dateTimeNow,
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
        helpText: 'Select Date',
        cancelText: 'Cancel',
        confirmText: 'Select');
    if (dateTime != null && dateTime != _dateTimeNow) {
      var selectedDateTime = DateTime(
          dateTime.year,
          dateTime.month,
          dateTime.day,
          DateTime.now().hour,
          DateTime.now().minute,
          DateTime.now().second);
      _dateController.text = _formatDateTime.format(selectedDateTime);
    }
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
