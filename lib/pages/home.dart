import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: ListView(
        children: [
          MyBox(
            "What is computer?",
            "A computer is a machine that can be programmed to carry out sequences of arithmetic or logical operations automatically.",
            "https://cdn.nguyenkimmall.com/images/detailed/819/cpu-amd-ryzen-la-gi.jpg",
          ),
          SizedBox(height: 24),
          MyBox(
            "What is Flutter?",
            "Flutter is an open-source UI software development toolkit created by Google.",
            "https://teamtweaks1-blog.s3.us-east-2.amazonaws.com/blog/wp-content/uploads/2020/12/30062049/why-choose-Flutter.png",
          ),
          SizedBox(height: 24),
          MyBox(
            "What is Dart?",
            "Dart is a client-optimized programming language for apps on multiple platforms.",
            "https://images.ctfassets.net/aq13lwl6616q/5VSPdnVk03aXwUG8mytiTG/33c6f1949649ee86f7eab4f0b4e4e28b/dart_programming_zero_to_mastery.png",
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget MyBox(String title, String subtitle, String imageUrl) {
    return Container(
      padding: EdgeInsets.all(24),
      height: 350,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 213, 248, 255),
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(subtitle, style: TextStyle(fontSize: 18, color: Colors.white)),
        ],
      ),
    );
  }
}
