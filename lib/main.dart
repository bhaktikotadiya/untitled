import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
    runApp(MaterialApp(
      home: demo(),
    ));
}
class demo extends StatefulWidget {
  const demo({super.key});

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("constrained box"),
      ),
      body: Column(children: [
        ConstrainedBox(
          constraints:  BoxConstraints.tightForFinite(
          ),
          child: Container(
            color: Colors.red,
            child: Text("hello how are",style: TextStyle(fontSize:20)),
            alignment: Alignment.center,
          ),
        )
      ]),
    );
  }
}
