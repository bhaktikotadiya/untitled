import 'dart:convert';
import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;


void main()
{
    runApp(MaterialApp(
      home: first(),
    ));
}
class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {


  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  Map m = {};
  bool t=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
      //   showCountryPicker(
      //   context: context,
      //   showPhoneCode: true, // optional. Shows phone code before the country name.
      //   onSelect: (Country country) {
      //     print('Select country: ${country.displayName}');
      //   },
      // ),
        TextFormField(controller: t1,decoration: InputDecoration(hintText: "amount"),),
        TextFormField(controller: t2,onTap: () {
          return showCountryPicker(
            context: context,
            showPhoneCode: false, // optional. Shows phone code before the country name.
            onSelect: (Country country) {
              // print('Select country: ${country.displayName}');
              t2.text = country.name;
            },
          );
        },decoration: InputDecoration(hintText: "from"),),
        TextFormField(controller: t3,onTap: () {
          return showCountryPicker(
            context: context,
            showPhoneCode: false,
            // optional. Shows phone code before the country name.
            onSelect: (Country country) {
              // print('Select country: ${country.displayName}');
              t3.text = country.name;
            },
          );
        },decoration: InputDecoration(hintText: "to"),),
        // TextFormField(controller: t3,decoration: InputDecoration(hintText: "to"),),
          ElevatedButton(onPressed: () async {
            var url = Uri.parse('https://projectofflutter.000webhostapp.com/contry.php?submit=submit&amount=${t1.text}&from=${t2.text}&to=${t3.text}');
            var response = await http.get(url);
            print('Response status: ${response.statusCode}');
            print('Response body: ${response.body}');
            m = jsonDecode(response.body);
            print("message : ${m['message']}");
            print(await http.read(Uri.parse('https://projectofflutter.000webhostapp.com/contry.php')));

            t = true;

          }, child: Text("SUBMIT")),
          SizedBox(height: 30,),
          (t==true)?Center(child: Text("${m['message']}",style: TextStyle(fontSize: 20,color: Colors.blueAccent.shade700)),):Text(""),
        ]
      )
    );
  }
}
