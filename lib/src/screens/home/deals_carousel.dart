import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:restro/src/widgets/widgets.dart';

class DealsCarousel extends StatefulWidget {
  const DealsCarousel({super.key});

  @override
  State<DealsCarousel> createState() => _DealsCarouselState();
}

class _DealsCarouselState extends State<DealsCarousel> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  final imgList = <String>[
    "https://paradise-own-app.s3.amazonaws.com/600x350_1.jpg",
    "https://paradise-own-app.s3.amazonaws.com/600x350_2.jpg",
    "https://paradise-own-app.s3.amazonaws.com/600x350_3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imgList.map((e) => _buildImage(imagePath: e)).toList(),
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              _current = index;
              setState(() {});
            },
            autoPlay: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayInterval: const Duration(seconds: 2),
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            aspectRatio: 2,
            initialPage: 0,
          ),
        ),
      ],
    );
  }

  Widget _buildImage({required String imagePath}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: AppNetworkImage(imagePath: imagePath, radius: 10),
    );
  }
}