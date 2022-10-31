import 'package:flutter/material.dart';

class TypographyPart extends StatelessWidget {
  const TypographyPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Typhography',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoremIpsumApp(),
    );
  }
}

class LoremIpsumApp extends StatelessWidget {
  const LoremIpsumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              Text(
                'Lorem Ipsum',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'History, Purpose and Usage',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                '“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”'
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn't distract from the layout. A practice not without controversy, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "The passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it's seen all around the web; on templates, websites, and stock designs. Use our generator to get your own, or read on for the authoritative history of lorem ipsum.",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Source: https://loremipsum.io/',
                style: Theme.of(context).textTheme.overline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}