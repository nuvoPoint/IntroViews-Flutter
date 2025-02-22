import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

/// This is the main method of app, from here execution starts.
void main() => runApp(App());

/// App widget class

class App extends StatelessWidget {
  //making list of pages needed to pass in IntroViewsFlutter constructor.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntroViews Flutter', //title of app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          [
            PageViewModel(
                pageColor: const Color(0xFF03A9F4),
                // iconImageAssetPath: 'assets/air-hostess.png',
                bubble: Image.asset('assets/air-hostess.png'),
                body: Column(
                  children: <Widget>[
                    TextField(decoration: InputDecoration(labelText: 'Full name')),
                    TextField(decoration: InputDecoration(labelText: 'Middle name')),
                    TextField(decoration: InputDecoration(labelText: 'Last name')),
                    TextField(decoration: InputDecoration(labelText: 'More Last name')),
                    TextField(decoration: InputDecoration(labelText: 'Super Last name')),
                    TextField(decoration: InputDecoration(labelText: 'Ultra Last name')),
                    TextField(
                      decoration: InputDecoration(labelText: 'The last Last name'),
                      scrollPadding: EdgeInsets.all(70),
                    ),
                  ],
                ),
                // title: Text(
                //   'Flights',
                // ),
                textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
                mainImage: Image.asset(
                  'assets/airplane.png',
                  height: 285.0,
                  width: 285.0,
                  alignment: Alignment.center,
                )),
            PageViewModel(
              pageColor: const Color(0xFF8BC34A),
              iconImageAssetPath: 'assets/waiter.png',
              body: Text(
                'We  work  for  the  comfort ,  enjoy  your  stay  at  our  beautiful  hotels',
              ),
              // title: Text('Hotels'),
              mainImage: Image.asset(
                'assets/hotel.png',
                height: 285.0,
                width: 285.0,
                alignment: Alignment.center,
              ),
              textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
            ),
            PageViewModel(
              pageColor: const Color(0xFF607D8B),
              iconImageAssetPath: 'assets/taxi-driver.png',
              body: Text(
                'Easy  cab  booking  at  your  doorstep  with  cashless  payment  system',
              ),
              // title: Text('Cabs'),
              mainImage: Image.asset(
                'assets/taxi.png',
                height: 285.0,
                width: 285.0,
                alignment: Alignment.center,
              ),
              textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
            ),
          ],
          onTapDoneButton: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ), //MaterialPageRoute
            );
          },
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}

/// Home Page of our example app.

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ), //Appbar
      body: Center(
        child: Text("This is the home page of the app"),
      ), //Center
    ); //Scaffold
  }
}
