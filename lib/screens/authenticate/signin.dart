import 'package:firebasefluttter/services/auth.dart';
import 'package:flutter/material.dart';



class SignIn extends StatefulWidget {
  Function? toggleView;
  SignIn({this.toggleView, Key? key}):super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _authService=AuthService();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text("SIGN IN TO BREW CREW"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(onPressed: (){
              widget.toggleView!();
            }, icon: const Icon(Icons.person),label: const Text("REGISTER"),
            style: ButtonStyle(
              foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),),
            ),
          ),
        
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              TextFormField(
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
              ElevatedButton(onPressed: () async{
                await _authService.signInEmailPassword(email, password);
              }, child: const Text("SIGN IN"))

            ],
          ),
        ),
      ),
    );
  }
}
