import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_flutter/pages/bottomnav.dart';
import 'package:food_delivery_app_flutter/pages/login.dart';

import '../widget/widget_support.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", password = "", confirmpassword = "", name = "";

  TextEditingController namecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController confirmpasswordcontrollor = new TextEditingController();
final _formkey = GlobalKey<FormState>();


  registration() async {
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
            content: Text("Registered Succesfully",
                style: TextStyle(fontSize: 15))));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BottomNav()));
        if (password != confirmpassword) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password and Confirm Password do not match",
                style: TextStyle(fontSize: 18),
              )));
          return; // Dừng thực hiện nếu mật khẩu không khớp
        }

      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
            "Password Provided is too Weak",
            style: TextStyle(fontSize: 18),
          )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
            "Account Already exsists",
            style: TextStyle(fontSize: 18),
          )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            // Background gradient
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffdca99f),
                    Color(0xffdca99f),
                  ],
                ),
              ),
            ),
            // White box section
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Text(""),
            ),
            // Logo section
            Container(
              margin: EdgeInsets.only(top: 0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Center(
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Color(0xffdca99f).withOpacity(0.9),
                          // Apply background gradient color
                          BlendMode
                              .modulate, // Blend mode to combine image and background color
                        ),
                        child: Image.asset(
                          "images/logofood4.jpg",
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: MediaQuery.of(context).size.height / 3.5,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.only(left: 25, right: 25),
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.height / 1.7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Sign Up',
                                style: AppWidget.HeadlineTextFeildStyle(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: namecontroller,
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return 'Please Enter UserName';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Name',
                                    hintStyle: AppWidget.LightTextFeildStyle(),
                                    prefixIcon: Icon(Icons.person)),
                              ),
                              TextFormField(
                                controller: emailcontroller,
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return 'Please Enter E-mail';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: AppWidget.LightTextFeildStyle(),
                                    prefixIcon: Icon(Icons.email_outlined)),
                              ),
                              TextFormField(
                                controller: passwordcontroller,
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return 'Please Enter Password';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: AppWidget.LightTextFeildStyle(),
                                    prefixIcon: Icon(Icons.password_outlined)),
                              ),
                              TextFormField(
                                controller: confirmpasswordcontrollor,
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return 'Please Enter ConfirmPassword';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: 'Confirm password',
                                    hintStyle: AppWidget.LightTextFeildStyle(),
                                    prefixIcon: Icon(Icons.password_outlined)),
                              ),
                              SizedBox(
                                height: 90,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  if(_formkey.currentState!.validate()){
                                    setState(() {
                                      email = emailcontroller.text;
                                      name = namecontroller.text;
                                      password = passwordcontroller.text;
                                      confirmpassword= confirmpasswordcontrollor.text;
                                    });
                                  }
                                  registration();
                                },
                                child: Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: Color(0xffdca99f),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        "SIGN UP",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: 'Poppins1',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Center(
                          child: Text(
                        "Already have an account? Login",
                        style: AppWidget.semiBooldTextFeildStyle(),
                      )),
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
}
