import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/anmition/fadeanimation.dart';
import 'package:firebase_test/screen/login.dart';
import 'package:firebase_test/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Gender { fullname, Email, password, confirmpassword, phone }

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Color enabled = const Color(0xFF827F8A);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;
  Gender? selected;

  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF1F1A30),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: he * 0.05,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: we * 0.04),
                child: const Icon(Icons.arrow_back_outlined,color: Colors.white,size: 35.0,),
              ),
            ),
            SizedBox(
              height: he * 0.03,
            ),
            FadeAnimation(
              delay: 1,
              child: Container(
                margin: const EdgeInsets.only(right: 80.0),
                child: Text( "Create Account",style: GoogleFonts.heebo(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35,letterSpacing: 2),
                ),
              ),
            ),
            FadeAnimation(
              delay: 1,
              child: Container(
                margin: const EdgeInsets.only(right: 130.0),
                child: Text("Please fill the input below here", style:GoogleFonts.heebo(color: Colors.grey, letterSpacing: 1),
                ),
              ),
            ),
            SizedBox(height: he * 0.07),
            FadeAnimation(
              delay: 1,
              child: Container(
                width: we * 0.9,
                height: he * 0.071,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),color:selected == Gender.fullname ? enabled : backgroundColor,),
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: usernameController,
                  onTap: () {
                    setState(() {
                      selected = Gender.fullname;
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person_outlined,color: selected == Gender.fullname ? enabledtxt : deaible,),
                    hintText: 'FULL NAME',
                    hintStyle: TextStyle(color: selected == Gender.fullname ? enabledtxt : deaible,),
                  ),
                  style: TextStyle( color: selected == Gender.fullname ? enabledtxt : deaible,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: he * 0.02,
            ),
            FadeAnimation(
              delay: 1,
              child: Container(
                width: we * 0.9,
                height: he * 0.071,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),color: selected == Gender.phone ? enabled : backgroundColor,),
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: phoneController,
                  onTap: () {
                    setState(() {
                      selected = Gender.phone;
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.phone_android_outlined,color: selected == Gender.phone ? enabledtxt : deaible,),
                    hintText: 'PHONE',
                    hintStyle: TextStyle(color: selected == Gender.phone ? enabledtxt : deaible,),
                  ),
                  style: TextStyle(color: selected == Gender.phone ? enabledtxt : deaible,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: he * 0.02,
            ),
            FadeAnimation(
              delay: 1,
              child: Container(
                width: we * 0.9,
                height: he * 0.071,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(20.0), color: selected == Gender.Email ? enabled : backgroundColor,),
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: emailController,
                  onTap: () {
                    setState(() {
                      selected = Gender.Email;
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    prefixIcon: Icon( Icons.email_outlined,color: selected == Gender.Email ? enabledtxt : deaible,),
                    hintText: 'EMAIL',
                    hintStyle: TextStyle(color: selected == Gender.Email ? enabledtxt : deaible,),
                  ),
                  style: TextStyle(color: selected == Gender.Email ? enabledtxt : deaible,fontWeight: FontWeight.bold),),
              ),
            ),
            SizedBox(
              height: he * 0.02,
            ),
            FadeAnimation(
              delay: 1,
              child: Container(
                width: we * 0.9,
                height: he * 0.071,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(20.0),color: selected == Gender.password? enabled: backgroundColor),
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passwordController,
                  onTap: () {
                    setState(() {
                      selected = Gender.password;
                    });
                  },
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock_open_outlined,color:selected == Gender.password ? enabledtxt : deaible,),
                      suffixIcon: IconButton(icon: ispasswordev ? Icon(Icons.visibility_off,color: selected == Gender.password? enabledtxt: deaible,) : Icon(Icons.visibility,
                                color: selected == Gender.password? enabledtxt: deaible,),
                        onPressed: () =>
                            setState(() => ispasswordev = !ispasswordev),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: selected == Gender.password? enabledtxt : deaible)),
                  obscureText: ispasswordev,
                  style: TextStyle(color: selected == Gender.password ? enabledtxt : deaible,fontWeight: FontWeight.bold), ),
              ),
            ),
            SizedBox(
              height: he * 0.02,
            ),
            FadeAnimation(
              delay: 1,
              child: Container(
                width: we * 0.9,
                height: he * 0.071,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),color: selected == Gender.confirmpassword ? enabled: backgroundColor),
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: confirmPasswordController,
                  onTap: () {
                    setState(() {
                      selected = Gender.confirmpassword;
                    });
                  },
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock_open_outlined,color: selected == Gender.confirmpassword? enabledtxt: deaible,),
                      suffixIcon: IconButton(icon: ispasswordev? Icon(Icons.visibility_off,color: selected == Gender.confirmpassword? enabledtxt : deaible,) : Icon( Icons.visibility,
                                color: selected == Gender.confirmpassword? enabledtxt : deaible,
                              ),
                        onPressed: () =>
                            setState(() => ispasswordev = !ispasswordev),
                      ),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: selected == Gender.confirmpassword? enabledtxt: deaible)),
                  obscureText: ispasswordev, style: TextStyle(color: selected == Gender.confirmpassword ? enabledtxt: deaible,fontWeight: FontWeight.bold),),
              ),
            ),
            SizedBox(
              height: he * 0.02,
            ),
            FadeAnimation(
              delay: 1,
              child: TextButton(
                  onPressed: () async {
                    if (emailController.text == "" || passwordController.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("All Feild are required"),backgroundColor: Colors.red,
                      ));
                    } else if (passwordController.text !=confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("passowrd not match!"),backgroundColor: Colors.red,
                      ));
                    } else {
                      User? result = await AuthService().register(emailController.text, passwordController.text);
                      if (result != null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Account Registration Successful"),backgroundColor: Colors.green,
                        ));
                        print("Success");
                        print(result.email);
                      }
                    }
                  },
                  child: Text(
                    "SING UP",
                    style: GoogleFonts.heebo(color: Colors.black,letterSpacing: 0.5,fontSize: 20.0, fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 80),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)))),
            ),
            SizedBox(height: he * 0.13),
            FadeAnimation(
              delay: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Already have a account?",style: GoogleFonts.heebo(color: Colors.grey,letterSpacing: 0.5,)),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return Login();
                      }));
                    },
                    child: Text("Sing in",style: GoogleFonts.heebo(color: Colors.orange.withOpacity(0.9),fontWeight: FontWeight.bold,letterSpacing: 0.5,)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
