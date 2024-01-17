import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class humidity extends StatefulWidget {
  const humidity({super.key});

  @override
  State<humidity> createState() => _humidityState();
}

class _humidityState extends State<humidity> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 105, 45),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 105, 45),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 255, 255)),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: false,
        title: const Text('Back', 
        style: TextStyle(
          fontFamily: 'PlusJakartaSans',
          color: Color.fromARGB(255, 255, 255, 255)
        ),
      ),
       toolbarHeight: 75,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100, top: 50, left: 5, right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 232, 232, 238),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              
              child: Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        height: size.width * 0.6,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Container(
                              height: size.width * 0.5,
                              width: size.width * 0.5,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(101, 154, 180, 253),
                                shape: BoxShape.circle
                              ),
                            ),
                            Image.asset(
                              'icons/humidity.png',
                              height: size.width * 0.55,
                              width: size.width * 0.55,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                     const Center(
                       child: Text("Unsafe Level of Humidity!",
                       style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                       ),
                       ),
                     ),

                     const SizedBox(height: 10,),
                     const Text("High humidity impedes the body's cooling mechanism, causing discomfort and health risks. In humid weather, sweat does not evaporate efficiently, requiring the body to work harder to cool down. Excessive sweating can lead to a loss of essential water and chemicals, potentially compromising overall health.",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 13,
                     ),
                     textAlign: TextAlign.justify,
                     ),

                     const SizedBox(height: 30,),
                     const Text("Impacts",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.w600
                     ),
                     ), 
                     
                     const SizedBox(height: 10,),
                     const Text("Dehydration.",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),

                     const SizedBox(height: 10,),
                     const Text("Heat exhaustion.",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),

                     const SizedBox(height: 10,),
                     const Text("Fatigue.",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),

                     const SizedBox(height: 10,),
                     const Text("Muscle cramps.",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),

                     const SizedBox(height: 10,),
                     const Text("Fainting",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),

                     const SizedBox(height: 10,),
                     const Text("Heat stroke",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),
                        
                     const SizedBox(height: 30,),
                     const Text("Preventive Measures",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.w600
                     ),
                     ), 
                     const SizedBox(height: 10,),
                     const Text("Take frequent breaks and stay hydrated when exposed to humid weather.",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),
                     const SizedBox(height: 10,),
                     const Text("Find a cool environment if feeling fatigued.",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),
                     const SizedBox(height: 10,),
                     const Text("Seek medical attention if experiencing severe symptoms, especially for vulnerable groups.",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      
    );
  }
}