import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class extremeWeather extends StatefulWidget {
  const extremeWeather({super.key});

  @override
  State<extremeWeather> createState() => _extremeWeatherState();
}

class _extremeWeatherState extends State<extremeWeather> {
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
                                color: Color.fromARGB(158, 168, 165, 165),
                                shape: BoxShape.circle
                              ),
                            ),
                            Image.asset(
                              'icons/storm.png',
                              height: size.width * 0.55,
                              width: size.width * 0.55,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                     const Center(
                       child: Text("On-Going Extreme Weather!",
                       style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                       ),
                       ),
                     ),

                     const SizedBox(height: 10,),
                     const Text("Extreme weather events have immediate health impacts, including exposure to the elements, mental health effects, injuries during evacuation, and direct fatalities linked to the event itself, such as drowning in floods.",
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
                     const Text("Infrastructure and property damage.",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),
                     const SizedBox(height: 10,),
                     const Text("Loss of lives and injuries.",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),
                     const SizedBox(height: 10,),
                     const Text("Disruption of daily activities.",
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
                     const Text("Establish emergency plans to cope with extreme weather conditions.",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),
                     const SizedBox(height: 10,),
                     const Text("Stay informed through government and media updates on extreme weather.",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),
                     const SizedBox(height: 10,),
                     const Text("Adhere to early warnings issued for extreme weather events.",
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