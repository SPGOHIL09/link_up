import 'package:link_up/Components/landingscreen1.dart';
import 'package:link_up/Components/landingscreen2.dart';
import 'package:link_up/Components/landingscreen3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScrollablePageView(),
    );
  }
}

class ScrollablePageView extends StatefulWidget {
  @override
  _ScrollablePageViewState createState() => _ScrollablePageViewState();
}

class _ScrollablePageViewState extends State<ScrollablePageView> {
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1B2A),
      body: Stack(
        children: [
          // PageView for horizontal scrolling pages
          PageView(
            controller: _pageController,
            children: [
              Center(child: Landingpage1()),
              Center(child: Landingpage2()),
              Center(child: Landingpage3()),
            ],
          ),

          // Dots indicator at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: Colors.blue,
                  dotColor: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
