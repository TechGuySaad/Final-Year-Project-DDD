
import 'package:flutter/material.dart';
import 'package:fyp/ui/home_screen.dart';
import 'package:fyp/ui/saftey_rules_screen.dart';

//import 'package:fyp/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});
  

  @override
  State<SettingScreen> createState() => _SettingScreenState();
  
}

class _SettingScreenState extends State<SettingScreen> {

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


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(screenHeight*0.1), 
      child: AppBar(
        flexibleSpace: Container(
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
        ),
        leading: Padding(
          padding:  EdgeInsets.only(left: screenWidth*0.04,top:screenHeight*0.02 ),
          child: InkWell(
            
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
            }


          ,child:  Icon(Icons.arrow_back_ios,color: Colors.white,))
        ),

      title:Padding(
        padding:  EdgeInsets.only(top:screenHeight*0.02),
        child: const Text(
                      'Settings',
                      style: TextStyle(color: Color(0xff0076FF), fontSize: 24, fontWeight: FontWeight.w700),
                    ),
      ) ,

      )
      
      
      ),
      body: Container(
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
                   padding:  EdgeInsets.only(top: screenHeight*0.02,),
                   child: const Center(
                     child:  CircleAvatar(
                      backgroundImage: AssetImage('assets/person.jpg'),
                      radius: 60,
                     ),
                   ),
                 ),
                  Padding(
                        padding:const  EdgeInsets.only(top: 5),
                        child: Center(
                          child: Text(
                            name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700,color: Colors.white),
                          ),
                        ),
                      ),

                      Padding(
                        padding:  EdgeInsets.only(left: screenWidth*0.04,right:screenWidth*0.04,top: screenHeight*0.04 ),
                        child: Container(
                          height: screenHeight *0.08,
                          width: screenWidth,
                          decoration: BoxDecoration(
                            color: const Color(0xff99ABCB),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(left: screenWidth*0.02,right: screenWidth*0.04),
                                child: Icon(Icons.settings, size: screenHeight*0.05,color: const Color(0xff004780),),
                              ),
                              const Text(
                                'Prefrences',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                       Padding(
                        padding:  EdgeInsets.only(left: screenWidth*0.04,right:screenWidth*0.04,top: screenHeight*0.02 ),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                    context,
                    _createSlideTransitionRoute(const SafteyRules()), // Use custom slide transition
                  );
                          },
                          child: Container(
                            height: screenHeight *0.08,
                            width: screenWidth,
                            decoration: BoxDecoration(
                              color: const Color(0xff99ABCB),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left: screenWidth*0.02,right: screenWidth*0.04),
                                  child: Icon(Icons.shield_moon_outlined, size: screenHeight*0.05,color: const Color(0xff004780),),
                                ),
                                const Text(
                                  'Safety Rules',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                       Padding(
                        padding:  EdgeInsets.only(left: screenWidth*0.04,right:screenWidth*0.04,top: screenHeight*0.02 ),
                        child: Container(
                          height: screenHeight *0.08,
                          width: screenWidth,
                          decoration: BoxDecoration(
                            color: const Color(0xff99ABCB),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(left: screenWidth*0.02,right: screenWidth*0.04),
                                child: Icon(Icons.phone, size: screenHeight*0.05,color: const Color(0xff004780),),
                              ),
                              const Text(
                                'Help & Support',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                       Padding(
                        padding:  EdgeInsets.only(left: screenWidth*0.04,right:screenWidth*0.04,top: screenHeight*0.02 ),
                        child: Container(
                          height: screenHeight *0.08,
                          width: screenWidth,
                          decoration: BoxDecoration(
                            color: const Color(0xff99ABCB),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(left: screenWidth*0.02,right: screenWidth*0.04),
                                child: Icon(Icons.help, size: screenHeight*0.05,color: const Color(0xff004780),),
                              ),
                              const Text(
                                'FAQs',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
    );
  }

  
  // Function to create a slide transition route
  Route _createSlideTransitionRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Start from the right
        const end = Offset.zero; // End at the center
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}



