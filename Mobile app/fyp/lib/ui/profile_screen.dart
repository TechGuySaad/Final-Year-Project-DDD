
import 'package:flutter/material.dart';
import 'package:fyp/ui/auth/login_screen.dart';
import 'package:fyp/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
  
}

class _ProfileScreenState extends State<ProfileScreen> {

  String name = '';
  String gmail = '';
  

@override
  void initState() {
    super.initState();
    load_data(); // Load data when the widget is initialized
  }


// function to load data 
  Future <void> load_data() async{
  final prefs = await SharedPreferences.getInstance();

  var savedName = prefs.getString('name');
  var savedGmail = prefs.getString('gmail2');
 
 setState(() {
   name = savedName ?? 'Guest';
   gmail = savedGmail ?? 'guest@gmail.com';
 });
    
}

// Function to log out and clear shared preferences
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('name');   
    prefs.remove('gmail2'); 
    prefs.remove('gmail'); 

    // Navigate to the login or any other screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LogIn()),

    );
    Utils().toastMessage('LogOut Successfully',"green");
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
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
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                   padding: EdgeInsets.only(top:screenHeight * 0.08,left: screenWidth*0.04),
                   child: const Text(
                      'Account',
                      style: TextStyle(color: Color(0xff0076FF), fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    
                 ),
                 Padding(
                   padding:  EdgeInsets.only(top: screenHeight*0.02,left: screenWidth*0.3),
                   child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/person.jpg'),
                    radius: 60,
                   ),
                 )
              ],
            ),
          ),
          Positioned(
              top: screenHeight * 0.35,
              left: 0,
              right: 0,
              child: Container(
                  height: screenHeight,
                  decoration: const BoxDecoration(
                      color: Color(0xff39464C),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 30, left: 40),
                        child: Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400,color: Color(0xff0076FF)),
                        ),
                      ),

                      

                       Padding(
                        padding:const  EdgeInsets.only(top: 5, left: 40),
                        child: Text(
                          name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white),
                        ),
                      ),

                      Padding(
                        padding:  EdgeInsets.only(top: screenHeight *0.015,left: screenWidth*0.11,right: screenWidth*0.11, bottom: screenHeight*0.002),
                        child: Container(
                          height: 1,
                          width: screenWidth ,
                          color: Colors.white,
                        
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.only(top: 30, left: 40),
                        child: Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400,color: Color(0xff0076FF)),
                        ),
                      ),

                      

                       Padding(
                        padding:const  EdgeInsets.only(top: 5, left: 40),
                        child: Text(
                          gmail,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white),
                        ),
                      ),

                      Padding(
                        padding:  EdgeInsets.only(top: screenHeight *0.015,left: screenWidth*0.11,right: screenWidth*0.11, bottom: screenHeight*0.02 ),
                        child: Container(
                          height: 1,
                          width: screenWidth ,
                          color: Colors.white,
                        
                        ),
                      ),
                      
                      Padding(
                          padding:  EdgeInsets.only(top: screenHeight *0.1, left: screenWidth*0.34),
                          child: GestureDetector(
                            onTap: () {
                              logout();
                            },
                            child: Container(
                                height: screenHeight * 0.06,
                                width: screenWidth * 0.3,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.red,
                                    )
                                    
                                    ),
                                child:const Center(
                                      child: Text(
                                        'Sign Out',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                    ),
                                
                                ),
                          )),
                    ],
                  )))
        ],
      ),
    );
  }
}