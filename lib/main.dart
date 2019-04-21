import 'package:flutter/material.dart';
import 'package:flutter_route_demo/not_found_page.dart';
import 'package:flutter_route_demo/with_parameter_page.dart';
import 'package:flutter_route_demo/without_parameter_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 路由',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case WithParameterPage.routeName:
            return MaterialPageRoute(
                builder: (context) =>
                    WithParameterPage(parameters: settings.arguments));
          default:
            break;
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => NotFoundPage(settings: settings),
        );
      },
      routes: {
        WithoutParameterPage.routeName: (context) => WithoutParameterPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter 路由'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildTitleView(String title) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Text(
        "$title",
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          _buildTitleView("push方式"),
          Divider(height: 1),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text("无参页面"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WithoutParameterPage(),
                    ),
                  );
                },
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  "含参页面",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WithParameterPage(
                            parameters: {"hello": "world"},
                          ),
                    ),
                  );
                },
              ),
            ],
          ),
          _buildTitleView("pushNamed方式"),
          Divider(height: 1),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text("无参页面"),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    WithoutParameterPage.routeName,
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  "含参页面",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pushNamed("/abc");
                  return;
                  Navigator.of(context).pushNamed(
                    WithParameterPage.routeName,
                    arguments: {"hello": "world"},
                  );
                },
              ),
            ],
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
