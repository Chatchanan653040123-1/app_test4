import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetDataMarker {
  static Map<String, dynamic> placeCar = {};
  static Map<String, dynamic> placeMoto = {};

  static void getDatabaseCar() {
    final docRef =
        FirebaseFirestore.instance.collection("parkPlace").doc("car");
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        placeCar = data;
        print(placeCar);
        print(placeCar.values);
        print(placeCar.keys);
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  static void getDatabaseMoto() {
    final docRef =
        FirebaseFirestore.instance.collection("parkPlace").doc("motorcycle");
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        placeMoto = data;
        print(placeMoto);
        print(placeMoto.values);
        print(placeMoto.keys);
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  static Map<String, dynamic> getCar() {
    getDatabaseCar();
    return placeCar;
  }

  static Map<String, dynamic> getMoto() {
    getDatabaseMoto();
    return placeMoto;
  }
}
/*
Future<void> addMakerCarMotoTest(
    Set setIn, bool vehicle, LatLng pinPosition, double radius) async {
  //String path;
  vehicle ? getDatabaseCar() : getDatabaseMoto();

  // // Fetch content from the json file
  // final String response = await rootBundle.loadString(path);
  // final data = await json.decode(response);
  List _parkList = [];
  _parkList = place["placeParking"];
  // debugPrint("jsonLoad");

  var listSize = _parkList.length;
  for (var i = 0; i < listSize; i++) {
    double latitude = _parkList[i]["Latitude"] as double;
    double longitude = _parkList[i]["Longitude"] as double;
    bool seeMarker = true;

    // radius to add
    if (sqrt((pow((pinPosition.latitude - latitude), 2)) +
            pow((pinPosition.longitude - longitude), 2)) <
        radius) {
      seeMarker = true; // in radius
    } else {
      seeMarker = false; /* non in radius*/
    }

    //debugPrint("Marker add");
    setIn.add(Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId(_parkList[i]["placeID"] as String),
      position: LatLng(latitude, longitude),
      // ignore: prefer_const_constructors
      infoWindow: InfoWindow(
        title: _parkList[i]["placeID"], //title message on mark @ChangNoi
        snippet:
            "This marker park of ${_parkList[i]["placeID"]}", //snippet message on mark @ChangNoi
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      visible: seeMarker,
    ));
  }
}
*/