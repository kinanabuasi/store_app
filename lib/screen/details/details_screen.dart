// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../constant/constants.dart';
// import '../../data/model/Product.dart';
// import 'components/add_to_cart.dart';
// import 'components/color_and_size.dart';
// import 'components/counter_with_fav_btn.dart';
// import 'components/description.dart';
// import 'components/product_title_with_image.dart';

// class DetailsScreen extends StatelessWidget {
//   const DetailsScreen({super.key, required this.product});

//   final Product product;

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       // each product have a color
//       backgroundColor: product.color,
//       appBar: AppBar(
//         backgroundColor: product.color,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {},
//           icon: ColorFiltered(
//             colorFilter: ColorFilter.mode(
//               product.color,
//               BlendMode.srcIn,
//             ),
//             child: SvgPicture.asset(
//               "asset/icons/back.svg",
//             ),
//           ),
//         ),
//         // IconButton(
//         //   icon: SvgPicture.asset(
//         //     'asset/icons/back.svg',
//         //     colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
//         //   ),
//         //   onPressed: () => Navigator.pop(context),
//         // ),
//         actions: <Widget>[
//           IconButton(
//             icon: SvgPicture.asset("asset/icons/search.svg"),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: SvgPicture.asset("asset/icons/cart.svg"),
//             onPressed: () {},
//           ),
//           SizedBox(width: kDefaultPadding / 2)
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               height: size.height,
//               child: Stack(
//                 children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.only(top: size.height * 0.3),
//                     padding: EdgeInsets.only(
//                       top: size.height * 0.12,
//                       left: kDefaultPadding,
//                       right: kDefaultPadding,
//                     ),
//                     // height: 500,
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(24),
//                         topRight: Radius.circular(24),
//                       ),
//                     ),
//                     child: Column(
//                       children: <Widget>[
//                         ColorAndSize(product: product),
//                         SizedBox(height: kDefaultPadding / 2),
//                         Description(product: product),
//                         SizedBox(height: kDefaultPadding / 2),
//                         CounterWithFavBtn(),
//                         SizedBox(height: kDefaultPadding / 2),
//                         AddToCart(product: product)
//                       ],
//                     ),
//                   ),
//                   ProductTitleWithImage(product: product)
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }