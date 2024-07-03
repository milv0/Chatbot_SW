import 'package:flutter/material.dart';
import 'package:heart/logIn.dart';
import 'package:heart/screen/chat.dart';
import 'package:heart/screen/diary.dart';
import 'package:heart/screen/home.dart';
import 'package:heart/drawer/mypage.dart';
import 'package:heart/screen/screen4.dart';
import 'package:heart/screen/screen5.dart';
import 'package:heart/drawer/statistics.dart';
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
  int _selectedIndex = 0;
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
            context, MaterialPageRoute(builder: (context) => Mypage()));
      } else if (index == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Statistics()));
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
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          leading: isLargeScreen
              ? null
              : Builder(
                  builder: (context) => IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(Icons.menu),
                  ),
                ),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "마음씨",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        drawer: NavigationDrawer(
          selectedIndex: _drawerIndex,
          onDestinationSelected: _onTapDrawer,
          children: [
            if (isLogin)
              DrawerHeader(
                child: Text('안녕하세요\n ${nickname}님!'),
              )
            else
              DrawerHeader(
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login())),
                  child: Text('로그인하기'),
                ),
              ),
            NavigationDrawerDestination(
                icon: Icon(Icons.portrait_sharp), label: Text('My Page')),
            NavigationDrawerDestination(
                icon: Icon(Icons.bar_chart), label: Text('통계')),
            NavigationDrawerDestination(
                icon: Icon(Icons.abc), label: Text('임시1')),
            NavigationDrawerDestination(
                icon: Icon(Icons.ac_unit), label: Text('임시2')),
          ],
        ),
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
                        children: [
                          Home(),
                          Chat(),
                          Diary(),
                          Demo4(),
                          Demo5(),
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
                  Home(),
                  Chat(),
                  Diary(),
                  Demo4(),
                  Demo5(),
                ],
              ),
        bottomNavigationBar: SalomonBottomBar(
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(0xff6200ee),
            unselectedItemColor: const Color(0xff757575),
            items: _navBarItems,
            onTap: _onItemTapped),
      ),
    );
  }
}

final _navBarItems = [
  SalomonBottomBarItem(
    icon: const Icon(Icons.home),
    title: const Text("Home"),
    selectedColor: Colors.purple,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.chat),
    title: const Text("Chat"),
    selectedColor: Colors.pink,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.note_alt_outlined),
    title: const Text("Diary"),
    selectedColor: Colors.orange,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.person),
    title: const Text("Screen4"),
    selectedColor: Colors.teal,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.person),
    title: const Text("Screen5"),
    selectedColor: Colors.teal,
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
    label: Text("Screen4"),
  ),
  const NavigationRailDestination(
    icon: Icon(Icons.person),
    label: Text("Screen5"),
  ),
];
