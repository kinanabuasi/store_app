// ignore_for_file: prefer_const_constructors, unused_import, avoid_print, prefer_const_declarations, non_constant_identifier_names, unused_element, prefer_typing_uninitialized_variables, unused_local_variable, import_of_legacy_library_into_null_safe

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../functions/checkinternet.dart';
import 'statusrequest.dart';
import 'package:file_picker/file_picker.dart';

class Crud {
  // _save_token(String token) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'token';
  //   final value = token;
  //   prefs.setString(key, value);
  //   print('saving token : $value');
  // }
  // read() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'token';
  //   final value = prefs.get(key) ?? 0;
  //   print('reading token : $value');
  // }

  Future<Either<StatusRequest, Map>> postData(
      String linkurl, Map data, Map<String, String> accepted_token) async {
    // final prefs = await SharedPreferences.getInstance();
    // final key = 'token';
    // final value = prefs.get(key) ?? 0;

    try {
      var response = await http.post(
        Uri.parse(linkurl),
        body: data,
        // headers: accepted_token,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(response.body);
        // token = responsebody['token'];
        // print("** data: $responsebody **");
        // print("** token: $token **");
        return Right(responsebody);
      } else {
        // print("StatusRequest.failure");
        return Left(StatusRequest.serverfailure);
      }
      // } else {
      //   return Left(StatusRequest.offlinefailure);
      // }
    } catch (_) {
      print("StatusRequest.serverfailure");
      return Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map>> getData(String linkurl) async {
    // try {
    var response = await http.get(
      Uri.parse(linkurl),
      // headers: accepted_token,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);

      return Right(responsebody);
    } else {
      return Left(StatusRequest.serverfailure);
    }
  }
  // catch (_) {
  //   return Left(StatusRequest.serverfailure);
  // }
  // }
// var stringSharedPreference = "string shared preferences";
//   static Future<String> getString() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(listSharedPreference) ?? "";
//   }
//   static Future setString() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.setString(stringSharedPreference, "");
//   }

  Future<Either<StatusRequest, Map>> postPhoto(
    String linkurl,
    File image,
    Map data,
  ) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(linkurl));
      request.files.add(http.MultipartFile.fromBytes(
        'file',
        await image.readAsBytes(),
        filename: image.path,
      ));
      // request.fields.addAll(data);
      final response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(await response.stream.bytesToString());
        print(responsebody);
        return Right(responsebody);
      } else {
        return Left(StatusRequest.serverfailure);
      }
    } catch (_) {
      print("StatusRequest.serverfailure");
      return Left(StatusRequest.serverfailure);
    }
  }


    Future<Either<StatusRequest, Map>> postFile(
    String linkurl,
    FilePickerResult file,
    // Map data,
  ) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(linkurl));
      // var stream= new http.ByteStream(file.op),
      // request.files.add(http.MultipartFile.fromBytes(
      //   'file',
      //   await file.files.single.readAsBytes(),
      // filename: file.files.single.path.split('/').last,
      // ));
      //  request.files.add(http.MultipartFile(
      //     'file',
      //     file,
      //     file.size,
      //     filename: file.name,
      //   ));

      // request.fields.addAll(data);
      final response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Map responsebody = jsonDecode(await response.stream.bytesToString());
        print('File uploaded successfully');
        // return Right(responsebody);
        return Right({});
      } else {
        print('Error uploading file: ${response.statusCode}');
        return Right({});
      }
    } catch (_) {
      print("StatusRequest.serverfailure");
      return Left(StatusRequest.serverfailure);
    }
  }
}
