import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> imglist = [
    Image.network(
        'https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    Image.network(
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
    Image.network(
        'https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    Image.network(
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg')
  ];

  List txt = ['Text 1', 'Text 2', 'Text 3', 'Text 4'];

  late SharedPreferences logindata;
  String? username;

  @override
  void initState() {
    super.initState();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imglist.length,
      itemBuilder: (context, index) {
        return Container(
            child: Column(
          children: [
            imglist[index],
            Text(txt[index]),
          ],
        ));
      },
    );
  }
}
