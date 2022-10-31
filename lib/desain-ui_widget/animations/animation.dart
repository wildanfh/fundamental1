import 'package:flutter/material.dart';
import 'dart:math';

class Animations extends StatelessWidget {
  const Animations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ExplicitAnimation(),
    );
  }
}

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool _isBig = false;
  double _size = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              color: Colors.blueGrey,
              height: _size,
              width: _size,
            ),
            ElevatedButton(
              child: const Text('Animate'),
              onPressed: () {
                setState(() {
                  _size = _isBig ? 200 : 100;
                  _isBig = !_isBig;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AnimationPage2 extends StatefulWidget {
  const AnimationPage2({Key? key}) : super(key: key);

  @override
  State<AnimationPage2> createState() => _AnimationPageState2();
}

class _AnimationPageState2 extends State<AnimationPage2> {
  final double _size = 100.0;
  final Tween<double> _animationTween = Tween(begin: 0, end: pi * 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              tween: _animationTween,
              duration: const Duration(seconds: 2),
              builder: (context, double value, child) {
                return Transform.rotate(
                  angle: value,
                  child: Container(
                    color: Colors.blueAccent,
                    height: _size,
                    width: _size,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AnimationPage3 extends StatefulWidget {
  const AnimationPage3({Key? key}) : super(key: key);

  @override
  State<AnimationPage3> createState() => _AnimationPageState3();
}

class _AnimationPageState3 extends State<AnimationPage3> {
  final double _size = 80.0;
  final _colorTween = ColorTween(begin: Colors.blue, end: Colors.purple);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: _colorTween,
              duration: const Duration(seconds: 3),
              builder: (context, value, child) {
                return Container(
                  color: value as Color,
                  height: _size,
                  width: _size,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _iconController;
  bool _isRotating = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: const Text('Explicit Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: _controller,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: const FlutterLogo(
                  size: 100,
                ),
              ),
            ),
            IconButton(
              iconSize: 36,
              icon: AnimatedIcon(
                icon: AnimatedIcons.play_pause,
                progress: _iconController,
              ),
              onPressed: () {
                if(_isRotating) {
                  _controller.stop();
                  _iconController.reverse();
                } else {
                  _controller.repeat();
                  _iconController.forward();
                }

                _isRotating = !_isRotating;
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _iconController.dispose();
    super.dispose();
  }
}
