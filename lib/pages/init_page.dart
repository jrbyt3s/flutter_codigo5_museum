import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museum/pages/explorer_page.dart';
import 'package:flutter_codigo5_museum/pages/favorite_page.dart';
import 'package:flutter_codigo5_museum/pages/home_page.dart';
import 'package:flutter_svg/svg.dart';

import '../services/api_service.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    HomePage(),
    ExplorerPage(),
    FavoritePage(),
    Text('Page 4'),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    APIService _apiService = APIService();
    _apiService.getMuseums().then((value) {}).catchError((error) {
      print("wwwww $error");
    });

    return Scaffold(
      backgroundColor: Color(0xff232323),
      appBar: AppBar(
        backgroundColor: Color(0xff232323),
        title: const Text(
          'MuseumApp',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.cast)),
          const SizedBox(width: 10.0),
          const CircleAvatar(
            radius: 16.0,
            backgroundColor: Colors.white10,
            backgroundImage: NetworkImage(
              'https://images.pexels.com/photos/12338228/pexels-photo-12338228.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            ),
          ),
          const SizedBox(width: 12.0),
        ],
      ),
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff232323),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          _currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home.svg',
                color: _currentIndex == 0 ? Colors.blue : Colors.white),
            label: "inicio",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/compass.svg',
                color: _currentIndex == 1 ? Colors.blue : Colors.white),
            label: "explorar",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/heart.svg',
                color: _currentIndex == 2 ? Colors.blue : Colors.white),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/user.svg',
                color: _currentIndex == 3 ? Colors.blue : Colors.white),
            label: "home",
          ),
        ],
      ),
    );
  }
}
