import 'package:flutter/material.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Map userData = {};
  String errorMessage = '';
  bool securePassword = true;

  void userDataInit() {
    userData = {
      "name": _nameController.text,
      "password": _passwordController.text,
      "email": _emailController.text
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        children: [
          Container(
            margin: EdgeInsets.only(top: 132, bottom: 80),
            child: Image.asset(
              "assets/logo.png",
              width: 150,
            ),
          ),
          Text(
            'Please complete all fields to continue to MovieList.',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 29,
          ),
          TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Enter Your Name..",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent, width: 2.0),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Enter Your Email..",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent, width: 2.0),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          TextField(
              controller: _passwordController,
              obscureText: securePassword,
              decoration: InputDecoration(
                hintText: "Enter Your Password..",
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye_outlined),
                  onPressed: () {
                    setState(() {
                      securePassword = !securePassword;
                    });
                  },
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent, width: 2.0),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Visibility(
            visible: errorMessage != "",
            child: Text(
              errorMessage,
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          OutlinedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(PrimaryColor),
                  minimumSize: WidgetStatePropertyAll(Size.fromHeight(50))),
              onPressed: () {
                userDataInit();
                if (userData["name"] == "" ||
                    userData["email"] == "" ||
                    userData["password"] == "") {
                  setState(() {
                    errorMessage = "Please Fill all the fields";
                  });
                } else {
                  setState(() {
                    errorMessage = "";
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                userData: userData,
                              )));
                }
              },
              child: Text(
                "Continue",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )),
        ],
      ),
    );
  }
}
