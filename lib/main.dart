import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 建立AppBar
    final appBar = AppBar(
      title: Text('動畫範例'),
    );

    // 建立App的操作畫面
    final animationWrapper = _AnimationWrapper(
        GlobalKey<_AnimationWrapperState>(), 1.0);

    var btn = RaisedButton(
      child: Text('變透明', style: TextStyle(fontSize: 18, color: Colors.white),),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: Colors.lightBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () {
        animationWrapper.setOpacity(0.0);
      },
    );

    final widget = Center(
      child: Container(
        child: Column(
          children: <Widget>[animationWrapper,
            Container(child: btn, margin: EdgeInsets.symmetric(vertical: 20),)],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );

    // 結合AppBar和App操作畫面
    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }
}

class _AnimationWrapper extends StatefulWidget {
  final GlobalKey<_AnimationWrapperState> _key;
  double _opacity;

  _AnimationWrapper(this._key, this._opacity): super (key: _key);

  @override
  State<StatefulWidget> createState() => _AnimationWrapperState();

  setOpacity(double opacity) {
    _key.currentState?.setOpacity(opacity);
  }
}

class _AnimationWrapperState extends State<_AnimationWrapper> {
  @override
  Widget build(BuildContext context) {
    var w = AnimatedOpacity(
      child: Icon(Icons.star),
      duration: Duration(seconds: 1),
      opacity: widget._opacity,
      onEnd: () =>
          setState(() {
            widget._opacity = 1.0;
          }),
    );

    return w;
  }

  setOpacity(double opacity) {
    setState(() {
      widget._opacity = opacity;
    });
  }
}