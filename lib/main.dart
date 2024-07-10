import 'package:flutter/material.dart';
import 'package:heart/drawer/demo1.dart';
import 'package:heart/drawer/demo2.dart';
import 'package:heart/logIn.dart';
import 'package:heart/screen/chat.dart';
import 'package:heart/screen/diary.dart';
import 'package:heart/screen/home.dart';
import 'package:heart/screen/mypage.dart';
import 'package:heart/screen/statistics.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 2;
  int _drawerIndex = 0;
  late PageController _pageController;
  String memberId = 'test';
  String nickname = 'text';
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  void _onTapDrawer(int index) {
    setState(() {
      _drawerIndex = index;
      if (index == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Demo1()));
      } else if (index == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Demo2()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isLargeScreen = width > 800;

    return Theme(
      data: ThemeData.light(),
      child: Scaffold(

        body: isLargeScreen
            ? Row(
                children: [
                  NavigationRail(
                    destinations: _navRailItems,
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                  const VerticalDivider(
                    thickness: 2,
                    width: 1,
                  ),
                  Column(
                    children: [
                      IndexedStack(
                        index: _selectedIndex,
                        children: const [
                          Chat(),
                          Diary(),
                          Home(),
                          Statistics(),
                          Mypage(),
                        ],
                      )
                    ],
                  )
                ],
              )
            : PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: const [
                  Chat(),
                  Diary(),
                  Home(),
                  Statistics(),
                  Mypage(),
                ],
              ),
       bottomNavigationBar: Container(
          color: const Color(0xFFFFFBA0), // 배경색 설정
          child: SalomonBottomBar(
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(0xff6200ee),
            unselectedItemColor: const Color(0xff757575),
            items: _navBarItems,
            onTap: _onItemTapped,
          ),
        ),
    ),
    );
  }
}

final _navBarItems = [
  SalomonBottomBarItem(
    icon: const Icon(Icons.chat),
    title: const Text("Chat",
    style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'single_day',
                    ),),
    selectedColor: const Color.fromARGB(255, 89, 181, 81),
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.note_alt_outlined),
    title: const Text("Diary",
   style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'single_day',
                    ),),
    selectedColor: const Color.fromARGB(255, 89, 181, 81),
  ),

  SalomonBottomBarItem(
    icon: const Icon(Icons.home),
    title: const Text("Home",
    
   style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'single_day',
                    ),),
    selectedColor: const Color.fromARGB(255, 89, 181, 81),
  ),

  SalomonBottomBarItem(
    icon: const Icon(Icons.bar_chart_sharp),
    title: const Text("Statistics",
    style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'single_day',
                    ),),
    selectedColor: const Color.fromARGB(255, 89, 181, 81),
  ),

  SalomonBottomBarItem(
    icon: const Icon(Icons.person_2_outlined),
    title: const Text("MyPage",
    style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'single_day',
                    ),),
    selectedColor: const Color.fromARGB(255, 89, 181, 81),
  ),
];

final _navRailItems = [
  const NavigationRailDestination(
    icon: Icon(Icons.home),
    label: Text("Home"),
  ),
  const NavigationRailDestination(
    icon: Icon(Icons.chat),
    label: Text("Chat"),
  ),
  const NavigationRailDestination(
    icon: Icon(Icons.note_alt_outlined),
    label: Text("Diary"),
  ),
  const NavigationRailDestination(
    icon: Icon(Icons.person),
    label: Text("Statistics"),
  ),
  const NavigationRailDestination(
    icon: Icon(Icons.person),
    label: Text("MyPage"),
  ),
];