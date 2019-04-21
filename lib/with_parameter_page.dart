import 'package:flutter/material.dart';

class WithParameterPage extends StatefulWidget {
  final Map<String, dynamic> parameters;
  static const String routeName = "/with_parameter_page";
  const WithParameterPage({Key key, this.parameters}) : super(key: key);
  @override
  _WithParameterPageState createState() => _WithParameterPageState();
}

class _WithParameterPageState extends State<WithParameterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("含参数页面"),
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Text(
            "${widget.parameters?.toString()}",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
