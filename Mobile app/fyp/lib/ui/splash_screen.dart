import 'package:flutter/material.dart';
import 'package:fyp/ui/auth/login_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 5),(){

      Navigator.push(context, MaterialPageRoute(builder: (context)=> const LogIn()));

    });
  }

    @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return   MaterialApp(
      home: Scaffold(
      
       
       body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration:const BoxDecoration(
          gradient: LinearGradient(colors: 
          [
            Color(0xff000000),
            Color(0xff004780),
            
            
          ],
          begin: Alignment.topLeft,
            end: Alignment.topRight,
            stops: [0.0, 1], // Control how colors spread (0.3 = 30%, 0.8 = 80%)
          ),
        ),

        child: Column(


          children: [

            SizedBox(height:screenHeight*0.1 ),
            const Center(child : Text('Drive Sense',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w800,color: Color(0xff0076FF)))),
          const Center(child : Text('Your driving companion',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: Colors.white))),
          SizedBox(height:screenHeight*0.2 ),
         Image.asset('assets/car.png'),
          const Center(child : Text('Setting things up...',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: Colors.white))),
          ],
        ),


       ) ),
      );
      

    
}}