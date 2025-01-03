import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:restro/src/widgets/widgets.dart';

class OfferCarousel extends StatefulWidget {
  const OfferCarousel({super.key});

  @override
  State<OfferCarousel> createState() => _OfferCarouselState();
}

class _OfferCarouselState extends State<OfferCarousel> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  final imgList = <String>[
    "https://paradise-own-app.s3.ap-south-1.amazonaws.com/Paradise%20Royal%20Festival%20App%20Banner%2C%20size%20721x360%20pxls-1732515245018.jpeg",
    "https://paradise-own-app.s3.ap-south-1.amazonaws.com/49196%20Paradise%20Dish%20of%20the%20month%20Own%20App%20Banner%2C%20size%20721x360%20pxls%20-%2020122024-1734695478638.jpeg",
    "https://paradise-own-app.s3.amazonaws.com/600x350_1.jpg",
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
            // autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
            aspectRatio: 2 / 1,
            initialPage: 0,
            enableInfiniteScroll: false,
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