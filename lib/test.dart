import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : DefaultTabController(
        length :3,
       child: HomePage(),
      ),

    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color x= Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: x,
      appBar: AppBar(
        title: Text('my app'),
        actions: [
          IconButton(icon :Icon(Icons.share),onPressed: (){},),
          PopupMenuButton(itemBuilder: (x){
            return[
              PopupMenuItem(child: Text('red'),value: 0,),
              PopupMenuItem(child: Text('blue'),value: 1,),
              PopupMenuItem(child: Text('yellow'),value: 2,),
            ];
          },
            onSelected: (n){
              if (n==0){
                setState(() {
                  x=Colors.red;
                });
              }
              if (n==1){
                setState(() {
                  x=Colors.blue;
                });
              }
              if (n==2){
                setState(() {
                  x=Colors.yellow;
                });
              }
            }  ,
          ),
        ],
        bottom: TabBar(
          tabs: [
            Tab(
              icon :Icon(Icons.account_circle_sharp),
            ),
            Tab(

              icon :Icon(Icons.search),
            ),
            Tab(

              icon :Icon(Icons.account_box_sharp),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child:Column(
          children: [
            Text('welcome',),
          ],
        ) ,
      ),
      body: TabBarView(
        children: [

          Text('welcome2'),
          Text('welcome3'),
          Center(
            child: RaisedButton(
              child :Text('push'),
              onPressed: (){
                showDialog(context: context,
                    barrierDismissible: false,
                    builder: (context) {
                  return AlertDialog(title: Text('look out',style :TextStyle(color:Colors.black,fontSize: 20,fontWeight:FontWeight.bold )),

                    content: Container(
                      height: 70,
                      width: 300,
                      child: Text('Do you want to move from this page?'),
                    ),
                    actions: [
                     InkWell(
                       onTap :(){
                         Navigator.push(context,MaterialPageRoute(builder:(context)=>rokaia()));
                     },
                       child: Text ('ok',style: TextStyle(fontSize: 20),),
                     ),
                      InkWell(
                        onTap :(){
                          Navigator.of(context).pop();
                        },
                        child: Text ('cancel',style: TextStyle(fontSize: 20),),
                      ),
                    ],

                  );
                }
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(

        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Messages'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile')
          )
        ],
      ),
    );
  }
}

class rokaia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
       child: Positioned(
         bottom: 30,
         right: 40,
         left:10 ,
         top: 20,
          child: Text('Welcome',style: TextStyle(fontSize: 30,color: Colors.white),),
       ),

    );
  }
}

class MyAp extends StatefulWidget {
  @override
  _MyApState createState() => _MyApState();
}

class _MyApState extends State<MyAp> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:10 ),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    HomePage()
            )
        )
    );
  }
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Icon(Icons.audiotrack,size: 60,),





    );



  }
}



