
import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
// import 'package:just_audio/just_audio.dart';

class second_view extends StatefulWidget {
  final l;
  final l1;
  int? index;
  second_view([this.l,this.l1,this.index]);

  // const second_view({super.key});

  @override
  State<second_view> createState() => _second_viewState();
}

class _second_viewState extends State<second_view> {

  late AssetsAudioPlayer audioPlayer;
  double slid = 0;
  bool t = false;
  AudioPlayer player = AudioPlayer();
  double duration = 0.0;
  int duration1 = 0;
  dynamic cur_index;
  dynamic l_stor;
  dynamic m1;
  int id=0;
  int m1_length = 0;

  // dynamic max = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("l : ${widget.l}");
    print("l1 : ${widget.l1}");
    // List stor = widget.l1;
    m1 = widget.l;
    // log("m1 = ${m1}");
    // List stor = m1 as List;
    m1_length = m1.length;
    // for(int i=0;i<m1.length;i++)
    //   {
    //     // print("l : ${stor[i]}");
    //     l_stor.add(stor[i]);
    //   }
    id = widget.index as int;
    // cur_index = widget.l1['id'];
    duration1 = m1[id]['duration'];
    print("duration1 : ${duration1}");
    // print(cur_index);
    print(m1_length);
    // print(stor);


    get_duration();
  }


  get_duration()
  {
    player.onPositionChanged.listen((Duration d) {
      duration=d.inSeconds.toDouble();
      print("duration : ${duration}");
      setState(() { });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: Text("Music Detail Page",style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.grey.shade700,
        ),
        body: Column(children: [
          SizedBox(height: 100,),
          Center(
            child: Container(
              height: 350,
              width: 400,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(fit: BoxFit.fill,image: NetworkImage("${m1[id]['image']}")),
              ),
            ),
          ),
          Center(
            child: Container(
              // color: Colors.red,
              width: 300,height: 50,
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              child: Text("${m1[id]['title']}",style: TextStyle(color: Colors.white,fontSize: 35,),maxLines: 1,),
            ),
          ),
          Center(
            child: Container(
              // color: Colors.red,
              width: 300,height: 50,
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              child: Text("${widget.l1['album']}",style: TextStyle(color: Colors.white70,fontSize: 25,),maxLines: 1,),
            ),
          ),
          Center(
            child: Slider(
              min: 0,
              max: (duration1>0)?duration1.toDouble():0,
              value: duration.toDouble(),
              // divisions: 5,
              // label: slid.round().toString(),
              onChanged: (double value) {
                setState(() {
                  duration = value;
                });
              },
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Text("${duration.toDouble()}",style: TextStyle(color: Colors.white70),),
            Text("${m1[id]['duration']}",style: TextStyle(color: Colors.white70),),
          ],),

          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
            IconButton(onPressed: () async {
              // t=!t;
              player.pause();
              if(id>=0)
              {
                id--;
                print("id--:${id--}");
                print("id--:${m1[id]['source']}");
                t=!t;
                player.play(DeviceFileSource("${m1[id]['source']}"));
              }
              setState(() { });
            }, icon: Icon(Icons.skip_previous,color: Colors.white,size: 50,)),

            (t)?IconButton(onPressed: (){
              t=!t;
              player.pause();
              setState(() { });
            }, icon: Icon(Icons.pause_circle,color: Colors.white,size: 50)):
            IconButton(onPressed: (){
              t=!t;
              player.play(DeviceFileSource('${m1[id]['source']}'));
              setState(() { });
            }, icon: Icon(Icons.play_circle,color: Colors.white,size: 50)),

            IconButton(onPressed: () async {
              print(widget.index);
              print(m1_length);
              // t=!t;
              player.pause();

              if(id<m1_length-1)
              {
                id++;
                print("id++:${id++}");
                print("id++:${m1[id]['source']}");
                t=!t;
                player.play(DeviceFileSource("${m1[id]['source']}"));
              }
              setState(() { });
            }, icon: Icon(Icons.skip_next,color: Colors.white,size: 50))
          ],),
          SizedBox(height: 20,),
          IconButton(onPressed: (){
            FileDownloader.downloadFile(
                url: "${m1[id]['source']}",
                name: "THE FILE NAME AFTER DOWNLOADING",//(optional)
                onDownloadCompleted: (String path) {
                  print('FILE DOWNLOADED TO PATH: $path');
                },
                onDownloadError: (String error) {
                  print('DOWNLOAD ERROR: $error');
                });
          }, icon: Icon(Icons.download_for_offline,color: Colors.white,size: 50,))
        ]),
      ),
    ),
      onWillPop: () async{
          t=false;
          player.pause();
          setState(() { });
      return true;
    },);
  }
}
