import 'package:clone_facebook_like/video.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class bottomBar extends StatefulWidget {
  const bottomBar({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<bottomBar> createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  int _focusBtnNav = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(
      initialPage: _focusBtnNav,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 78, 137, 197),
        title: const Text(
          'like Facebook - (own design)',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (newpage) {
            setState(() {
              this._focusBtnNav = newpage;
            });
          },
          children: const [
            MyHomePage(
              title: 'Home',
            ),
            //link to indicate the bottom bar to next page
            videoPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xffffffff),
        currentIndex: _focusBtnNav,
        onTap: (value) {
          setState(() {
            _focusBtnNav = value;
            this._pageController.jumpToPage(value);
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
              size: 28,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Video',
            icon: Icon(
              Icons.play_circle,
              size: 28,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Menu',
            icon: Icon(
              Icons.menu,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
