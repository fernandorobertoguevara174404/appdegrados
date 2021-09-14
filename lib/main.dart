import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'Calculadora Fahrenheit - Celsius'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _temp = 0;

  final fahrenheitFieldController = TextEditingController();
  final celsiusFieldController = TextEditingController();

  void _convertF (String temp){
    double newTemp = (double.parse(temp) * (9.0 / 5.0)) + 32;
    setState(() {
      _temp =  newTemp;
    });
    fahrenheitFieldController.text = newTemp.toString();
  }

  void _convertC (String temp){
    double newTemp = (double.parse(temp) - 32) * (5.0/9.0);
    setState(() {
      _temp =  newTemp;
    });
    celsiusFieldController.text = newTemp.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: TextField(onChanged: _convertC, controller: fahrenheitFieldController, decoration: InputDecoration(labelText: "Fahrenheit"),),
              ),
              SizedBox(width: 50),
              Expanded(
                flex: 1,
                child: TextField(onChanged: _convertF, controller: celsiusFieldController, decoration: InputDecoration(labelText: "Celsius")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

