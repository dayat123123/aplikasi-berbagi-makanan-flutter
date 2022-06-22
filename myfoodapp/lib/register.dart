import 'package:flutter/material.dart';
import 'package:myfoodapp/app/modules/home/views/home_view.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Container(
              child: Image.asset('assets/logo/logo-splash.png'),
              width: 50,
              height: 202,
            ),
            Container(
              child: Center(
                  child: Text(
                "Masukkan Data Diri Anda",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Nama",
                    hintText: "Masukkan nama",
                    icon: Icon(Icons.people)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Masukkan email",
                    icon: Icon(Icons.mail)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'Password', icon: Icon(Icons.security)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Alamat",
                    hintText: "Masukkan alamat",
                    icon: Icon(Icons.home)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "No. HP",
                    hintText: "Masukkan no hp",
                    icon: Icon(Icons.phone)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
