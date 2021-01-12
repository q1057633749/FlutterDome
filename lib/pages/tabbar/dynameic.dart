import 'package:flutter/material.dart';

class DynameicPage extends StatefulWidget {
  @override
  _dynameicPageState createState() => _dynameicPageState();
}

class _dynameicPageState extends State<DynameicPage> with SingleTickerProviderStateMixin {
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
    return Container();
  }
}
