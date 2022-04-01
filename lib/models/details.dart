import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Details {
  String title = '';
  Details(
    this.title,
  );

  Details.fromJson(Map<String, dynamic> DetailsMap) {
    title = DetailsMap['title'] ?? 'NoData';
  }
}

