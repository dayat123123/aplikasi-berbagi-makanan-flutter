import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class Profil {
  int id;
  String username;
  String nama;
  String email;
  // String seo;
  //String resume;

  Profil({
    required this.id,
    required this.username,
    required this.email,
    required this.nama,
  }
      //  this.seo,
      // this.resume
      );

  factory Profil.fromMap(Map<String, dynamic> map) {
    return Profil(
      id: map['id'],
      email: map['email'],
      username: map['username'],
      nama: map['nama'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = id;
    map['email'] = email;
    map['username'] = username;
    map['nama'] = nama;
    // map['seo'] = seo;
    //map['resume'] = resume;
    return map;
  }
}
