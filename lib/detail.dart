import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:appcat/constants/constants.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffef2e6),//Color(0xfffef2e6)
      appBar: AppBar(
        backgroundColor: Color(0xff725435),
        flexibleSpace:
          Column(
            children: [
              Spacer(),
              Text(breeds[selectedbreed]['name'],
                style: TextStyle(
                    color: Color(0xfffef2e6),
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
              SizedBox(height: 16,)


            ],
          ),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Container(
            height: 250,
            width: 250,
            child:
            breeds[selectedbreed].containsKey('reference_image_id') ?
            Image.network(
              Urlimages+breeds[selectedbreed]['reference_image_id']+'.jpg',
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ):Image.asset('assets/images/noPhoto.jpg',
              height: 250,
              width: 250,
              fit: BoxFit.cover,),
          ),
          Expanded(
            child:
                SingleChildScrollView(
                  child:
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          breeds[selectedbreed]['description'],
                          style: TextStyle(
                            color: Color(0xff725435),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),

                        SizedBox(height: 15,),
                        Text(
                          'Origin: '+breeds[selectedbreed]['origin'],
                          style: TextStyle(
                            color: Color(0xff725435),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 15,),
                        Text(
                          'Intelligence: '+breeds[selectedbreed]['intelligence'].toString(),
                          style: TextStyle(
                            color: Color(0xff725435),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 15,),
                        Text(
                          'Energy level : '+breeds[selectedbreed]['energy_level'].toString(),
                          style: TextStyle(
                            color: Color(0xff725435),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 15,),
                        Text(
                          'Adaptability: '+breeds[selectedbreed]['adaptability'].toString(),
                          style: TextStyle(
                            color: Color(0xff725435),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 15,),
                        Text(
                          'Life span: '+breeds[selectedbreed]['life_span'],
                          style: TextStyle(
                            color: Color(0xff725435),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 15,),
                        Text(
                          'Affection level : '+breeds[selectedbreed]['affection_level'].toString(),
                          style: TextStyle(
                            color: Color(0xff725435),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 15,),
                        Text(
                          'Child friendly : '+breeds[selectedbreed]['child_friendly'].toString(),
                          style: TextStyle(
                            color: Color(0xff725435),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 15,),
                        Text(
                          'Dog friendly : '+breeds[selectedbreed]['dog_friendly'].toString(),
                          style: TextStyle(
                            color: Color(0xff725435),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 15,),
                        Text(
                          'Social needs : '+breeds[selectedbreed]['social_needs'].toString(),
                          style: TextStyle(
                            color: Color(0xff725435),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],

                    ),
                  )
                )


          ),
        ],
      ),
    );
  }
}