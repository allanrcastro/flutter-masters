import 'package:flutter/material.dart';
import 'package:flutter_masters/pages/todopage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
      ),
      //home: MyHomePage(title: 'Ola flttr'), //commented this out because it will throw an error when we declare initial route
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MyHomePage(title: 'Ola flttr'),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/x': (context) => PageX(),
        '/y': (context) => PageY(),
        '/todo': (context) => TodoPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget { //this is my first "route"
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool pressed = false;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'F.A.B. click count:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),

            FlatButton(
              onPressed: () {
                setState(() {
                 pressed = !pressed; 
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageX()),
                    );
              },
              color: Colors.blueGrey,
              child: Column (children: <Widget>[
                Text( "simple push and pop nav",
                style: pressed
                ? TextStyle(color: Colors.white)
                : TextStyle(color: Colors.lightBlueAccent),
                )
              ],)
            ),
          
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/y');
              },
              color: Colors.blueGrey,
              child: Column (children: <Widget>[
                Text( "Named route navigation",
                style: pressed
                ? TextStyle(color: Colors.white)
                : TextStyle(color: Colors.lightBlueAccent),
                )
              ],)
            ),

            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/todo');
              },
              color: Colors.black,
              child: Column (children: <Widget>[
                Text( "todo list example",
                style: pressed
                ? TextStyle(color: Colors.white)
                : TextStyle(color: Colors.grey),
                )
              ],)
            ),
          
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      );
  }
}

class PageX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page X"),
          ),
          body: Center(
            child: RaisedButton(
              onPressed: () {
                  Navigator.pop(context);
                  //Navigator.pushNamed(context, '/');
                },
            child: Text('Go back!'),
          ),
        ),
      );
    }
}

class PageY extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page Y"),
          ),
          body: Center(
            child:
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
            child: Text('Go back to main'),
          ),
        ),
      );
    }
}