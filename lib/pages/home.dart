import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ngwe_oak_project/components/drawer.dart';
import 'package:ngwe_oak_project/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerPage(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Ngwe Oak',
          ),
          backgroundColor: kPrimaryColor,
        ),
        backgroundColor: kBackgroundColor,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: DotNavigationBar(
            margin: EdgeInsets.only(left: 10, right: 10),
            currentIndex: _SelectedTab.values.indexOf(_selectedTab),
            dotIndicatorColor: Colors.black,
            unselectedItemColor: Colors.grey[300],
            onTap: _handleIndexChanged,
            items: [
              DotNavigationBarItem(
                  icon: Icon(Icons.home), selectedColor: kPrimaryColor),
              DotNavigationBarItem(
                  icon: Icon(Icons.favorite), selectedColor: kPrimaryColor),
              DotNavigationBarItem(
                  icon: Icon(Icons.search), selectedColor: kPrimaryColor),
              DotNavigationBarItem(
                  icon: Icon(Icons.person), selectedColor: kPrimaryColor)
            ],
          ),
        ));
  }
}

enum _SelectedTab { home, favorite, search, person }
