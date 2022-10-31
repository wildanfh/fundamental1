import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Localization extends StatelessWidget {
  const Localization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Localizations',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('id', ''),
        Locale('en', ''),
      ],
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Localizations.override(
          context: context,
          locale: const Locale('id'),
          child: Builder(
            builder: (BuildContext context) {
              return Text(AppLocalizations.of(context)!.titleApp);
            },
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.helloWorld("fooFoo"),
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            Text(
              AppLocalizations.of(context)!.address("Bandung", "Indonesia"),
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            Text(
              AppLocalizations.of(context)!.myNumber(12),
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            Text(
              AppLocalizations.of(context)!.myApple(12.25),
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            Text(
              AppLocalizations.of(context)!.todayDate(DateTime.now()),
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            Text(
              AppLocalizations.of(context)!.nThings(5, "Buku"),
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                  ),
                  child: const Text('measurement'),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                  ),
                  child: const Text('measurement 2'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
