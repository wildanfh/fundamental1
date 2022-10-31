import 'package:flutter/material.dart';

class NavRouting extends StatelessWidget {
  const NavRouting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation & routing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Go to Second Screen'),
              onPressed: () {
                Navigator.pushNamed(context, '/secondScreen');
              },
            ),
            ElevatedButton(
              child: const Text('Navigation with Data'),
              onPressed: () {
                Navigator.pushNamed(context, '/secondScreenWithData', arguments: 'Hello from First Screeen');
              },
            ),
            ElevatedButton(
              child: const Text('Return Data from Another Screen'),
              onPressed: () async {
                final scaffoldMessenger = ScaffoldMessenger.of(context);
                final result = 
                    await Navigator.pushNamed(context, '/returnDataScreen');
                SnackBar snackBar = SnackBar(content: Text('$result'));
                scaffoldMessenger.showSnackBar(snackBar);
              },
            ),
            ElevatedButton(
              child: const Text('Replace Screen'),
              onPressed: () {
                Navigator.pushNamed(context, '/replacementScreen');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class SecondScreenWithData extends StatelessWidget {
  final String data;

  const SecondScreenWithData(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(data),
            ElevatedButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class ReturnDataScreen extends StatefulWidget {
//   const ReturnDataScreen({Key? key}) : super(key: key);

//   @override
//   State<ReturnDataScreen> createState() => _ReturnDataScreenState();
// }

// class _ReturnDataScreenState extends State<ReturnDataScreen> {
//   final _textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const <Widget>[
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               child: TextField(
//                 controller: _textController,
//                 decoration: InputDecoration(labelText: 'Enter your name'),
//               ),
//             ),
//             ElevatedButton(
//               child: Text('Send'),
//               onPressed: () {
//                 Navigator.pop(context, _textController.text);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _textController.dispose();
//     super.dispose();
//   }
// }

class ReplacementScreen extends StatelessWidget {
  const ReplacementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Open Another Screen'),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/anotherScreen');
          },
        ),
      ),
    );
  }
}

class AnotherScreen extends StatelessWidget {
  const AnotherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Back to First Screen'),
            ElevatedButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '404',
              style: TextStyle(fontSize: 40),
            ),
            Text('Page Not Found'),
          ],
        ),
      ),
    );
  }
}

class MaterApp extends StatelessWidget {
  const MaterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const NavRouting(),
        '/secondScreen': (context) => const SecondScreen(),
        '/secondScreenWithData': (context) => SecondScreenWithData(
          ModalRoute.of(context)?.settings.arguments as String),
        // '/returnDataScreen': (context) => const ReturnDataScreen(),
        '/replacementScreen': (context) => const ReplacementScreen(),
        '/anotherScreen': (context) => const AnotherScreen(),
      },
       onGenerateRoute: (settings) {
        // route /
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) => const NavRouting(),
            settings: settings,
          );
        }
        // route /secondScreen
        if (settings.name == '/secondScreen') {
          return MaterialPageRoute(
            builder: (context) => const SecondScreen(),
            settings: settings,
          );
        }
        // route /secondScreenWithData
        if (settings.name == '/secondScreenWithData') {
          final String data = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => SecondScreenWithData(data),
            settings: settings,
          );
        }
        // route /returnDataScreen
        // if (settings.name == '/returnDataScreen') {
        //   return MaterialPageRoute(
        //     builder: (context) => const ReturnDataScreen(),
        //     settings: settings,
        //   );
        // }
        // route /replacementScreen
        if (settings.name == '/replacementScreen') {
          return MaterialPageRoute(
            builder: (context) => const ReplacementScreen(),
            settings: settings,
          );
        }
        // route /anotherScreen
        if (settings.name == '/anotherScreen') {
          return MaterialPageRoute(
            builder: (context) => const AnotherScreen(),
            settings: settings,
          );
        }

        return MaterialPageRoute(
          builder: (context) => const NotFoundScreen(),
          settings: settings,
        );
      },
    );
  }
}