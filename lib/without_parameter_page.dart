import 'package:flutter/material.dart';

class WithoutParameterPage extends StatefulWidget {
  static String routeName = "/without_parameter_page";
  @override
  _WithoutParameterPageState createState() => _WithoutParameterPageState();
}

class _WithoutParameterPageState extends State<WithoutParameterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("无参数页面"),
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
