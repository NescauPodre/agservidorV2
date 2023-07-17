// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Valortextfield {
  int? id;
  String? title;

  Valortextfield({this.id, this.title});

  Valortextfield.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}

//--------------------------------------------------------------------------------------------------------------

class Competencia {
  int? id;
  String? body;
  int? postId;

  Competencia({this.id, this.body, this.postId});

  Competencia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    postId = json['postId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['body'] = body;
    data['postId'] = postId;
    return data;
  }
}

List<Competencia>? CompetenciaList;

//--------------------------------------------------------------------------------------------------------------