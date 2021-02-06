import 'package:flutter/material.dart';

class LivePage extends StatefulWidget {
  @override
  _livePageState createState() => _livePageState();
}

class _livePageState extends State<LivePage> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('live'),
    );
  }
}
