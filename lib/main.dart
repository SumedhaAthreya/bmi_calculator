import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

double height = 149;
double weight = 70;
String bmi = "";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.red),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text("Height\n ${height.round()}",
                        style: TextStyle(fontSize: 32)),
                  ),
                  Slider(
                    value: height,
                    max: 210,
                    min: 100,
                    onChanged: (newValue) {
                      setState(() {
                        height = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.red),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Weight\n  ${weight}",
                        style: TextStyle(fontSize: 32)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.add,
                        ),
                        iconSize: 30,
                        color: Colors.yellow,
                        onPressed: () {
                          setState(() {
                            weight += 1;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.remove,
                        ),
                        iconSize: 30,
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            weight -= 1;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.red),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text("Result", style: TextStyle(fontSize: 28)),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.double_arrow_rounded,
                      ),
                      iconSize: 50,
                      color: Colors.blue,
                      onPressed: () {
                        setState(() {
                          double x;
                          x = weight / ((height * height) / 10000);
                          bmi = x.toStringAsFixed(2);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => secondScreen()));
                        });
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class secondScreen extends StatelessWidget {
  const secondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text('Result'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 350,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.pink),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      "BMI\n=\n${bmi}",
                      style: TextStyle(fontSize: 42),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 200,
                    color: Colors.purple,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Check Again"))
                      ],
                    ),
                  )
                ],
              ),
            )
          ], //children1
        ),
      ),
    );
  }
}