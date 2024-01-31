import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/music%20player/second_view.dart';

void main()
{
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: first_list(),
    ));
}
class first_list extends StatefulWidget {
  const first_list({super.key});

  @override
  State<first_list> createState() => _first_listState();
}

class _first_listState extends State<first_list> {

  // final dio = Dio();
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   get_song();
  // }

  Future get_song()
  async {
    // var url = Uri.parse('https://storage.googleapis.com/uamp/catalog.json');
    var url = Uri.https('storage.googleapis.com','uamp/catalog.json');
    var response = await http.get(url);
    Map m = jsonDecode(response.body);
    // print(jsonDecode(response.body));
    // log("l : ${m}");  //developer library
    return m;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black12,
          appBar: AppBar(
            title: Text("Music player",style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.grey.shade700,
          ),
          body: FutureBuilder(
            future: get_song(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting)
              {
                return Center(child: CircularProgressIndicator(),);
              }
              else
              {
                if(snapshot.hasData)
                {
                  dynamic m = snapshot.data;
                  List l = m['music'];
                  // log("list map : ${m}");
                  // log("list : ${l}");
                      return ListView.builder(
                        itemCount: l.length,
                        itemBuilder: (context, index) {
                          Map m1 = l[index];
                            return ListTile(
                              onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return second_view(l,l[index],index);
                                  },));
                              },
                              leading: Container(
                                height: 150,width: 60,
                                margin: EdgeInsets.all(5),
                                color: Colors.white,
                                child: Image(fit: BoxFit.fill,image: NetworkImage("${m1['image']}")),
                              ),
                              title: Text("${m1['title']}",style: TextStyle(color: Colors.white,fontSize: 20),maxLines: 1),
                              subtitle: Text("${m1['album']}",style: TextStyle(color: Colors.grey,fontSize: 15),),
                            );
                        },
                      );
                }
                else
                {
                  return Center(child: CircularProgressIndicator(),);
                }
              }
            },),
        ),
    );
  }
}
