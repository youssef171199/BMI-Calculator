import 'dart:ui';
import 'dart:math';

import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool isMale = true;
  double heightVal = 179;
  int weight = 55;
  int age = 27;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("body mass index"),
        centerTitle: true,
        backgroundColor:Colors.blue ,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Row(
                  children: [
                    m1expanded(context, 'male'),
                    SizedBox(
                      width: 15,
                    ),
                    m1expanded(context, "female")
                  ],
                )),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.white],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "height",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${heightVal.toStringAsFixed(1)}',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            'cm',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                      Slider(
                        value: heightVal,
                        onChanged: (newval) {
                          setState(() {
                            heightVal=newval;
                          });
                        },
                        min: 50,
                        max: 250,
                        inactiveColor:(Colors.black),
                        activeColor: (Colors.white),
                      )
                    ],
                  )),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Row(
                  children: [
                    m2expanded(context, 'weight'),
                    SizedBox(
                      width: 15,
                    ),
                    m2expanded(context, "age")
                  ],
                )),
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              width: double.infinity,
              color: Colors.white,
              child: TextButton(
                onPressed: () {
                  var result = weight / pow((heightVal / 100), 2);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return results(age: age, result: result, ismale: isMale);
                    }),
                  );
                },
                child: const Text(
                  "calculate",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded m1expanded(BuildContext context, type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = type == 'male' ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: isMale && type == 'male' || !isMale && type == 'female'
                    ? [Colors.blue, Colors.white]
                    : [
                        Color.fromARGB(175, 82, 172, 247),
                        Color.fromARGB(121, 48, 46, 46)
                      ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == "male" ? Icons.male : Icons.female,
                size: 40,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                type == "male" ? "male" : "female",
                style: Theme.of(context).textTheme.displayMedium,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2expanded(BuildContext context, type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == "weight" ? "weight" : "age",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              type == "weight" ? "${weight}" : "${age}",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    child: Icon(Icons.remove),
                    backgroundColor: Colors.black,
                    heroTag: type == 'age' ? "age--" : 'weight--',
                    onPressed: () {
                      setState(() {
                        type == 'age' ? age-- : weight--;
                      });
                    }),
                FloatingActionButton(
                    child: Icon(Icons.add),
                    backgroundColor: Colors.black,
                    heroTag: type == 'age' ? "age++" : 'weight++',
                    onPressed: () {
                      setState(() {
                        type == 'age' ? age++ : weight++;
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
