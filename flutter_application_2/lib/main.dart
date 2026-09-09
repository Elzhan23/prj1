import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool _loading = false;
  double _progressValue = 0.0;

  @override
  void initState() {
    _loading = false;
    _progressValue = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("SPACE"),
          titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          actions: [
            Icon(Icons.rocket_launch, color: Colors.white),
            Padding(padding: EdgeInsets.only(right: 10)),
          ],
          elevation: 7,
          shadowColor: Colors.deepPurple,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(30)),
              Text(
                'SPACE ADVENTURE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                  height: 0.95,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'EXPLORE THE UNKNOWN',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),

              SizedBox(height: 35),

              ClipOval(
                child: Image.asset(
                  'assets/image/astet.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 15),

              Container(
                padding: EdgeInsets.all(16),
                child: _loading
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Launching into space…',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontFamily: 'Tangerine',
                            ),
                          ),
                          LinearProgressIndicator(value: _progressValue),
                          Text(
                            "${(_progressValue * 100).round()}%",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      )
                    : Text(
                        "Your spaceship is waiting...",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
              ),

              SizedBox(height: 25),

              if (!_loading)
                Container(
                  width: 350,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.all(10)),
                      Icon(Icons.public, size: 40, color: Colors.white),
                      Padding(padding: EdgeInsets.only(right: 20)),
                      Expanded(
                        child: Text(
                          "Prepare yourself for an unforgettable journey through the galaxy.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),

        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
          child: SizedBox(
            height: 60,
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _loading = true;
                  _progressValue = 0.0;
                });

                _updataProgress();
              },
              icon: Icon(Icons.rocket_launch),
              label: Text(
                "START ADVENTURE",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _updataProgress() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.2;

        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          _progressValue = 0.0;
          return;
        }
      });
    });
  }
}
