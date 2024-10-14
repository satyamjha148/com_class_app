import 'package:com_class/home/home_view.dart';
import 'package:com_class/home/search_view.dart';
import 'package:com_class/home/setting/setting_view.dart';
import 'package:flutter/material.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomBarViewState createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  int _selectedIndex = 0;

  // Placeholder widgets for the 4 pages
  final List<Widget> _pages = [
    HomeView(),
    SearchView(),
    const PlaceholderPage(title: 'Circle'),
    const PlaceholderPage(title: 'Friends'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFa3f782),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.network(
                'https://picsum.photos/200', // Random image from Lorem Picsum
                fit: BoxFit.cover,
                width: 36,
                height: 36,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.person, color: Color(0xFFa3f782));
                },
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Color(0xFF2f2f2f)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsView(),
                  ));
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Circle',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(0xFF2F2F2F),
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
          ),
        ),
      ),
    );
  }
}

// Placeholder widget for the pages
class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
