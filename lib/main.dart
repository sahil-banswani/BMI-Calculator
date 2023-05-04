import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "BMI Calculator",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.amber),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var htController = TextEditingController();
  var inController = TextEditingController();

  var result = '';
  var bgColor = Colors.grey.shade400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calcultor"),
        actions: [],
      ),
      body: Center(
        child: Container(
          color: bgColor,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'BMI',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: wtController,
              decoration: const InputDecoration(
                  label: Text('Enter your Weight(Kg\'s)'),
                  prefixIcon: Icon(Icons.line_weight)),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 21,
            ),
            TextField(
              controller: htController,
              decoration: InputDecoration(
                  label: Text('Enter your Height(in Feet)'),
                  prefixIcon: Icon(Icons.height)),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 21,
            ),
            TextField(
              controller: inController,
              decoration: InputDecoration(
                  label: Text('Enter your Height(in inch)'),
                  prefixIcon: Icon(Icons.height)),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 31,
            ),
            ElevatedButton(
              onPressed: () {
                var inch = inController.text.toString();
                var ht = htController.text.toString();
                var wt = wtController.text.toString();

                if (wt != "" && ht != "" && inch != "") {
                  //BMI Calculation
                  var iWt = int.parse(wt);
                  var iHt = int.parse(ht);
                  var iInch = int.parse(inch);

                  var totalInch = (iHt * 12) + iInch;
                  var totalCentiMeter = totalInch * 2.54;
                  var totalMeter = totalCentiMeter / 100;

                  var bmi = iWt / (totalMeter * totalMeter);
                  var mssg = "";
                  if (bmi > 25) {
                    mssg = "Yoy are OverWeight";
                    bgColor = Colors.orange.shade200;
                  } else if (bmi < 18) {
                    mssg = "Your are UnderWeight!!";
                    bgColor = Colors.red.shade300;
                  } else {
                    mssg = "You're Healthy!!";
                    bgColor = Colors.green.shade300;
                  }
                  setState(() {
                    result = "Your BMI is: ${bmi.toStringAsFixed(4)}";
                  });
                } else {
                  setState(() {
                    result = "Please fill al the requied values";
                  });
                }
              },
              child: Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              result,
              style: TextStyle(fontSize: 20),
            )
          ]),
        ),
      ),
    );
  }
}
