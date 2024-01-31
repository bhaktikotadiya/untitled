import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:getwidget/size/gf_size.dart';

void main()
{
    runApp(MaterialApp(
      home: two(),debugShowCheckedModeBanner: false,
    ));
}
class two extends StatefulWidget {
  const two({super.key});

  @override
  State<two> createState() => _twoState();
}

class _twoState extends State<two> {

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  int groupvalue = 0;
  int sum=0;
  List<dynamic> slots = [];
  List<dynamic> slots1 = [];
  List<dynamic> slots2 = [];
  bool b1 = false;
  bool b2 = false;
  bool b3 = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        TextFormField(
          controller: t1,
          decoration: InputDecoration(hintText: "time1"),
        ),
        TextFormField(controller: t2,decoration: InputDecoration(hintText: "time2"),),
        SizedBox(height: 10,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
          GFRadio(
            size: GFSize.SMALL,
            value: 10,
            groupValue: groupvalue,
            onChanged: (value) {
              setState(() {
                groupvalue = value;
              });
            },
            inactiveIcon: null,
            activeBorderColor: GFColors.SUCCESS,
            radioColor: GFColors.SUCCESS,
          ),
          Text("10"),
          GFRadio(
            size: GFSize.SMALL,
            value: 20,
            groupValue: groupvalue,
            onChanged: (value) {
              setState(() {
                groupvalue = value;
              });
            },
            inactiveIcon: null,
            activeBorderColor: GFColors.SUCCESS,
            radioColor: GFColors.SUCCESS,
          ),
          Text("20"),
          GFRadio(
            size: GFSize.SMALL,
            value: 30,
            groupValue: groupvalue,
            onChanged: (value) {
              setState(() {
                groupvalue = value;
              });
            },
            inactiveIcon: null,
            activeBorderColor: GFColors.SUCCESS,
            radioColor: GFColors.SUCCESS,
          ),
          Text("30"),
        ],),
        SizedBox(height: 10,),
        ElevatedButton(onPressed: (){
          slots.clear();
          slots1.clear();
          slots2.clear();
          int c = groupvalue;
          int a = int.parse(t1.text);
          // int a = t1.value as int;
          int b = int.parse(t2.text);
          print(c);
          print(a);
          print(b);
              if(c==10)
              {
                b1=true;
                if(a<b)
                {
                  while(a<b)
                  {
                    print(" $a : $c");
                    slots.add("$a : $c");
                    c=c+10;
                    if(c==60)
                    {
                      c=0;
                      a++;
                      // print(" a : "+a);
                    }
                  }
                }
                if(a>b)
                {
    //                System.out.println("a>b");
                  while(a>b)
                  {
                    print(" ${a} : ${c}");
                    slots.add("$a : $c");
                    c=c+10;
                    if(c==60)
                    {
                      c=0;
                      a++;
                      if(a==13)
                      {
                        a=1;
                        while(a<b)
                        {
                          print(" ${a} : ${c}");
                          slots.add("$a : $c");
                          c=c+10;
                          if(c==60)
                          {
                            c=0;
                            a++;
                          }
                        }
                      }
                    }
                  }
                }
              }
              if(c==20)
              {
                b2=true;
                if(a<b)
                {
                  while(a<b)
                  {
                    print(" $a : $c");
                    slots1.add("$a : $c");
                    c=c+20;
                    if(c==60)
                    {
                      c=0;
                      a++;
                    }
                  }
                }
                if(a>b)
                {
    //                System.out.println("a>b");
                  while(a>b)
                  {
                    print(" $a : $c");
                    slots1.add("$a : $c");
                    c=c+20;
                    if(c==60)
                    {
                      c=0;
                      a++;
                      if(a==13)
                      {
                        a=1;
                        while(a<b)
                        {
                          print(" $a : $c");
                          slots1.add("$a : $c");
                          c=c+20;
                          if(c==60)
                          {
                            c=0;
                            a++;
                          }
                        }
                      }
                    }
                  }
                }
              }
              if(c==30)
              {
                b3=true;
                if(a<b)
                {
                  while(a<b)
                  {

                    print(" $a : $c");
                    slots2.add("$a : $c");
                    c=c+30;
                    if(c==60)
                    {
                      c=0;
                      a++;
                      // System.out.println(" a : "+a);

                      //System.out.println(" "+a+" : "+c);
                    }
                  }
                }
                if(a>b)
                {
    //                System.out.println("a>b");
                  while(a>b)
                  {
                    print(" $a : $c");
                    slots2.add("$a : $c");
                    c=c+30;
                    if(c==60)
                    {
                      c=0;
                      a++;
                      if(a==13)
                      {
                        a=1;
                        while(a<b)
                        {
                          print(" $a : $c");
                          slots2.add("$a : $c");
                          c=c+30;
                          if(c==60)
                          {
                            c=0;
                            a++;
                          }
                        }
                      }
                    }
                  }
                }

                setState(() { });
            }
              print(slots);
          }, child: Text("submit")),
        SizedBox(height: 10,),
        (b1)?Expanded(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            // color: Colors.red,
            child: ListView.builder(
              itemCount: slots.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${slots[index]}"),
                  tileColor: Colors.green,
                );
              },
            ),
          ),
        ):Text(""),
        (b2)?Expanded(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            // color: Colors.red,
            child: ListView.builder(
              itemCount: slots1.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${slots1[index]}"),
                  tileColor: Colors.red,
                );
              },
            ),
          ),
        ):Text(""),
        (b3)?Expanded(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            // color: Colors.red,
            child: ListView.builder(
              itemCount: slots2.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${slots2[index]}"),
                  tileColor: Colors.yellow,
                );
              },
            ),
          ),
        ):Text(""),
      ]),
    );
  }
}
