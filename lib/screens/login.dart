import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:miniproject/global_variable.dart';
import 'package:miniproject/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode focusNodeUserName = FocusNode();
  TextEditingController controllUsername = TextEditingController();
  FocusNode focusNodePassword = FocusNode();
  TextEditingController controllPassword = TextEditingController();
  bool showPassword = false;
  SharedPreferences? pref;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(1, 0),
              end: Alignment(0, 1),
              colors: [
                Color.fromARGB(255, 0, 85, 255),
                Colors.white,
              ],
            ),
          ),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "ชื่อ",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  focusNode: focusNodeUserName,
                  controller: controllUsername,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Username",
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "รหัสผ่าน",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  focusNode: focusNodePassword,
                  controller: controllPassword,
                  obscureText: showPassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    prefixIcon: const Icon(
                      Icons.key,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        showPassword = !showPassword;
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.remove_red_eye,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "ลืมรหัสผ่าน",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  focusNodeUserName.unfocus();
                  focusNodePassword.unfocus();
                  if (controllUsername.text != "") {
                    print("object");
                    pref = await SharedPreferences.getInstance();
                    pref!.setString("Username", controllUsername.text);
                    usernameGB = controllUsername.text;
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
                  }

                  //username:tarzan
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.red),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: const Center(
                    child: Text("เข้าสู่ระบบ"),
                  ),
                ),
              ),
              // InkWell(
              //   onTap: () {},
              //   child: Container(
              //     decoration: const BoxDecoration(color: Colors.red),
              //     width: MediaQuery.of(context).size.width * 0.8,
              //     height: MediaQuery.of(context).size.height * 0.05,
              //     child: const Center(
              //       child: Text("เข้าสู่ระบบ"),
              //     ),
              //   ),
              // )
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Logo(Logos.google),
                  Logo(Logos.line),
                  Logo(Logos.facebook_f),
                  Logo(Logos.instagram),
                  Logo(Logos.apple),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
