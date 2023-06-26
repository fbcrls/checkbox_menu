import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Flutter checkbox'),
        ),
        body: MyBody(),
      ),
    );
  }
}

class MyBody extends StatefulWidget {
  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  //properties for isChecked
  bool? isChecked = false;
  //properties for checklistData
  String? checklistData;

  //function to return checklistData's data depending on checkbox response.
  void checkboxChecker() {
    if (isChecked == false) {
      checklistData = 'not checked';
    } else {
      checklistData = 'checked';
    }
  }

  //run the checkboxChecker function before build
  @override
  void initState() {
    super.initState();
    checkboxChecker();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: [
            //Checkbox
            Checkbox(
                value: isChecked,
                activeColor: Colors.blue,
                onChanged: (checkValue) {
                  if (checkValue == true) {
                    setState(() {
                      isChecked = checkValue;
                      checklistData = 'checked';
                    });
                  }
                  if (checkValue == false) {
                    setState(() {
                      isChecked = checkValue;
                      checklistData = 'not checked';
                    });
                  }
                }),
            //Text to display checklistData's data
            Text('The checkbox is $checklistData'),
          ],
        ),
      ),
    );
  }
}
