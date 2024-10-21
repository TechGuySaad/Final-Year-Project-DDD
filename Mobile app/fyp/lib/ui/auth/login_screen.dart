import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp/ui/auth/sign_up_screen.dart';
import 'package:fyp/ui/forgot_password_screen.dart';
import 'package:fyp/ui/home_screen.dart';
import 'package:fyp/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var gmailText2 = TextEditingController();
  var passwordText2 = TextEditingController();
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
                  SizedBox(height: screenHeight*0.05,),
                  const Center(child : Text('Login',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w800,color: Color(0xff0076FF)))),
                  
                const  Padding(
                    padding:  EdgeInsets.only(left: 20),
                    child:   Text('Email',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.blueGrey)),
                  ),
        
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                    child: TextField(
                      controller: gmailText2,
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
        
                  const  Padding(
                    padding:  EdgeInsets.only(left: 20),
                    child:   Text('Password',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.blueGrey)),
                  ),
        
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: TextField(
                      controller: passwordText2,
                      obscureText: _isObscured,
                      decoration: InputDecoration(
                          hintText: 'Enter your password...',
                          hintStyle:const TextStyle(color: Colors.blueGrey),
                            fillColor:const Color(0xffA3B4D1),
                            filled: true,
                            border:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                          //border: InputBorder.none
                          suffixIcon: IconButton(
                              onPressed: () {
                                password_visbility();
                              },
                              icon: Icon(
                  _isObscured ? Icons.remove_red_eye : Icons.visibility_off, // Change icon based on visibility
                  color: Colors.black54,
                ),)),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.57,top: 5),
                    child: InkWell(

                      onTap: () {
                        
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgotPassword()));
                      },

                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.18,
                  ),
                  GestureDetector(
                    onTap: () async {
                      var gmail2 = gmailText2.text.toString();
                      var password2 = passwordText2.text.toString();
        
                      var prefs = await SharedPreferences.getInstance();
        
                      prefs.setString("gmail2", gmail2);
                      prefs.setString("password2", password2);
        
                      var getgmail = prefs.getString('gmail');
                      var getpassword = prefs.getString('password');
        
                      var getgmail2 = prefs.getString('gmail2');
                      var getpassword2 = prefs.getString('password2');
        
                      if (getgmail == getgmail2 &&
                          getpassword == getpassword2) {
                        Utils().toastMessage('Login Successfully',"green");
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                      } else {
                        Utils().toastMessage('Incorrect password or email',"red");
                      }
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
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        )),
                      ),
                    ),
                  ),
        
                  SizedBox(
                    height: screenHeight*0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have account?",
                        style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                      ),
                      SizedBox(
                   width: screenWidth*0.02,
                  ),
        
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUp()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          color:  Color(0xff0076FF),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  )
        
                    ],
                  )
                 
                  
                ],
              ),
            ),
      )
    );
  }
}