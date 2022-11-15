import 'package:flutter/material.dart';
import 'package:loginpage/HomePage/home_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var userName = "";

  final formKey = GlobalKey<FormState>();

  moveToNextPage(BuildContext context){
    if(formKey.currentState!.validate()){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/hey.png", fit: BoxFit.cover,),

              const SizedBox(height: 25,),

              Text("Wellcome ${userName}",
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.purpleAccent,
                ),
              ),
              const SizedBox(height: 25,),

              Form(
                key: formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Ussername",
                        ),
                        onChanged: (value) {
                          setState(() {
                            userName = value;
                          });
                        },

                        validator: (value) {
                          if(value!.isEmpty){
                            return "Username cannot be empty";
                          }
                          else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 5,),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),

                        validator: (value) {
                          if(value!.isEmpty){
                            return "Password cannot be empty!";
                          }
                          else if(value!.length < 6){
                            return "Password length must exceed six!";
                          }
                          else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 25,),
                    ],
                  ),
                ),
              ),

              ElevatedButton(
                  onPressed: () => moveToNextPage(context),
                  child: const Text(
                      "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),

            ],
          ),
        ),
      ),
    );
  }
}
