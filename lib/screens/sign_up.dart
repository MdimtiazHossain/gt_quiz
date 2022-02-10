import 'package:flutter/material.dart';
import 'package:gt_quiz/screens/sign_in.dart';
import 'package:gt_quiz/widgets/GTBottomBar.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  TextEditingController emailControiller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 27),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 44,
                      ),
                      Text(
                        "GT QUIZ",
                        style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0B0C46)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 60, bottom: 30),
                        child: TextFormField(
                          controller: nameController,
                          maxLines: 1,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: "Enter your Full Name",
                            hintText: "Full Name",
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
                              return "Invalid Name";
                          },
                          cursorColor: Colors.red,
                        ),
                      ),
                      TextFormField(
                        controller: emailControiller,
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Enter Your Email",
                          hintText: "Email Address",
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
                          if (value == null) return "Invalid your Email";
                        },
                        cursorColor: Colors.red,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30, bottom: 30),
                        child: TextFormField(
                          controller: phoneController,
                          maxLines: 1,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: "Enter Your Phone Number",
                            hintText: "Phone Number",
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
                              return "Invalid Phone Number";
                          },
                          cursorColor: Colors.red,
                        ),
                      ),
                      TextFormField(
                        controller: passwordController,
                        maxLines: 1,
                        obscureText: isObsecure,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Enter Your Password",
                          hintText: "Password",
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
                          margin: EdgeInsets.only(top: 40, bottom: 30),
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xff0B0C46),
                              borderRadius: BorderRadius.circular(16)),
                          padding: EdgeInsets.symmetric(vertical: 17),
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                color: Color(0xffFFFFFF), fontSize: 20),
                          ),
                        ),
                      ),
                      Text(
                        "Forgot Password?",
                        style:
                        TextStyle(color: Color(0xff323232), fontSize: 14),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => SignIn()
                          ));
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Already Have Account? ',
                            style: TextStyle(
                                color: Color(0xff323232),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: 'Login',
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
