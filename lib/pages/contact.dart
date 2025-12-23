import 'package:flutter/material.dart';
import 'cals.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    final item = List<String>.generate(100, (i) => "Item $i");
    List mydata = ['Apple', 'Banana', 'Papaya', 'Orange', 'Grapes'];
    return ListView(
      children: [
        ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CalculatePage(),
                  ),
                );
              },
              leading: Icon(Icons.heart_broken),
              title: Text(mydata[index]),
            );
          },
          itemCount: mydata.length,
          shrinkWrap: true,
        ),
      ],
    );
  }
}
