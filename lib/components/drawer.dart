import 'package:flutter/material.dart';
class DrawerPage extends StatefulWidget {
  const DrawerPage({ Key? key }) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
  child: ListView(
    children: [
      // DrawerHeader(
      //   child: CircleAvatar(
      //     child: Image.asset(''),
      //   ),
      // ),
      ListTile(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.blue),
        ),
        leading: Icon(
          Icons.person,
          color: Colors.blue,
        ),
      ),
      ListTile(
        title: Text(
          'Share',
          style: TextStyle(color: Colors.blue),
        ),
        leading: Icon(
          Icons.share,
          color: Colors.blue,
        ),
      ),
      ListTile(
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.blue),
        ),
        leading: Icon(
          Icons.settings,
          color: Colors.blue,
        ),
      ),
    ]));
  }
}