import 'package:flutter/material.dart';

class GestureDetection extends StatelessWidget {
  const GestureDetection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gesture Detection',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const GestureDetections(),
    );
  }
}

class GestureDetections extends StatefulWidget {
  const GestureDetections({Key? key}) : super(key: key);

  @override
  State<GestureDetections> createState() => _GestureDetectionState();
}

class _GestureDetectionState extends State<GestureDetections> {
  final double boxSize = 150.0;
  int numTaps = 0;
  int numDoubTaps = 0;
  int numLongPress = 0;
  double posX = 0.0;
  double posY = 0.0;

  @override
  Widget build(BuildContext context) {
    if(posX == 0) {
      center(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gesture Detector'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: posY,
            left: posX,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  numTaps++;
                });
              },
              onDoubleTap: () {
                setState(() {
                  numDoubTaps++;
                });
              },
              onLongPress: () {
                setState(() {
                  numLongPress++;
                });
              },
              onPanUpdate: (DragUpdateDetails details) {
                setState(() {
                  double deltaX = details.delta.dx;
                  double deltaY = details.delta.dy;
                  posY += deltaY;
                  posX += deltaX;
                });
              },
              child: Container(
                width: boxSize,
                height: boxSize,
                decoration: const BoxDecoration(color: Colors.blueAccent),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.blueGrey,
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Taps: $numTaps - Double Taps: $numDoubTaps - Long Press: $numLongPress',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  void center(BuildContext context) {
    posX = (MediaQuery.of(context).size.width / 2) - boxSize / 2;
    posY = (MediaQuery.of(context).size.height / 2) - boxSize / 2 - 30;

    setState(() {
      posX = posX;
      posY = posY;
    });
  }
}
