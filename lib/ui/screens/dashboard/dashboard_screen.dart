import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wonderful_indonesia/provider/auth_provider.dart';
import 'package:wonderful_indonesia/ui/screens/dashboard/home_screen.dart';
import 'package:wonderful_indonesia/ui/screens/dashboard/map_screen.dart';
import 'package:wonderful_indonesia/ui/screens/dashboard/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _navigationIndex = 0;
  final List<Widget> _screens = <Widget>[
    const HomeScreen(),
    const MapScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );

    return DefaultTabController(
      length: _screens.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wonderful Indonesia'),
          backgroundColor: Theme.of(context).primaryColor,
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (String value) {
                switch (value) {
                  default:
                    authProvider.logout();
                }
              },
              itemBuilder: (BuildContext ctx) {
                return <PopupMenuItem<String>>[
                  const PopupMenuItem<String>(
                    value: 'Logout',
                    child: InkWell(
                      child: Text('Logout'),
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
        body: IndexedStack(
          index: _navigationIndex,
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _navigationIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Theme.of(context).primaryColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (int index) {
            setState(() {
              _navigationIndex = index;
            });
          },
        ),
      ),
    );
  }
}
