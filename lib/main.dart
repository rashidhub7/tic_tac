import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var grid = [
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
  ];
  var currentplayer ="x";
  void drawxo(i){
    if(
    grid[i]=="-"
    ){
      setState(() {
        grid[i]=currentplayer;
        currentplayer = currentplayer =="x" ?"o" :"x";

      });
    }

  }

   void reset (){
    setState(() {
      grid = [
        '-',
        '-',
        '-',
        '-',
        '-',
        '-',
        '-',
        '-',
        '-',
      ];
    });
   }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.cyan[900],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Tic-Tac-Toe",style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              margin:EdgeInsets.all(30) ,
              color: Colors.black,
              child: GridView.builder(
                shrinkWrap:true ,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 3, mainAxisSpacing: 3),
                itemCount: grid.length,
                itemBuilder: (context, index) => Material(
                  color: Colors.white,
                  child: InkWell(
                    splashColor: Colors.blueAccent,
                    onTap: ()=>drawxo(index),
                    child: Center(
                        child: Text(
                      grid[index],
                      style: TextStyle(fontSize: 30),
                    )),
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(onPressed: reset, icon: Icon(Icons.refresh), label: Text("New"),)
          ],
        ),
      ),
    );
  }
}
