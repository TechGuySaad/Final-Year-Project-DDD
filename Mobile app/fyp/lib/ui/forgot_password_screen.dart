import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp/ui/auth/login_screen.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
              height: screenHeight,
              width: screenWidth,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: 
          [
            Color(0xff000000),
            Color(0xff004780),
          ],
          begin: Alignment.topLeft,
            end: Alignment.topRight,
            stops: [0.0, 1], 
          ),
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
        
                  SizedBox(height: screenHeight*0.1,),
        
                  const Center(child : Text('Drive Sense',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w800,color: Color(0xff0076FF)))),
                  const Center(child : Text('Your driving companion',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: Colors.white))),
                  SizedBox(height: screenHeight*0.06,),
                  const Center(child : Text('Forgot Password',style: TextStyle(fontSize: 36,fontWeight: FontWeight.w800,color: Color(0xff0076FF)))),
                   SizedBox(height: screenHeight*0.06,),
                const  Padding(
                    padding:  EdgeInsets.only(left: 20),
                    child:   Text('Email',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.blueGrey)),
                  ),
        
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Enter your gmail...',
                          hintStyle:const TextStyle(color: Colors.blueGrey),
                          fillColor:const Color(0xffA3B4D1),
                          filled: true,
                          border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          ),
                    ),
                  ),
        
                  
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                  GestureDetector(
                    onTap: ()  {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const LogIn()));
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(left: screenWidth*0.04),
                      child: Container(
                        height: screenHeight * 0.07,
                        width: screenWidth * 0.9,
                        decoration: BoxDecoration(
                            color: const Color(0xff0076FF),
                            borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                              BoxShadow(
                                color: const Color(0xff0076FF).withOpacity(0.6), // Shadow color
                                blurRadius: 10, // Blur radius of the shadow
                                spreadRadius: 5, // Spread radius of the shadow
                              ),
                              ],
                            
                            ),
                        child: const Center(
                            child: Text(
                          'Continue',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        )),
                      ),
                    ),
                  ),
        
                  SizedBox(
                    height: screenHeight*0.06,
                  ),

                  Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left:screenWidth *0.08 , right: screenWidth*0.02 ),
                        child: Container(
                          height: 1,
                          width: screenWidth *0.35,
                          color: Colors.white,
                        ),
                      ),

                      const Text('OR',style: TextStyle(color: Colors.blue,fontSize: 14),),
                      Padding(
                        padding:  EdgeInsets.only(left:screenWidth *0.02 , right: screenWidth*0.08 ),
                        child: Container(
                          height: 1,
                          width: screenWidth *0.35,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: screenHeight * 0.06,
                  ),
                  GestureDetector(
                    onTap: ()  {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const LogIn()));
                      
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(left: screenWidth*0.04),
                      child: Container(
                        height: screenHeight * 0.07,
                        width: screenWidth * 0.9,
                        decoration: BoxDecoration(
                            color: const Color(0xff0076FF),
                            borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                              BoxShadow(
                                color: const Color(0xff0076FF).withOpacity(0.6), // Shadow color
                                blurRadius: 10, // Blur radius of the shadow
                                spreadRadius: 5, // Spread radius of the shadow
                              ),
                              ],
                            
                            ),
                        child: const Center(
                            child: Text(
                          'Try Again',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        )),
                      ),
                    ),
                  ),
                  
                 
                  
                ],
              ),
            ),
      )
    );
  }
}