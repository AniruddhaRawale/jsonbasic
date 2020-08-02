//json - javascript object notation
//json is syntax used for storing and sharing data
//json is such a file format which can be easily read &interpreted by
//both humans and computers
//json is used while exchanging data through server or application
import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: FutureBuilder(
          //to get data online use httpgetlibrary
          //to get data from assts use defaultassetbundle
          //rest process is same
          //give url properly otherwise it gives error
          future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
          builder: (context, snapshot) {
            //we have to first decrypt the data and then convert into
            //string so we can return and use in widget

            ///json object when data is reside in json file it is json object
            ///when it comes back to dart file it turns into map
            ///map with key and value
            ///
            /// you dont need to use key value pairs if you use []
            /// instead of this {}
            ///
            /// to remove the error of tried on null use if else
            /// this error comes because snapshot.data is asynchronous function
            /// which may lead to delay in getting during between time
            /// which causes deleay and gives error that it found null
            var mydata = json.decode(snapshot.data.toString());
            //if you cant find any data this will appear
            if(mydata==null){
              return Center(
                child: Text("Loading,",
                  style: TextStyle(
                    fontFamily: 'cursive',
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0
                  ),
                ),
              );
            }
            //if you find any data
            else{
              return Center(
                child: Text(
                  mydata['items'][1]['name'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      fontFamily: 'cursive'
                  ),
                ),
              );
            }

          },
        )
    );
  }
}
