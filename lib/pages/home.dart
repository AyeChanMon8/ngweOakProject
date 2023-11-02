import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ngwe_oak_project/components/drawer.dart';
import 'package:ngwe_oak_project/pages/main_home_page.dart';
import 'package:ngwe_oak_project/pages/stock_report_page.dart';
import 'package:ngwe_oak_project/utils/constants.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedTab = _SelectedTab.home;
  int selectedPage = 0;
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      selectedPage = i;
    });
  }

  final _pageOptions = [
    MainHomePage(),
    StockReportPage(),
    MainHomePage(),
    MainHomePage(),
    MainHomePage()
  ];

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
        body: _pageOptions[selectedPage],
        backgroundColor: kBackgroundColor,
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          onTap: (i) => setState(() => _handleIndexChanged(i)),
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: kPrimaryColor,
            ),

            SalomonBottomBarItem(
              icon: Icon(Icons.report_off),
              title: Text("Stock Report"),
              selectedColor: kPrimaryColor,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text("Open/Due List"),
              selectedColor: kPrimaryColor,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.report),
              title: Text("Reporting"),
              selectedColor: kPrimaryColor,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.announcement),
              title: Text("Announcement"),
              selectedColor: kPrimaryColor,
            ),
          ],
        ),
      );
  }
}

enum _SelectedTab { home, report_off, favorite_border, report,announcement }
