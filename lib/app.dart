import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/home.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  late SharedPreferences logindata;
  late bool newuser;

  @override
  void initState() {
    super.initState();
    if_already_loggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 124, 18, 173),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                  hintText: 'Email',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: passcontroller,
            decoration: InputDecoration(
                hintText: 'Password',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                )),
          ),
          FloatingActionButton(
              child: Text('Login'),
              onPressed: () {
                String email = emailcontroller.text;
                String pass = passcontroller.text;

                if (email != '' && pass != '') {
                  print('successful');
                  logindata.setBool('login', false);
                }

                logindata.setString('username', email);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              })
        ],
      ),
    );
  }

  void if_already_loggedIn() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);

    print(newuser);
    if (newuser == false) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }
}
