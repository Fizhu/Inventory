import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory/utils/app_constant.dart';

class AddPage extends StatefulWidget {
  static const routeName = '/add';

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime _dateTimeNow = DateTime.now();
  TextEditingController _dateController = TextEditingController();
  DateFormat _formatDateTime = DateFormat(AppConstant.DATE_TIME_FORMAT);
  String _itemName, _descrption, _quantity, _dateTime;

  void _handleSubmit() async {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      //TODO: Submit
    }
  }

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
        bottomNavigationBar: RaisedButton(
          textColor: Colors.white,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.all(16.0),
          onPressed: () {
            _handleSubmit();
          },
          child: Text('Submit'),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _formInput(TextInputType.text, 'Item Name', null, (value) {
                    _itemName = value;
                  }, (value) {
                    if (value.isEmpty) {
                      return 'Cannot be empty';
                    }
                  }, 1),
                  SizedBox(
                    height: 16.0,
                  ),
                  _formInput(TextInputType.multiline, 'Description', null,
                      (value) {
                    _descrption = value;
                  }, (value) {
                        if (value.isEmpty) {
                          return 'Cannot be empty';
                        }
                      }, 5),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          child: TextFormField(
                            keyboardType: TextInputType.datetime,
                            onSaved: (String value) {
                              _dateTime = value;
                            },
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
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        flex: 3,
                        child: _formInput(
                            TextInputType.number, 'Quantity', null, (value) {
                          _quantity = value;
                        }, (value) {
                          if (value.isEmpty) {
                            return 'Cannot be empty';
                          } else {
                            try {
                              var qty = int.parse(value);
                              if (qty < 1) {
                                return 'Mininimum is 1';
                              }
                            } catch (e) {
                              log(e.toString());
                            }
                          }
                        }, 1),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    height: 200.0,
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      semanticContainer: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: InkWell(
                        onTap: () {},
                        splashColor: Colors.orangeAccent.withAlpha(30),
                        child: Center(
                          child: Text(
                            'Tap to take a picture',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
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
          Function(String value) f, Function(String value) v, int maxline) =>
      Container(
        child: TextFormField(
          keyboardType: textInputType,
          onSaved: f,
          validator: v,
          maxLines: maxline,
          decoration: InputDecoration(
            labelText: label,
            alignLabelWithHint: true,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      );
}
