import 'package:flutter/material.dart';

class CafeScreen extends StatefulWidget {
  const CafeScreen({Key? key}) : super(key: key);

  @override
  _CafeScreenState createState() => _CafeScreenState();
}

class _CafeScreenState extends State<CafeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Cafe"),
    );
  }
}
