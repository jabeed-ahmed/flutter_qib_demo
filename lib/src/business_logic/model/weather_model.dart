// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);

import 'dart:convert';

WeatherModel weatherModelFromJson(String str) => WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  WeatherModel({
    this.imageUrl,
    this.title,
    this.city,
    this.temp,
    this.date,
  });

  String imageUrl;
  String title;
  String city;
  String temp;
  String date;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    imageUrl: json["imageURL"],
    title: json["title"],
    city: json["city"],
    temp: json["temp"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "imageURL": imageUrl,
    "title": title,
    "city": city,
    "temp": temp,
    "date": date,
  };
}
