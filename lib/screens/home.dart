import 'package:flutter/material.dart';
import 'package:miniproject/global_variable.dart';
import 'package:miniproject/screens/gridview.dart';
import 'package:miniproject/screens/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> page = [
    GridViewScreen(),
    Container(
      color: Colors.blue,
    ),
    ProfileScreen()
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(usernameGB),
        leading: Container(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: page[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "setting",
          ),
        ],
      ),
    );
  }
}
