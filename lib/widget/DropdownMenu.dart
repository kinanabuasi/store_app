// ignore_for_file: unused_import, avoid_print, prefer_const_constructors, sort_child_properties_last, unused_element, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/itemsmodel.dart';

// class DropDownMenu extends StatelessWidget {
//   const DropDownMenu({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return DropDownMenu();
//   }
// }
// class UserController extends GetxController {
//   var selectedUser = 'seller'.obs;
//   void selectUser(String user) {
//     selectedUser.value = user;
//   }
// }

// class UserDropdown extends StatelessWidget {
//   final UserController userController = Get.put(UserController());
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField(
//       items: items,
//        onChanged: onChanged);
//     //  Column(
//     //   children: [
//     //     TextField(
//     //       onChanged: (value) {
//     //         userController.selectUser(value);
//     //       },
//     //       decoration: InputDecoration(
//     //         labelText: 'Enter User',
//     //       ),
//     //     ),
//     //     // Obx(
//     //     //   () =>
//     //        DropdownButton<String>(
//     //         value: userController.selectedUser.value,
//     //         onChanged: (String? newValue) {
//     //           userController.selectUser(newValue!);
//     //         },
//     //         items: <String>['User 1', 'User 2']
//     //             .map<DropdownMenuItem<String>>((String value) {
//     //           return DropdownMenuItem<String>(
//     //             value: value,
//     //             child: Text(value),
//     //           );
//     //         }).toList(),
//     //       ),
//     //     // ),
//     //   ],
//     // );
//   }
// }

class DropdownItem extends StatelessWidget {
  String selectedValue;
  List<String> Items;
  // var selectedUser = 'seller'.obs;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;

  DropdownItem(
      {super.key,
      this.valid,
      this.mycontroller,
      required this.selectedValue,
      required this.Items});
  @override
  Widget build(BuildContext context) {
    return
        // Obx(() =>
        DropdownButtonFormField<String>(
      value: selectedValue,
      items: Items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged: (String? type) {
        selectedValue = type!;
        mycontroller!.text = type;
        print(mycontroller!.text);
      },
      // controller: mycontroller,
      onSaved: (type) {
        mycontroller!.text = type!;
        // print(mycontroller);
        print(type);
      },
      style: TextStyle(color: Colors.black),
      validator: valid,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(
          fontSize: 12,
          color: Color.fromARGB(192, 63, 62, 62),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      // ),
    );
  }
}

class DropdownItemModel extends StatelessWidget {
  String selectedValue;
  List<ItemsModel> Items ;
  // var selectedUser = 'seller'.obs;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;

  DropdownItemModel(
      {super.key,
      this.valid,
      this.mycontroller,
      required this.selectedValue,
      required this.Items});
  @override
  Widget build(BuildContext context) {
    return
        // Obx(() =>
        DropdownButtonFormField<String>(
      value: selectedValue,
      items:Items.map((item) => DropdownMenuItem<String>(
            value: item.categoriesName.toString(),
            child: Text(item.categoriesName.toString()),
          ))
      .toList(),
      onChanged: (String? type) {
        selectedValue = type!;
        mycontroller!.text = type;
        print(mycontroller!.text);
      },
      // controller: mycontroller,
      onSaved: (type) {
        mycontroller!.text = type!;
        // print(mycontroller);
        print(type);
      },
      style: TextStyle(color: Colors.black),
      validator: valid,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(
          fontSize: 12,
          color: Color.fromARGB(192, 63, 62, 62),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      // ),
    );
  }
}
