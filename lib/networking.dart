import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

const APIKEY = 'YOUR_API_KEY';

class Networkhelper{

  Networkhelper(this.url);

  final String url;

  Future getData() async{
    final uri =Uri.parse(url);
    Response response = await get(uri);
    if(response.statusCode==200){
      String data = response.body;
      return jsonDecode(data);
    }else{
      print(response.statusCode);
    }
  }

}
