import 'dart:developer';

import 'package:flutter/material.dart';
import 'showDialog.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 16.0,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("xyz"),
              accountEmail: Text("xyz@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("xyz"),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("abc"),
                )
              ],
            ),
            ListTile(
              title: new Text("All Inboxes"),
              subtitle: Text('A strong animal'),
              leading: new Icon(Icons.mail),
              selected: true,
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: new Text("Second Page"),
              leading: new Icon(Icons.inbox),
              subtitle: Text('Click to Go page'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/200/300'),
              ),
              title: Text('Horse'),
            ),
            ListTile(
              title: Text('Horse'),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            ListTile(
              title: Text('Long press or tap'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                log('On tap');
                _showMyDialog(context, 'Tap press');
              },
              onLongPress: () {
                log('Long press');
                _showMyDialog(context, 'Long press');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonTheme(
            minWidth: 200.0,
            child: RaisedButton(
              child: Text('Second Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
          ),
          ButtonTheme(
            minWidth: 200.0,
            child: RaisedButton(
              child: Text('Shopping List Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/shoppinglist');
              },
            ),
          ),
          ButtonTheme(
            minWidth: 200.0,
            child: RaisedButton(
              child: Text('Tabs Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/tabs');
              },
            ),
          ),
          ButtonTheme(
            minWidth: 200.0,
            child: RaisedButton(
              child: Text('Counter Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/counter');
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.teal,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Search"),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text("Add"),
            icon: Icon(Icons.add_box),
          ),
        ],
        onTap: (int index) {
//          setState(() {
//            _currentIndex = index;
//          });
        },
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context, String str) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This is $str'),
              Text('This msg $str?'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
}
