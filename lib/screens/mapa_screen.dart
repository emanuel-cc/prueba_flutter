import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapaScreen extends StatefulWidget {

  @override
  _MapaScreenState createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(Icons.menu),
            iconSize: 40,
            onPressed: (){},
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: IconButton(
              icon: Icon(
                Icons.near_me,
                color: Colors.green,
              ),
              onPressed: (){},
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.13,
          left: size.width * 0.07,
          child: Container(
            width: size.width * 0.87,
            height: size.height * 0.1,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.grey[200],
                  size: 30,
                ),
                Container(
                  width: size.width * 0.4,
                  child: TextFormField(
                    initialValue: "102 Fordham Rd",
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none
                    )
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey[200],
                  ),
                  onPressed: (){},
                ),
                IconButton(
                  icon: Icon(
                    Icons.tune,
                    color: Colors.grey[200],
                  ),
                  onPressed: (){},
                )
              ],
            ),
          )
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: size.width * 0.8,
            height: size.height * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height * 0.25,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "\$5",
                                style: TextStyle(
                                  fontSize: 30.0
                                ),
                              ),
                              Text(
                                "/Hr",
                                style: TextStyle(
                                  color: Colors.grey[200]
                                ),
                              )
                            ],
                          ),
                          
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.grey[300],
                                  ),
                                  Text(
                                    "102 Fordham Rd",
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.19,
                                  ),
                                  Text(
                                    "San Jose",
                                    style: TextStyle(
                                      color: Colors.grey[300]
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Divider(),
                      Text(
                        "Available spaces",
                        style: TextStyle(
                          color: Colors.grey[300]
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: size.width * 0.4,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Container(
                              width: 20,
                              margin: EdgeInsets.only(right: 80.0),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Text(
                            "4",
                            style: TextStyle(
                              fontSize: 25.0
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.directions_walk,
                            color: Colors.grey[300],
                          ),
                          Text(
                            "124 meters walk",
                            style: TextStyle(
                              color: Colors.grey[300]
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  width: size.width * 0.8,
                  height: size.height * 0.1,
                  child: ElevatedButton(
                    child: Text(
                      "Go!",
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                      )
                    ),
                    onPressed: (){},
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}