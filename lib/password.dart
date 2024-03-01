import 'dart:ffi';

import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {

  List<bool> changColor=[false,false,false,false,false];
  double progressValue=0;
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
      
      body: Container(
 
        child:  Column(
          children: [
            const SizedBox(height: 200,),
           const  Align(
              alignment: Alignment.center,
              child:Text('Password Field Demo',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),), 
            ),


            const SizedBox(height: 40,),

            //textField


            Container(
              margin: const EdgeInsets.all(20),
              child:  TextField(
                onChanged: (value) =>{_runFuilter(value),_checkProgressValue()},
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Enter your password',labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,width:70),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                )),style:const  TextStyle(fontSize: 20,color: Colors.white),),
            ),
            const SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.all(10),
              child: LinearProgressIndicator(
              
              value: progressValue,
              color:_changeColorForLinearProgressIndicator(progressValue),
              minHeight: 10,
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(10),

            ),
            ),

          
            const SizedBox(height: 20,),
            
              Align(
              alignment: Alignment.centerLeft,
              
              child:Row(children: [
                const SizedBox(width: 10,),
                Image.asset(!changColor[0]?'images/close.png':'images/correct.png'),
                Text('  At least 8 charactors',style: TextStyle(color:changColor[0]?Colors.green :Color.fromARGB(255, 244, 67, 54)),),
               
               ],)
           
            ),
            const SizedBox(height: 5,),
              Align(
              alignment: Alignment.centerLeft,
               
              child:Row(children: [
                const SizedBox(width: 10,),
                Image.asset(!changColor[1]?'images/close.png':'images/correct.png'),
                Text('  Containes lowercase letters',style: TextStyle(color:changColor[1]?Colors.green :Color.fromARGB(255, 244, 67, 54)),),
               
               ],) 
            ),
            const SizedBox(height: 5,),
              Align(
              alignment: Alignment.centerLeft,
              child:Row(children: [
                const SizedBox(width: 10,),
                Image.asset(!changColor[2]?'images/close.png':'images/correct.png'),
                Text('  Containes uppercase letters',style: TextStyle(color:changColor[2]?Colors.green :Color.fromARGB(255, 244, 67, 54)),),
               
               ],) 
                  
            ),
            const SizedBox(height: 5,),
              Align(
              alignment: Alignment.centerLeft,
              child:Row(children: [
                const SizedBox(width: 10,),
                Image.asset(!changColor[3]?'images/close.png':'images/correct.png'),
                Text('  Containes numbers',style: TextStyle(color:changColor[3]?Colors.green :Color.fromARGB(255, 244, 67, 54)),),
               
               ],) 
            
            ),
            const SizedBox(height: 5,),
              Align(
              alignment: Alignment.centerLeft,
              child:Row(children: [
                const SizedBox(width: 10,),
                Image.asset(!changColor[4]?'images/close.png':'images/correct.png'),
                Text('  Containes special characters',style: TextStyle(color:changColor[4]?Colors.green :Color.fromARGB(255, 244, 67, 54)),),
               
               ],) 
        
            ),
            

            
           

        
        ]),

      ),

      ),

    );
  }

  Color _changeColorForLinearProgressIndicator(double progressValue) {
  if (progressValue < 0.25)
    return Colors.red;
  else if (progressValue < 0.5)
    return Colors.orange;
  else if (progressValue < 0.75)
    return Colors.yellow;
  else
    return Colors.green;
}
  
  void _checkProgressValue(){
    int count=0;
    for(int i=0;i<changColor.length;i++)
    {
      if(changColor[i]==true)count++;
    }
    progressValue=count/5;
    setState(() {
    
    });

  }
 

  void _runFuilter(String password){
    int numsChar=password.length;
    int lowercase=0,uppercase=0,numbers=0,spChar=0;
    for(int i=0;i<password.length;i++)
    {
      if(password.codeUnitAt(i)>=65&&password.codeUnitAt(i)<=90)uppercase++;
      else if(password.codeUnitAt(i)>=97&&password.codeUnitAt(i)<=122)lowercase++;
      else if(password.codeUnitAt(i)>=48&&password.codeUnitAt(i)<=57)numbers++;
      else spChar++;

      
    }
    setState(() {
      if(numsChar>=8)changColor[0]=true;
      else if(numsChar<8)changColor[0]=false;
      if(lowercase!=0)changColor[1]=true;
      else changColor[1]=false;
      if(uppercase!=0)changColor[2]=true;
      else changColor[2]=false;
      if(numbers!=0)changColor[3]=true;
      else changColor[3]=false;
      if(spChar!=0)changColor[4]=true;
      else changColor[4]=false;
    });
    
   
  }
}