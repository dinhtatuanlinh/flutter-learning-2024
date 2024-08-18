
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContentScreen();
  }
}

class _ContentScreen extends State<StatefulWidget> {
  String content = "";

  @override
  void initState()  {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      String data = await rootBundle.loadString('assets/files/text.txt');
      setState(() {
        content = data;
      });
    } catch (e) {
      print("Error reading asset file: $e");
      String data = "aaaaaaa";
      setState(() {
        content = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          content,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.justify,
          style: const TextStyle(
              fontSize: 27
          ),
        ),
      ),
    );
  }

  void onClick() {
    print("clicked");
  }
}