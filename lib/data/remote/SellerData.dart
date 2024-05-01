// ignore_for_file: unused_import, non_constant_identifier_names

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/class/crud.dart';
import '../../linkapi.dart';

class SellerData {
  Crud crud;
  SellerData(this.crud);
  AddItem(
      dynamic user_id,
      String item_name,
      String item_description,
      dynamic item_count,
      dynamic item_active,
      dynamic item_price,
      dynamic item_discount,
      dynamic item_cat,
      dynamic item_image) async {
    var response = await crud.postData(AppLink.AddItem, {
      "userid": user_id.toString(),
      "item_name": item_name,
      "item_description": item_description,
      "item_count": item_count.toString(),
      "item_active": item_active.toString(),
      "item_price": item_price.toString(),
      "item_discount": item_discount.toString(),
      "item_cat": item_cat.toString(),
      "item_image": item_image.toString(),
    }, {});
    return response.fold((l) => l, (r) => r);
  }

  AddImage(File image) async {
    var response = await crud.postPhoto(AppLink.addimage, image, {});

    // "userid": user_id.toString(),

    return response.fold((l) => l, (r) => r);
  }
   AddFile(FilePickerResult file) async {
    var response = await crud.postFile(AppLink.addimage, file,);

    // "userid": user_id.toString(),

    return response.fold((l) => l, (r) => r);
  }
}
