import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 110, 184, 245),
        body: ListView(
          children: [
            SizedBox(
              height: 70,
              width: 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              height: Get.width * 0.5,
              width: Get.height * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(
                      "http://slkbankum.com/api_app/logo-splash.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(50),
              width: 200,
              child: Center(
                child: Text(
                  "Beras didunia tidak akan habis dimakan oleh satu orang, permasalahan didunia tidak dapat diselesaikan oleh satu orang. Diperlukan kerjasama antara Saya, Anda dan Dia untuk melakukannya",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Text(
              "-Master Cheng Yen-",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}
