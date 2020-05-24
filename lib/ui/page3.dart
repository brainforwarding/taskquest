import 'package:covidtasklist/ui/menu.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
      ),
      drawer: Drawer(
        child: Menu(),
      ),
    );
  }
}