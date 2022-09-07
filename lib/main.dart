import 'package:flutter/material.dart';
import 'package:flutter_callback_widget_sample/item_select_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Callback Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Callback Widget Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const apple = 'Louis Hansel';
const cat = 'Manja Vitolic';

class _MyHomePageState extends State<MyHomePage> {
  String item = '';
  String message = '';

  @override
  Widget build(BuildContext context) {
    if (item == 'apple') {
      message = 'Thanks $apple on unSplash';
    } else if (item == 'cat') {
      message = 'Thanks  $cat on unSplash';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'コールバックで返された値: $item',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(message),
            const SizedBox(
              height: 20.0,
            ),
            item != '' ? Image.asset('assets/images/$item.jpg') : Container(),
            const SizedBox(
              height: 50.0,
            ),
            ItemSelectWidget(onSelectedItem: (value) {
              setState(() {
                item = value;
              });
            }),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
