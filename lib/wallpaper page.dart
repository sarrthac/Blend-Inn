import 'package:flutter/material.dart';

class wallP_Screen extends StatefulWidget {
  const wallP_Screen({Key? key}) : super(key: key);

  @override
  _wallP_ScreenState createState() => _wallP_ScreenState();
}

class _wallP_ScreenState extends State<wallP_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blend Inn'),
      ),
      body: Column(
        children: [
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black
            ),
            height: 60,
            width: double.infinity,
            child: Center(
              child: Text('Load More',
          style: TextStyle(
              fontSize: 20,
          ),
          ),
            ),
          ),
        ],
      ),
    );
  }
}

