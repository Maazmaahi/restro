// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:card_swiper/card_swiper.dart';
// import 'package:flutter_card_swiper/flutter_card_swiper.dart';
// import 'package:flutter/material.dart';
// import 'package:restro/src/widgets/widgets.dart';
//
// class DealsSwiper extends StatefulWidget {
//   const DealsSwiper({super.key});
//
//   @override
//   State<DealsSwiper> createState() => _DealsSwiperState();
// }
//
// class _DealsSwiperState extends State<DealsSwiper> {
//   int _current = 0;
//   final CarouselSliderController _controller = CarouselSliderController();
//   final imgList = <String>[
//     "https://paradise-own-app.s3.amazonaws.com/600x350_1.jpg",
//     "https://paradise-own-app.s3.amazonaws.com/600x350_2.jpg",
//     "https://paradise-own-app.s3.amazonaws.com/600x350_3.jpg",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         children: [
//           Swiper(
//             itemHeight: 200,
//             itemWidth: 400,
//             itemCount: imgList.length,
//             scrollDirection: Axis.vertical,
//             layout: SwiperLayout.STACK,
//             autoplay: true,
//             axisDirection: AxisDirection.down,
//             itemBuilder: (context, index) {
//               return ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Container(
//                   padding: const EdgeInsets.only(top: 20, bottom: 20),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: DecorationImage(
//                       image: NetworkImage(imgList[index]),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   // child: _buildImage(imagePath: imgList[index]),
//                 ),
//               );
//             },
//             viewportFraction: 0.8,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSwiper() {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         children: [
//           Flexible(
//             child: CardSwiper(
//               cardsCount: imgList.length,
//               numberOfCardsDisplayed: 3,
//               padding: const EdgeInsets.only(top: 20, bottom: 20),
//               backCardOffset: const Offset(0, -30),
//               cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
//                 return ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Container(
//                     height: 200,
//                     // padding: const EdgeInsets.only(top: 40, bottom: 20),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       image: DecorationImage(
//                         image: NetworkImage(imgList[index]),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     // child: _buildImage(imagePath: imgList[index]),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildImage({required String imagePath}) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       child: AppNetworkImage(imagePath: imagePath, radius: 10),
//     );
//   }
// }
