
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import '../constant/constants.dart';
// import '../models/catagories/catagories.dart';

// class ListCategoriesItems extends GetView<ItemsControllerImp> {
//   const ListCategoriesItems({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100,
//       child: ListView.separated(
//         separatorBuilder: (context, index) => const SizedBox(width: 10),
//         itemCount: controller.categories.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return Categories(
//             i: index,
//             categoriesModel:
//                 Catagories.fromJson(controller.categories[index]),
//           );
//         },
//       ),
//     );
//   }
// }

// class Categories extends GetView<ItemsControllerImp> {
//   final Catagories categoriesModel;
//   final int? i;
//   const Categories({Key? key, required this.categoriesModel, required this.i})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         // controller.goToItems(controller.categories, i!);
//         controller.changeCat(i!, categoriesModel.categoriesId!);
//       },
//       child: Column(
//         children: [
//           GetBuilder<ItemsControllerImp>(
//               builder: (controller) => Container(
//                     padding:const  EdgeInsets.only(right: 10, left: 10, bottom: 5),
//                     decoration: controller.selectedCat == i
//                         ?const BoxDecoration(
//                             border: Border(
//                                 bottom: BorderSide(
//                                     width: 3, color: AppColor.primaryColor)))
//                         : null,
//                     // child: Text(
//                     //   "${translateDatabase(categoriesModel.categoriesNamaAr, categoriesModel.categoriesName)}",
//                       // style:
//                       //     const TextStyle(fontSize: 20, color: AppColor.grey),
//                     ),
//                   ),
//         ],
//       ),
//     );
//   }
// }
