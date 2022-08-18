import 'dart:convert';

import 'package:http/http.dart';

BoredActivity boredActivityFromJson(String str) => BoredActivity.fromJson(json.decode(str));

String boredActivityToJson(BoredActivity data) => json.encode(data.toJson());

class BoredActivity {
  BoredActivity({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  String activity;
  String type;
  int participants;
  double price;
  String link;
  String key;
  double accessibility;

  factory BoredActivity.fromJson(Map<String, dynamic> json) => BoredActivity(
    activity: json["activity"],
    type: json["type"],
    participants: json["participants"],
    price: json["price"].toDouble(),
    link: json["link"],
    key: json["key"],
    accessibility: json["accessibility"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "activity": activity,
    "type": type,
    "participants": participants,
    "price": price,
    "link": link,
    "key": key,
    "accessibility": accessibility,
  };
}

class BoredService {

  final json ={
    "activity": "Take a nap",
    "type": "relaxation",
    "participants": 1,
    "price": 0,
    "link": "",
    "key": "6184514",
    "accessibility": 0
  };

  Future<BoredActivity> getBoredActivity() async {

    try{
      final response = await get(Uri.parse('https://www.boredapi.com/api/activity'));
      final activity = boredActivityFromJson(response.body);
      return activity;
    }catch(e){
      print("this is this process");
      return BoredActivity.fromJson(json);
    }
  }
}