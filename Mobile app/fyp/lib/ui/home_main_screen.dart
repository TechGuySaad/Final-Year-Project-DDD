import  'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double value = 48; // piechart value 

    // Get the current date
    DateTime now = DateTime.now();
    
    // Format the date as "dd.MM.yyyy"
    String formattedDate = DateFormat('d.M.yyyy').format(now);

    return  Scaffold(
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
          child: const CircleAvatar(backgroundImage: AssetImage('assets/person.jpg'),
                        radius: 24,),
        ),

      title:Padding(
        padding:  EdgeInsets.only(top:screenHeight*0.02),
        child: const Text('Aimal Khan', style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
      ) ,

      actions: [
        Padding(
          padding:  EdgeInsets.only(right: screenWidth*0.04,top:screenHeight*0.02),
          child: const Icon(Icons.notifications,color: Colors.white,size: 22,),
        ),
      ],
      )
      
      
      ),

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
              children: [
        
                SizedBox(height: screenHeight*0.05,),
        
                Padding(
                  padding:  EdgeInsets.only(left: screenWidth*0.04,right:screenWidth*0.04 ),
                  child:   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
        
                      Container(
                        height: screenHeight*0.08,
                        width: screenWidth *0.18,
                        decoration: BoxDecoration(
                          color: const Color(0xff39464C),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child:const  Center(child: Icon(Icons.add_ic_call_rounded,color: Colors.white,size: 34,)),
                      ),
        
                      Container(
                        height: screenHeight*0.08,
                        width: screenWidth *0.18,
                        decoration: BoxDecoration(
                          color: const Color(0xff39464C),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child:const  Center(child: Icon(Icons.notifications_active,color: Colors.red,size: 34,)),
                      ),
        
                      Container(
                        height: screenHeight*0.08,
                        width: screenWidth *0.18,
                        decoration: BoxDecoration(
                          color: const Color(0xff39464C),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child:const  Center(child: Icon(Icons.speaker ,color: Colors.white,size: 34,)),
                      ),
                  
                      
                  
                    ],
                  ),
        
        
                ),
        
                              SizedBox(height: screenHeight*0.06,),
        
                Padding(
                  padding:  EdgeInsets.only(left: screenWidth*0.04,right:screenWidth*0.04 ),
                  child:   Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right:screenWidth*0.28 ),
                        child: const Text('Your Driving Statistics', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                      ),
                      const Icon(Icons.refresh_rounded,color: Colors.white,size: 24,),
                  
                    ],
                  ),
                ),
                 SizedBox(height: screenHeight*0.06,),
        
                Padding(
                  padding:  EdgeInsets.only(left: screenWidth*0.04,right:screenWidth*0.04 ),
                  child:   Row(
                    children: [
                      
                      Container(
        
                        height: screenHeight *0.17,
                        width:  screenWidth *0.35,
                        decoration:  BoxDecoration(
                          color: const  Color(0xff39464C),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: 
                        Padding(
                         padding:  EdgeInsets.only(left: screenWidth*0.04,top: screenHeight*0.02),
                         child:   Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             const  Icon(Icons.wifi,color: Colors.green,size: 26,),
                               SizedBox(height: screenHeight*0.01,),
                              const Text('Internet', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),
                              const Text('Connected', style: TextStyle(color: Colors.green,fontSize: 12,fontWeight: FontWeight.w400),),
                            ],
                                 
                          ),
                       ),
                      ),

                      SizedBox(width: screenWidth*0.02,),
        
                      Container(
        
                        height: screenHeight *0.17,
                        width:  screenWidth *0.55,
                        decoration:  BoxDecoration(
                          color: const  Color(0xff39464C),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: 
                        Row(
                          children: [

                            Padding(
                             padding:  EdgeInsets.only(left: screenWidth*0.04,top: screenHeight*0.02),
                             child:   Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 
                                   SizedBox(height: screenHeight*0.01,),
                                  const Text('Driving', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),
                                  const Text('Safety', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),
                                  const Text('Unsafe', style: TextStyle(color: Colors.red,fontSize: 12,fontWeight: FontWeight.w400),),
                                ],
                                     
                              ),
                              ),
                           SizedBox(width: screenWidth*0.03,),

                    SizedBox(
                      width: screenWidth *0.27, 
                      height: screenHeight * 1, 
                      child: PieChart(
                        PieChartData(
                          sections: [
                            
                            PieChartSectionData(
                              color: Colors.black, 
                              value: 100 - value, 
                              radius: 6, 
                              showTitle: false
                              
                            ),

                            PieChartSectionData(
                              color: Colors.white, 
                              value: value, 
                              title: '${value.toStringAsFixed(0)}%', 
                              radius: 18,
                              titleStyle:const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black, 
                              ),
                            ),
                          
                          ],
                        
                          borderData: FlBorderData(show: false), // Remove border around the chart
                        ),
                        
                      ),
                      
                    ),
                          
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.only(left: screenWidth*0.04,right:screenWidth*0.04, top: screenHeight *0.02 ),
                  child:   Row(
                    children: [
                      
                      Container(
        
                        height: screenHeight *0.17,
                        width:  screenWidth *0.35,
                        decoration:  BoxDecoration(
                          color: const  Color(0xff39464C),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: 
                        Padding(
                         padding:  EdgeInsets.only(left: screenWidth*0.04,top: screenHeight*0.02),
                         child:   Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             const  Icon(Icons.calendar_month,color: Colors.red,size: 26,),
                               SizedBox(height: screenHeight*0.01,),
                               Text(formattedDate, style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),
                              // const Text('Connected', style: TextStyle(color: Colors.green,fontSize: 12,fontWeight: FontWeight.w400),),
                            ],
                                 
                          ),
                       ),
                      ),

                      SizedBox(width: screenWidth*0.02,),
        
                      Container(
        
                        height: screenHeight *0.17,
                        width:  screenWidth *0.55,
                        decoration:  BoxDecoration(
                          color: const  Color(0xff39464C),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: 
                        Row(
                          children: [

                            Padding(
                             padding:  EdgeInsets.only(left: screenWidth*0.04,top: screenHeight*0.02),
                             child:   Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 
                                  const  Icon(Icons.warning,color: Colors.red,size: 26,),
                               SizedBox(height: screenHeight*0.01,),
                              const Text('Alert Count', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),
                              const Text('From Last Trip', style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w400),),
                                ],
                                     
                              ),
                              ),
                           SizedBox(width: screenWidth*0.07,),

                            const Text('10', style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                          
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                SizedBox(height: screenHeight*0.02,),

                Container(
                  height: screenHeight *0.17,
                        width:  screenWidth *0.92,
                        decoration:  BoxDecoration(
                          color: const  Color(0xff39464C),
                          borderRadius: BorderRadius.circular(12)
                        ),

                        child: Padding(
                          padding:  EdgeInsets.all(screenHeight*0.01),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                          
                                  SizedBox(
                                    height: screenHeight *0.08,
                                    width: screenWidth*0.15,
                                    child: const Image(image: AssetImage('assets/drifiting.png',),fit: BoxFit.contain,),
                                  ),
                                  SizedBox(
                                    height: screenHeight *0.06,
                                    width: screenWidth*0.15,
                                    child: const Image(image: AssetImage('assets/eye.png',),fit: BoxFit.contain,),
                                  ),
                                  SizedBox(
                                    height: screenHeight *0.06,
                                    width: screenWidth*0.15,
                                    child: const Image(image: AssetImage('assets/smile.png',),fit: BoxFit.contain,),
                                  ),
                          
                                 
                                  
                                ],
                              ),

                               Row(
                                
                                children: [

                                   Padding(
                                     padding: EdgeInsets.only(left:screenWidth *0.03,right: screenWidth*0.33),
                                     child: const Text('4', style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                                   ),
                          
                                  const Text('3', style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                          
                                 Padding(
                                   padding:  EdgeInsets.only(left:screenWidth *0.32,right: screenWidth*0.03),
                                   child:const  Text('3', style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                                 ),            
                                ],
                              ),
                            ],
                          ),
                        ),
                )
        
        
        
              ],
            ),
        ),
      ),

      
    );
  }
}