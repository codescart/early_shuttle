import 'package:carousel_slider/carousel_slider.dart';
import 'package:early_shuttle/User%20Interface/Constant%20Widgets/Container/Container_widget.dart';
import 'package:flutter/material.dart';

class HomePageImageSlider extends StatelessWidget {
   HomePageImageSlider({Key? key}) : super(key: key);

// List for Slider images.......
  final List<String> imageUrls = [
    'assets/slider4.jpg',
    'assets/slider5.jpg',
    'assets/slider6.jpg',
  ];
 //=============================
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imageUrls.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                   image: AssetImage(imageUrl),
                  fit: BoxFit.cover
                 ),
                borderRadius: BorderRadius.circular(8),
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 120.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 18 / 9,
        autoPlayCurve: Curves.easeInCubic,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(seconds: 1),
        viewportFraction: 1.2,
      ),
    );
  }
}
