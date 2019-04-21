import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  final RouteSettings settings;

  const NotFoundPage({Key key, this.settings}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("您要找的界面去太空了"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text("路由：${settings.name} 找不到了"),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                child: Text("上报错误"),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
