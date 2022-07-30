import 'package:catalouge_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _buttonchange = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _buttonchange = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        _buttonchange = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                  child: Center(
                child: Image(
                  image: AssetImage('images/login_image.jpg'),
                  fit: BoxFit.cover,
                ),
              )),
              SizedBox(
                height: 20,
              ),
              Text(
                "welcome",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "email cannot be empty";
                        }
                      },
                      decoration: InputDecoration(
                          hintText: 'email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: ((value) {
                        if (value != null && value.isEmpty) {
                          return "password cannot be empty";
                        } else if (value != null && value.length < 6) {
                          return "password length cannot be less than 6";
                        }
                      }),
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1))),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Material(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          alignment: Alignment.center,
                          width: _buttonchange ? 50 : 150,
                          height: 40,
                          duration: const Duration(seconds: 1),
                          // decoration: BoxDecoration(
                          //     borderRadius:
                          //         BorderRadius.circular(_buttonchange ? 50 : 8),
                          //     color: Colors.purple),
                          child: _buttonchange
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "L O G I N",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                        ),
                      ),
                    ),
                    // ElevatedButton(
                    //     style: ButtonStyle(
                    //         minimumSize: MaterialStateProperty.all(Size(150, 40)),
                    //         backgroundColor:
                    //             MaterialStateProperty.all(Colors.white),
                    //         foregroundColor:
                    //             MaterialStateProperty.all(Colors.red)),
                    //     onPressed: () {
                    //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //     },
                    //     child: Text(
                    //       "L O G I N",
                    //     ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
