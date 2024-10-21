import 'package:flutter/material.dart';

class SafteyRules extends StatefulWidget {
  const SafteyRules({super.key});

  @override
  State<SafteyRules> createState() => _SafteyRulesState();
}

class _SafteyRulesState extends State<SafteyRules> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: 
      Container(

      height: screenHeight,
            width: screenWidth,
            decoration: const BoxDecoration(
               gradient: LinearGradient(
            colors: [
              Color(0xff000000),
              Color(0xff004780),

            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            stops: [0.0, 1],
          ),

            ),

            child: Padding(
              padding:  EdgeInsets.only(top: screenHeight*0.1,left: screenWidth*0.02,right:screenWidth*0.02   ),
              child:const  Text.rich(
              
                TextSpan(
                  style: TextStyle(fontSize: 14, color: Colors.white),
                  children: [
                    TextSpan(text: 'Driving Rules for Safe and Responsible Driving\n\n',style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),),

                    TextSpan(text:'Always Wear Your Seatbelt.\n\n'),
                    TextSpan(text:'Seatbelts save lives. Make sure everyone in the vehicle is wearing their seatbelt at all times, including passengers.Obey Speed Limits.\n\n'),
                    TextSpan(text:'Speed limits are set for safety. Driving too fast or too slow can be dangerous. Stick to the posted speed limits and adjust according to traffic, weather, and road conditions.Use Turn Signals.\n\n'),
                    TextSpan(text:'Always use your turn signals when changing lanes or turning. This communicates your intentions to other drivers and helps avoid accidents.Avoid Distracted Driving.\n\n'),
                    TextSpan(text:'Never drive while impaired: Alcohol, drugs, or any substances that affect your judgment or reaction time should never be consumed before driving.\n\n'),
                    TextSpan(text:'Keep a safe distance from the vehicle in front of you. A safe following distance gives you enough time to react in case of sudden stops or emergencies.\n\n'),
                    TextSpan(text:'Follow the traffic signals: Always stop at red lights and yield to pedestrians. This helps prevent accidents and keeps traffic flowing smoothly.\n\n'),
                  ]
                )
              
              
              
              ),
            ),
    ),

    );
    
    
  }
}