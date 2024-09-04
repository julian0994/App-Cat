import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:appcat/api/serviceApi.dart';
import 'package:appcat/detail.dart';
import 'package:flutter/material.dart';
import 'package:appcat/constants/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}





class _HomeState extends State<Home> {
  late Future<List<dynamic>> _breedsFuture;

  @override
  void initState() {
    super.initState();
    _breedsFuture = ServiceApi().getBreeds();
  }

  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe5d6c8),//Color(0xfffef2e6)
      appBar: AppBar(
        backgroundColor: Color(0xff725435),
        title:
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Icon(
              Icons.pets,
              color: Color(0xfffef2e6),
              size: 17,
            ),
            Icon(
              Icons.pets,
              color: Color(0xfffef2e6),
              size: 17,
            ),
            Text("App Cat",
              style: TextStyle(
                color: Color(0xfffef2e6),
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),

            ),
            Icon(
              Icons.pets,
              color: Color(0xfffef2e6),
              size: 17,
            ),
            Icon(
              Icons.pets,
              color: Color(0xfffef2e6),
              size: 17,
            ),
          ],
        ),
      ),
      body:
      FutureBuilder<List<dynamic>>(
      future: _breedsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return
            Center(
                child:
                CircularProgressIndicator(
                  color: Color(0xff725435),
                )
            );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: const
                  InputDecoration(
                    suffixIcon: Icon(Icons.search,size: 25,),
                    labelText: 'Search',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    setState(() {
                      query = text;
                    });
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: breeds.length,
                  itemBuilder: (context, index) {

                    if (query.isEmpty || breeds[index]['name'].toLowerCase().contains(query.toLowerCase())) {
                      return

                        OpenContainer(
                          openBuilder: (context, closedContainer) {
                            selectedbreed=index;
                            return Detail();
                          },
                          transitionDuration: Duration(seconds: 1),
                          transitionType: ContainerTransitionType.fadeThrough,
                          openElevation: 5,
                          closedShape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                          ),
                          closedElevation: 5,
                          closedColor: Color(0xffe5d6c8) ,
                          closedBuilder: (context, openContainer) {
                            return Card(
                              margin: EdgeInsets.all(10),
                              elevation: 5,
                              color: Color(0xfffef2e6),//Color(0xffe5d6c8)
                              child:
                              Container(
                                height: 350,

                                child:
                                Padding(
                                    padding: EdgeInsets.all(10),
                                    child:
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              breeds[index]['name'],
                                              style: TextStyle(
                                                color: Color(0xff725435),
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Icon(
                                                Icons.arrow_forward,
                                                color: Color(0xff725435),
                                                size: 25,
                                              ),

                                          ],
                                        ),
                                        SizedBox(height: 10,),

                                        breeds[index].containsKey('reference_image_id') ?
                                        Image.network(
                                          Urlimages+breeds[index]['reference_image_id']+'.jpg',
                                          height: 250,
                                          width: 250,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Image.asset(
                                              'assets/images/noPhoto.jpg',
                                              height: 250,
                                              width: 250,
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        ):Image.asset('assets/images/noPhoto.jpg',
                                          height: 250,
                                          width: 250,
                                          fit: BoxFit.cover,),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [

                                            Text(
                                              'Origin: '+breeds[index]['origin'],
                                              style: TextStyle(
                                                color: Color(0xff725435),
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Intelligence: '+breeds[index]['intelligence'].toString(),
                                              style: TextStyle(
                                                color: Color(0xff725435),
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    )
                                ),

                              ),

                            );
                          },

                        );




                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          );
        }else {
          return Center(child: Text('No data found'));
        }
      })


    );
  }
}