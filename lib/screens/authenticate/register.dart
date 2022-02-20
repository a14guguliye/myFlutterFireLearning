import 'package:firebasefluttter/services/auth.dart';
import 'package:flutter/material.dart';




// ignore: must_be_immutable
class Register extends StatefulWidget {
   Function? toggleView;
  
  
  Register({this.toggleView, Key? key}):super(key: key);


  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth=AuthService();
  String email="";
  String password="";
  final _formkey=GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
    
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(onPressed: (){

              widget.toggleView!();

            }, icon: const Icon(Icons.person),label: const Text("SIGN IN"),
            style: ButtonStyle(
              foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),),
            ),
          ),
        ],
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text("SIGN IN TO BREW CREW"),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(height: 20,),
              TextFormField(
                validator: (value){
                  if(value==null || value.isEmpty)
                  {
                    return "Empty field";
                  }
                  return null;
                },
                onChanged: (val){
                  email=val;
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
                onChanged: (val)
                {
                  password=val; 
                },
                obscureText: true,
              ),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: (
                
              ) async{
              }, child: const Text("REGISTER"))

            ],
          ),
        ),
      ),
    );
  
    }
}