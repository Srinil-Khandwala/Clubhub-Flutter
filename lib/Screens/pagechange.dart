import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:club_hub/Screens/homepage.dart';
import 'package:club_hub/Screens/profilepage.dart';
import 'package:club_hub/Screens/membershippage.dart';
import 'package:club_hub/Screens/bookingpage.dart';

class PageChange extends StatefulWidget {
  @override
  _PageChangeState createState() => _PageChangeState();
}

class _PageChangeState extends State<PageChange> {
  PageController _pageController = PageController();

  List<Widget> _screens = [
    HomePage(),
    BookingPage(),
    MembershipPage(),
    ProfilePage(),
  ];

  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  String setAppBarName(_selectedIndex) {
    if (_selectedIndex == 0)
      return 'ClubHub';
    else if (_selectedIndex == 1)
      return 'Booking';
    else if (_selectedIndex == 2)
      return 'Membership';
    else
      return 'Profile';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          setAppBarName(_selectedIndex),
          style: TextStyle(
              fontSize: 40.00,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        backgroundColor: Color(0xFFb3c8ff),
        leading: Icon(
          FontAwesomeIcons.bars,
          color: Colors.black,
        ),
        actions: [
          Icon(
            FontAwesomeIcons.ellipsisV,
            color: Colors.black,
          ),
          SizedBox(
            width: 15.00,
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: _screens,
        onPageChanged: _onPageChanged,
        //physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF425DF3),
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
            backgroundColor: Color(0xFFb3c8ff),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.calendarCheck,
            ),
            label: 'Book',
            backgroundColor: Color(0xFFb3c8ff),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.rupeeSign,
            ),
            label: 'Membership',
            backgroundColor: Color(0xFFb3c8ff),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.user,
            ),
            label: 'Profile',
            backgroundColor: Color(0xFFb3c8ff),
          ),
        ],
      ),
    );
  }
}