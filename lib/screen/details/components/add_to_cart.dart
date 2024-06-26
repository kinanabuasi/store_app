// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../../../constant/constants.dart';
// import '../../../data/model/Product.dart';

// class AddToCart extends StatelessWidget {
//   const AddToCart({super.key, required this.product});

//   final Product product;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
//       child: Row(
//         children: <Widget>[
//           Container(
//               margin: EdgeInsets.only(right: kDefaultPadding),
//               height: 50,
//               width: 58,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(18),
//                 border: Border.all(
//                   color: product.color,
//                 ),
//               ),
//               child: IconButton(
//                 onPressed: () {},
//                 icon: ColorFiltered(
//                   colorFilter: ColorFilter.mode(
//                     product.color,
//                     BlendMode.srcIn,
//                   ),
//                   child: SvgPicture.asset(
//                     "asset/icons/add_to_cart.svg",
//                   ),
//                 ),
//               )),
//           Expanded(
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(double.infinity, 48),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18)),
//                 backgroundColor: product.color,
//               ),
//               child: Text(
//                 "Buy  Now".toUpperCase(),
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
