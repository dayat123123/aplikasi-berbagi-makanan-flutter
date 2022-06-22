import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:myfoodapp/entitas/note.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:myfoodapp/register.dart';
import 'package:myfoodapp/admin_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dbHelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool visible = false;
  final String sUrl = "http://slkbankum.com/api_app/login.php";
  DbHelper dbHelper = DbHelper();
  late Profil profil;
  void initState() {
    super.initState();
  }

  _cekLogin() async {
    setState(() {
      visible = true;
    });
    final prefs = await SharedPreferences.getInstance();
    var params = "?email=" +
        emailcontroller.text +
        "&password=" +
        passwordcontroller.text;

    try {
      var res = await http.get(Uri.parse(sUrl + params));
      if (res.statusCode == 200) {
        var response = json.decode(res.body);
        if (response['response_status'] == "OK") {
          prefs.setBool('slogin', true);
          profil = Profil(
            id: 1,
            email: response['data'][0]['email'],
            username: response['data'][0]['username'],
            nama: response['data'][0]['nama'],
          );
          _saveProfil(profil);
          setState(() {
            visible = false;
          });
          _showAlertDialogBerhasil(context);
        } else {
          setState(() {
            visible = false;
          });
          _showAlertDialog(context, response['response_message']);
        }
      }
    } catch (e) {}
  }

  void _saveProfil(Profil object) async {
    // await dbHelper.insert(object);
  }

  _showAlertDialogBerhasil(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () => Navigator.of(context, rootNavigator: true)
          .pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => AdminPage()),
              (Route<dynamic> route) => false),
    );
    AlertDialog alert = AlertDialog(
      title: Text("Notifikasi"),
      content: Text("Login Berhasil"),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _showAlertDialog(BuildContext context, String err) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
    );
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text(err),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                child: Image.asset('assets/logo/logo-splash.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Login Form",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        labelText: "email",
                        hintText: "email",
                        icon: Icon(Icons.dashboard))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Password', icon: Icon(Icons.security)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    _cekLogin();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
