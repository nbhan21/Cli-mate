import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class tempPage extends StatefulWidget {
  const tempPage({super.key});

  @override
  State<tempPage> createState() => _tempPageState();
}

class _tempPageState extends State<tempPage> {

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
                                color: Color.fromARGB(158, 248, 195, 195),
                                shape: BoxShape.circle
                              ),
                            ),
                            Image.asset(
                              'icons/Temperature.png',
                              height: size.width * 0.55,
                              width: size.width * 0.55,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                     const Center(
                       child: Text("Temperature is Rising!",
                       style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                       ),
                       ),
                     ),

                     const SizedBox(height: 10,),
                     const Text("Rapid temperature increases expose individuals to conditions that strain the body's ability to regulate temperature, leading to heat-related illnesses such as cramps, exhaustion, and stroke. These effects can manifest rapidly, posing a significant risk of hospitalization or even death, particularly for vulnerable populations during heatwaves.",
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
                     const Text("Increased risk of heat-related illnesses, such as heat stroke and heat exhaustion.",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),
                     const SizedBox(height: 10,),
                     const Text("Elevated risk of wildfires and land fires.",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),
                     const SizedBox(height: 10,),
                     const Text("Higher likelihood of drought and water scarcity.",
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
                     const Text("Stay well-hydrated by consuming ample amounts of water to prevent dehydration.",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),
                     const SizedBox(height: 10,),
                     const Text("Avoid outdoor activities during peak daytime heat.",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),
                     const SizedBox(height: 10,),
                     const Text("Use sunscreen to shield the skin from sunburn.",
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