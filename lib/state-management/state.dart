import 'package:flutter/material.dart';
import 'package:fundamental/state-management/provider/done_module_provider.dart';
import 'package:provider/provider.dart';

class StateManagemet extends StatelessWidget {
  const StateManagemet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DoneModuleProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'State',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const ModulePage(),
      ),
    );
  }
}

class ModulePage extends StatelessWidget {
  const ModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mulai Pemrograman Dengan Dart'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DoneModuleList(),
                  ));
            },
          ),
        ],
      ),
      body: const ModuleList(),
    );
  }
}

class ModuleList extends StatelessWidget {
  final List<String> _moduleList = const [
    'Modul 1 - Pengenalan Dart',
    'Modul 2 - Program Dart Pertamamu',
    'Modul 3 - Dart Fundamental',
    'Modul 4 - Control Flow',
    'Modul 5 - Collections',
    'Modul 6 - Object Oriented Programming',
    'Modul 7 - Functional Styles',
    'Modul 8 - Dart Type System',
    'Modul 9 - Dart Futures',
    'Modul 10 - Effective Dart',
  ];

  const ModuleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _moduleList.length,
      itemBuilder: (context, index) {
        return Consumer<DoneModuleProvider>(
          builder: (context, DoneModuleProvider data, widget) {
            return ModuleTile(
              moduleName: _moduleList[index],
              isDone: data.doneModuleList.contains(_moduleList[index]),
              onClick: () {
                data.complete(_moduleList[index]);
              },
            );
          },
        );
      },
    );
  }
}

class ModuleTile extends StatelessWidget {
  final String moduleName;
  final bool isDone;
  final Function() onClick;

  const ModuleTile({
    Key? key,
    required this.moduleName,
    required this.isDone,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(moduleName),
      trailing: isDone
          ? const Icon(Icons.done)
          : ElevatedButton(
              onPressed: onClick,
              child: const Text('Done'),
            ),
    );
  }
}

class DoneModuleList extends StatelessWidget {
  const DoneModuleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doneModuleList =
        Provider.of<DoneModuleProvider>(context, listen: false).doneModuleList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Done Module List'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(doneModuleList[index]),
          );
        },
        itemCount: doneModuleList.length,
      ),
    );
  }
}
