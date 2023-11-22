import 'package:flutter/material.dart';
import 'package:miniproject/global_variable.dart';
import 'package:miniproject/screens/home.dart';
import 'package:miniproject/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Mini App",
//       home: const LoginScreen(),
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  Future<void> autoLogin() async {
    final pref = await SharedPreferences.getInstance();
    final String? username = pref.getString("Username");
    if (username != null) {
      usernameGB = username;
      isLogin = true;
    } else {
      isLogin = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mini App",
      home: isLogin ? const HomeScreen() : const LoginScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
