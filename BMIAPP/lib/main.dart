import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var weight_c = TextEditingController();
  var feet_c = TextEditingController();
  var inch_c = TextEditingController();

  var result = "";
  var msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title, style: TextStyle(color: Colors.white),),
      ),

      body: Container(
        color: Colors.black12,
        child: Center(
          child: Container(
            width: 350,
            child: Padding(
              padding: const EdgeInsets.only(top: 75.0),
              child: Column(
                children: [
                  Text('BMI',
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold),
                  ),

                  SizedBox(
                    height: 11,
                  ),

                  TextField(
                    controller: weight_c,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      label: Text('Enter Your Weight in KGs'),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  TextField(
                    controller: feet_c,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      label: Text('Enter Your Height in Feets'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  TextField(
                    controller: inch_c,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      label: Text('Enter Your Height in Inches'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(
                    height: 11,
                  ),

                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      foregroundColor: MaterialStateProperty.all(Colors.white)
                    ),
                    onPressed: (){
                      var weight = weight_c.text.toString();
                      var feet = feet_c.text.toString();
                      var inch = inch_c.text.toString();

                      if(weight != "" && feet != "" && inch != "")
                        {
                            var iWeight = int.parse(weight);
                            var iFeet = int.parse(feet);
                            var iInch = int.parse(inch);

                            var tInch = (iInch*12) + iInch;

                            var tCm = tInch*2.54;

                            var tM = tCm/100;

                            var bmi = iWeight/(tM*tM);

                            if(bmi > 25){
                              msg = "You are Over Weight !!!";
                            }

                            else if(bmi < 18){
                              msg = "You are Under Weight !!!";
                            }

                            else{
                             msg = "You are Healthy :)";
                            }

                            setState(() {
                              result = "Your BMI is ${bmi.toStringAsFixed(2)}";
                            });

                        }
                      else{
                        setState(() {
                          result = "OHH !!! It seems like you forgot to enter all required feilds";
                        });
                      }
                    },
                    child: Text('Calculate'),
                  ),

                  SizedBox(
                    height: 11,
                  ),

                  Text(result,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,),
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  Text(msg,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,),
                  ),


                ],
              ),
            ),
          ),
        ),
      )

    );
  }
}
