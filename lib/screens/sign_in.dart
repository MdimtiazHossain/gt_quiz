import 'package:flutter/material.dart';
import 'package:gt_quiz/screens/sign_up.dart';
import 'package:gt_quiz/widgets/GTBottomBar.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailControiller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  RegExp regex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 27),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 53,
                    ),
                    Text(
                      "GT QUIZ",
                      style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0B0C46)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 160, bottom: 52),
                      child: TextFormField(
                        controller: emailControiller,
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Enter your email address",
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Color(0xff0B0C46),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )),
                        ),
                        validator: (String? value) {
                          if (!regex.hasMatch(value.toString()))
                            return "Invalid your Email";
                        },
                        cursorColor: Colors.red,
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      maxLines: 1,
                      obscureText: isObsecure,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter New Password",
                        filled: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObsecure = !isObsecure;
                            });
                          },
                          icon: Icon(isObsecure
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Color(0xff0B0C46),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )),
                      ),
                      cursorColor: Colors.red,
                    ),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                        print("${emailControiller.text.toString()}");
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 74, bottom: 57),
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xff0B0C46),
                            borderRadius: BorderRadius.circular(16)),
                        padding: EdgeInsets.symmetric(vertical: 17),
                        child: Text(
                          "Login",
                          style:
                          TextStyle(color: Color(0xffFFFFFF), fontSize: 20),
                        ),
                      ),
                    ),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Color(0xff323232), fontSize: 14),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => SignUp()
                        ));
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'New User? ',
                          style: TextStyle(
                              color: Color(0xff323232),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          children: const <TextSpan>[
                            TextSpan(
                                text: 'Create Account',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff404CCF))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 16,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xff0B0C46),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16))),
                  ),
                  GTBottomBar()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

