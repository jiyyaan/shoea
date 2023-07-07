import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoea/models/colors.dart';
import 'package:shoea/models/user.dart';


class Functions {
  static String hostName = "172.21.16.1";
  //Post Function with Parameters
  static List<LoginDetail> listUsers = List.empty(growable: true);
  static fetchData() async {
    var jsonObject = {"username": "Rizwan", "password": "Random@123"};
    try {
      final response = await http.post(
          Uri.parse('http://$hostName/online-store/login/signup.php'),
          body: json.encode(jsonObject));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        print(jsonData);
        var d = jsonData["data"] as List;
        listUsers = d.map<LoginDetail>((json) {
          return LoginDetail.fromJson(json);
        }).toList();
      } else {
        print("Something wrong");
      }
    } catch (err) {
      print(err);
    }
    return listUsers;
  }

  //Get Colors Function
  static List<ColorsList> listColors = List.empty(growable: true);
  static fetchColors() async {
    final response = await http.get(
      Uri.parse("http://$hostName/online-store/APIs/getColors.php"),
    );
    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var d = data['colors'] as List;
        listColors = d.map<ColorsList>((json) {
          return ColorsList.fromJson(json);
        }).toList();
      } else {
        print('${response.statusCode} - ${response.body} ');
      }
    } catch (err) {
      print(err);
    }
    return listColors;
  }

  //Post Delete Function
  static deleteColor(String colorID) async {
    var jsonObject = {"color_id": colorID};
    print(jsonObject);
    try{
      final response = await http.post(
          Uri.parse("http://$hostName/online-store/APIs/deleteColor.php"),
          body: json.encode(jsonObject));
      if(response.statusCode == 200){
        print('Deleted Successfully');
      }else{
        print(response.statusCode);
      }
    }catch(err){
      print(err);
    }
  }

  //Post Color Function
  static insertColor(String colorName, String colorCode) async {
    var jsonObject = {"color_name": colorName, "color_code": colorCode};
    print(jsonObject);
    try{
      final response = await http.post(
          Uri.parse('http://$hostName/online-store/APIs/insertColor.php'),
          body: json.encode(jsonObject));
      if(response.statusCode == 200){
        return true;
      }else{
        print(response.statusCode);
        return false;
      }
    }catch(err){
      print(err);
    }
  }

  //Update Color Function
  static updateColor(String colorId, String colorName, String colorCode) async {
    var jsonObject = {"color_id":colorId, "color_name": colorName, "color_code": colorCode};
    print(jsonObject);
    try{
      final response = await http.post(
          Uri.parse('http://$hostName/online-store/APIs/updateColor.php'),
          body: json.encode(jsonObject));
      if(response.statusCode == 200){
        print('Color Updated Successfully');
      }else{
        print(response.statusCode);
      }
    }catch(err){
      print(err);
    }
  }

  //Post Data without class
  var jsonData = [];
  fetchDataHttp() async {
    try {
      final response = await http.get(
        Uri.parse('http://$hostName/online-store/login/signup.php'),
      );
      if (response.statusCode == 200) {
        final _jsonData = jsonDecode(response.body);
        print(_jsonData["data"]);
        jsonData.addAll(_jsonData["data"]);
      }
    } catch (err) {
      print(err);
      return const Text("Loading");
    }
    return jsonData;
  }
}
