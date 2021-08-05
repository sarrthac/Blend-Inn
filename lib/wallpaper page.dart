import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class wallP_Screen extends StatefulWidget {


  @override
  _wallP_ScreenState createState() => _wallP_ScreenState();
}

class _wallP_ScreenState extends State<wallP_Screen> {

  List images = [];
  int page = 1;
  @override
  void initState(){
    super.initState();
    fetchapi();
  }
  fetchapi()async{
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
        headers:{'Authorization':'563492ad6f91700001000001dff3a71159854dc7868ce269de803373'
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
      print(images);
    });
  }

  loadmoreimages() async{
    setState(() {
      page = page + 1;
    });
    String url = 'https://api.pexels.com/v1/curated?per_page=80&page='+page.toString();
    await http.get(Uri.parse(url),
        headers:{'Authorization':'563492ad6f91700001000001dff3a71159854dc7868ce269de803373'
        }).then((value){
          Map result = jsonDecode(value.body);
          setState(() {
            images.addAll(result['photos']);
          });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blend Inn'),
      ),
      body: Column(
        children: [
          Expanded(child: Container(
          child: GridView.builder( itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 2.0,
                crossAxisCount: 3,
                childAspectRatio: 2/3,
                mainAxisSpacing: 2,
              ), itemBuilder: (context,index){
            return Container(color: Colors.white,
            child: Image.network(images[index]['src']['tiny'],
            fit: BoxFit.cover,),
            );
              }),
          ),
          ),
          InkWell(
            onTap: (){
              loadmoreimages();
            },
            child: Container(
              //margin: EdgeInsets.all(15),
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
          ),
        ],
      ),
    );
  }
}

