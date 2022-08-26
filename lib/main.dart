import 'package:calenderapp/pages/event_editing_page.dart';
import 'package:calenderapp/provider/event_provider.dart';
import 'package:calenderapp/widgets/calender_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calender App With Events',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black,
            // ignore: deprecated_member_use
            accentColor: Colors.white,
            primaryColor: Colors.yellow),
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calender Events App'),
        centerTitle: true,
      ),
      body: CalenderWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EventEditingPage()));
        },
      ),
    );
  }
}
