import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class disease extends StatefulWidget {
  const disease({super.key});

  @override
  State<disease> createState() => _diseaseState();
}

class _diseaseState extends State<disease> {
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
                              'icons/coronavirus.png',
                              height: size.width * 0.55,
                              width: size.width * 0.55,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                     const Center(
                       child: Text("Increasing Risk of Diseases",
                       style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                       ),
                       ),
                     ),

                     const SizedBox(height: 10,),
                     const Text("Climate change amplifies the risk of vector-borne diseases like malaria and dengue fever, while overall temperature increases contribute to a higher incidence of various illnesses. Recognizing these impacts is crucial for individuals to take proactive steps in safeguarding their health amidst a changing climate.",
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
                     const Text("heighten the risk of diseases, including malaria, dengue fever, and heat-related illnesses.",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),
                     const SizedBox(height: 10,),
                     const Text("Rise in the number of disease cases.",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),
                     const SizedBox(height: 10,),
                     const Text("Increased healthcare costs.",
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
                     const Text("Use mosquito repellent to prevent malaria and dengue fever.",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),
                     const SizedBox(height: 10,),
                     const Text("Stay well-hydrated to prevent dehydration.",
                     style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                      fontSize: 15,
                     ),
                     ),
                     const SizedBox(height: 10,),
                     const Text("Wear loose and light-colored clothing to protect the skin from sunburn.",
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