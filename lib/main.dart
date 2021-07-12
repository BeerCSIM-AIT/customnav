import 'package:customnav/Screens/BasketScreen.dart';
import 'package:customnav/Screens/BookmarkScreen.dart';
import 'package:customnav/Screens/CafeScreen.dart';
import 'package:customnav/Screens/HomeScreen.dart';
import 'package:customnav/Screens/NotificationScreen.dart';
import 'package:customnav/Themes/color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Botton Nav",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> pages = [
    BasketPage(),
    HomeScreen(),
    CafeScreen(),
    BookmarkScreen(),
    NotificationScreen(),
  ];

  int currentIndex = 1;
  setBottomeBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.7,
                    child: FloatingActionButton(
                      backgroundColor: primaryColor,
                      child: Icon(Icons.shopping_basket),
                      elevation: 0.1,
                      onPressed: () {
                        setBottomeBarIndex(0);
                      },
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            setBottomeBarIndex(1);
                          },
                          icon: Icon(
                            Icons.home,
                            color:
                                currentIndex == 1 ? secondaryColor : darkColor,
                          ),
                          splashColor: lightColor,
                        ),
                        IconButton(
                          onPressed: () {
                            setBottomeBarIndex(2);
                          },
                          icon: Icon(
                            Icons.restaurant_menu,
                            color:
                                currentIndex == 2 ? secondaryColor : darkColor,
                          ),
                          splashColor: lightColor,
                        ),
                        Container(width: size.width * 0.2),
                        IconButton(
                          onPressed: () {
                            setBottomeBarIndex(3);
                          },
                          icon: Icon(
                            Icons.bookmark,
                            color:
                                currentIndex == 3 ? secondaryColor : darkColor,
                          ),
                          splashColor: lightColor,
                        ),
                        IconButton(
                          onPressed: () {
                            setBottomeBarIndex(4);
                          },
                          icon: Icon(
                            Icons.notifications,
                            color:
                                currentIndex == 4 ? secondaryColor : darkColor,
                          ),
                          splashColor: lightColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: pages[currentIndex],
          ),
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.2, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.4, 0, size.width * 0.4, 20);
    path.arcToPoint(Offset(size.width * 0.6, 20),
        radius: Radius.circular(20), clockwise: false);
    path.quadraticBezierTo(size.width * 0.6, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.8, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 15, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
