import 'package:flutter/material.dart';

class ConstraintsPart extends StatelessWidget {
  const ConstraintsPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Constraints',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ConstraintState4(),
    );
  }
}

class ConstraintState extends StatelessWidget {
  const ConstraintState({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.blueAccent,
        child: Container(
          color: Colors.blueGrey,
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}

class ConstraintState2 extends StatelessWidget {
  const ConstraintState2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 70,
          minHeight: 70,
          maxWidth: 150,
          maxHeight: 150,
        ),
        child: Container(
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}

class UnConstraintState extends StatelessWidget {
  const UnConstraintState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        color: Colors.blueGrey,
        width: 1000,
        height: 100,
      ),
    );
  }
}

class ConstraintState3 extends StatelessWidget {
  const ConstraintState3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
            child: const Text('Hello!'),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
            child: const Text('Goodbye!'),
          ),
        ),
      ],
    );
  }
}

class ConstraintState4 extends StatelessWidget {
  const ConstraintState4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            color: Colors.red,
            child: const Text('Hello!'),
          ),
        ),
        Flexible(
          child: Container(
            color: Colors.green,
            child: const Text('Goodbye!'),
          ),
        ),
      ],
    );
  }
}
