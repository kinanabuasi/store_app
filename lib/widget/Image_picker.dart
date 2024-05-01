// // ignore_for_file: deprecated_member_use, prefer_const_constructors, use_build_context_synchronously, use_key_in_widget_constructors

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import '../controller/AddItemController.dart';
// import 'package:file_selector/file_selector.dart';



// class ImagePickerWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     AddItemControllerImp addItemControllerImp = Get.put(AddItemControllerImp());

//     return ElevatedButton(
//       child: Text('Pick an image'),
//       onPressed: () async {
//         final file = await FileSelector.platform.selectFile();
//         if (file != null) {
//           // Send the file to the controller
//           addItemControllerImp.AddImage(context, file);
//         }
//       },
//     );
//   }
// }
