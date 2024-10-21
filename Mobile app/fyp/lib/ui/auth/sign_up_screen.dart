import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp/ui/auth/login_screen.dart';
import 'package:fyp/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}


class _SignUpState extends State<SignUp> {
  var gmailText = TextEditingController();
  var passwordText = TextEditingController();
  var nameText = TextEditingController();
  bool _isObscured = true;

void password_visbility(){
    setState(() {
      _isObscured =!_isObscured;
    });
  }
  
  @override
  
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
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
          ),),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
          
                      
                  SizedBox(height: screenHeight*0.1,),
          
                  const Center(child : Text('Drive Sense',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w800,color: Color(0xff0076FF)))),
                  const Center(child : Text('Your driving companion',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: Colors.white))),
                  SizedBox(height: screenHeight*0.05,),
                  const Center(child:  Text('Signup',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w800,color: Color(0xff0076FF)))),
                  const  Padding(
                    padding:  EdgeInsets.only(left: 20),
                    child:   Text('Fullname',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.blueGrey)),
                  ),
                       Padding(
                        padding:  EdgeInsets.only(left: screenWidth *0.05,right:screenWidth *0.05,bottom: screenHeight*0.02 ),
                        child: TextField(
                          controller: nameText,
                          decoration: InputDecoration(
                              hintText: 'Enter your name...',
                              hintStyle:const TextStyle(color: Colors.blueGrey),
                          fillColor:const Color(0xffA3B4D1),
                          filled: true,
                          border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          
                              ),
                        ),
                      ),
                      const  Padding(
                    padding:  EdgeInsets.only(left: 20),
                    child:   Text('Gmail',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.blueGrey)),
                  ),
                      Padding(
                        padding:  EdgeInsets.only(
                            left: screenWidth *0.05, right: screenWidth *0.05, bottom: screenHeight *0.02),
                        child: TextField(
                          controller: gmailText,
                          decoration: InputDecoration(
                              hintText: 'Enter your gmail...',
                              hintStyle:const TextStyle(color: Colors.blueGrey),
                          fillColor:const Color(0xffA3B4D1),
                          filled: true,
                          border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                              //border: InputBorder.none
                              ),
                        ),
                      ),
                      const  Padding(
                    padding:  EdgeInsets.only(left: 20),
                    child:   Text('Password',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.blueGrey)),
                  ),
                      Padding(
                        padding:  EdgeInsets.only(
                            left: screenWidth *0.05, right: screenWidth *0.05, bottom: screenHeight *0.02),
                        child: TextField(
                          obscureText: _isObscured,
                          decoration: InputDecoration(
                              hintText: 'Enter your password...',
                              hintStyle:const TextStyle(color: Colors.blueGrey),
                          fillColor:const Color(0xffA3B4D1),
                          filled: true,
                          border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                password_visbility();
                              },
                              icon: Icon(
                  _isObscured ? Icons.remove_red_eye : Icons.visibility_off, // Change icon based on visibility
                  color: Colors.black54,
                ),)
                              //border: InputBorder.none
                            ),
                        ),
                      ),
                      const  Padding(
                    padding:  EdgeInsets.only(left: 20),
                    child:   Text('Confirm Password',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.blueGrey)),
                  ),
                      Padding(
                        padding:  EdgeInsets.only(
                             left: screenWidth *0.05, right: screenWidth *0.05, bottom: screenHeight *0.04 ),
                        child: TextField(
                          obscureText: _isObscured,
                          controller: passwordText,
                          decoration: InputDecoration(
                              hintText: 'Enter your password...',
                              hintStyle:const TextStyle(color: Colors.blueGrey),
                          fillColor:const Color(0xffA3B4D1),
                          filled: true,
                          border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                password_visbility();
                              },
                              icon: Icon(
                  _isObscured ? Icons.remove_red_eye : Icons.visibility_off, // Change icon based on visibility
                  color: Colors.black54,
                ),)
                              //border: InputBorder.none
                              ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: screenWidth*0.04),
                        child: GestureDetector(
                          onTap: () async {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LogIn()));
                        
                            var gmail = gmailText.text.toString();
                            var password = passwordText.text.toString();
                            var name = nameText.text.toString();
                        
                            var prefs = await SharedPreferences.getInstance();
                        
                            prefs.setString("gmail", gmail);
                            prefs.setString("password", password);
                            prefs.setString("name", name);
                            Utils().toastMessage('SignIn Successfully',"green");
                          },
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
                              'SIGN IN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
          
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                         const Text(
                            "Already have account?",
                            style: TextStyle(color: Colors.blueGrey, fontSize: 14),
                          ),
                      Padding(
                        padding:  EdgeInsets.only( left: screenWidth*0.01),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LogIn()));
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color(0xff0076FF),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
          
                        ],
                      ),
                      
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}