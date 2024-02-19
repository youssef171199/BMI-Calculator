import 'dart:ui';

import 'package:flutter/material.dart';

class results extends StatelessWidget {
  const results(
      {super.key,
      required this.age,
      required this.result,
      required this.ismale});

  final int age;
  final double result;
  final bool ismale;

  String get resultphrase{
    String text = "";

    if (result >= 30 ) text= "obese";
    else if (result > 25 && result < 30 ) text= "overweght";
    else if (result > 18.5 && result < 24.9 ) text= "normal";
    else  text= "thin";
    
    return text;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("your results"),
        backgroundColor:Colors.blue
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Column(
            children: [
              // gender
              Card(
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(240)),
                margin: (const EdgeInsets.all(4)),
                child: Container(
                  
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                      gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
                  width: 250,
                  height: 120,
                  child: Center(
                    child: Text(
                      "Gender: ${ismale ? 'male' : 'female'}",
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            
             // healthy
      
              Card(
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(240)),
                margin: (const EdgeInsets.all(4)),
                child: Container(
                  
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                      gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
                  width: 250,
                  height: 120,
                  child: Center(
                    child: Text(
                      "healthness: ${resultphrase}",
                     style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              //result

              Card(
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(240)),
                margin: (const EdgeInsets.all(4)),
                child: Container(
                  
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                      gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
                  width: 250,
                  height: 120,
                  child: Center(
                    child: Text(
                      "your result: ${result.toStringAsFixed(2)}",
                     style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
      
              //age
      
              Card(
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(240)),
                margin: (const EdgeInsets.all(4)),
                child: Container(
                  
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                      gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
                  width: 250,
                  height: 120,
                  child: Center(
                    child: Text(
                      "age: ${age}",
                     style: Theme.of(context).textTheme.displayMedium, 
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
