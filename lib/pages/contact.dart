import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    List mydata = ['apple', 'banana', 'papaya'];
    return ListView(
      children: [
        ListTile(
          onTap: () {},
          leading: Icon(Icons.map),
          title: Text(mydata[0]),
          subtitle: Text("subtitle"),
          trailing: FlutterLogo(),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.local_movies),
          title: Text(mydata[1]),
        ),
        ListTile(onTap: () {}, leading: FlutterLogo(), title: Text(mydata[2])),
      ],
    );
  }
}
