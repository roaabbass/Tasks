
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled55/user%20inter/screen/count.dart';
import 'package:untitled55/user%20inter/screen/login.dart';
import 'package:untitled55/user%20inter/screen/myHomepage.dart';
import 'package:untitled55/user%20inter/screen/profile.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  void getPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> screens = [
    const ListScreen(),
    CounterA(),
    const Profile(),
  ];

  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        foregroundColor: Colors.blueGrey,
        leading: IconButton(
          onPressed: () async {
            await signOut().then((value) {
              if (value) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
              }
            });
          },
          icon: const Icon(Icons.logout),
        ),
        title: const Text('HELLO FRESH'),
        actions: [
          SvgPicture.asset(
            'assets/A.svg',
            height: 45,
            alignment: Alignment.bottomLeft,
          ),
        ],
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          getPage(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'HOME'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            label: 'COUNTER',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'PROFILE',
          )
        ],
      ),
    );
  }
}
