import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:myfoodapp/login.dart';
import 'package:myfoodapp/register.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: RichText(
          text: TextSpan(
              text: "Hai, ",
              style: TextStyle(fontSize: 18),
              children: [
                TextSpan(
                    text: "User",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ]),
        ),
        actions: [
          PopupMenuButton<IconMenu>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onSelected: (value) {
              switch (value) {
                case IconsMenu.bookmark:
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                  break;
                  break;
                case IconsMenu.Register:
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
              }
            },
            itemBuilder: (context) => IconsMenu.items
                .map((item) => PopupMenuItem<IconMenu>(
                      value: item,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(item.icon, color: Colors.pink),
                        title: Text(item.text),
                      ),
                    ))
                .toList(),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: ClipPathClass(),
                child: Container(
                  height: 150,
                  width: Get.width,
                  color: Colors.blue,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    ClipPath(
                      child: Container(
                        height: Get.height * 0.4,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 25),
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "http://slkbankum.com/profil.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "Apa pilihanmu hari ini?",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Container(
                      width: 120,
                      height: 50,
                      child: Center(
                        child: Text(
                          "Memberi",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // child: RaisedButton(onPressed: () {}),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.blue),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Container(
                      width: 120,
                      height: 50,
                      child: Center(
                          child: Text(
                        "Menerima",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                      // child: RaisedButton(onPressed: () {}),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.blue),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class IconsMenu {
  static const items = <IconMenu>[
    bookmark,
    Register,
  ];

  static const bookmark = IconMenu(
    text: 'Login',
    icon: Icons.login_outlined,
  );
  static const Register =
      IconMenu(text: 'Register', icon: Icons.app_registration);
}

class IconMenu {
  final String text;
  final IconData icon;

  const IconMenu({
    required this.text,
    required this.icon,
  });
}
