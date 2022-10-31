import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';


class Cupertino extends StatelessWidget {
  const Cupertino({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      darkTheme: ThemeData.dark(),
      title: 'Cupertino',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AdaptivePage(),
    );
  }
}

class AdaptivePage extends StatefulWidget {
  const AdaptivePage({Key? key}) : super(key: key);

  @override
  State<AdaptivePage> createState() => _AdaptivePageState();
}

class _AdaptivePageState extends State<AdaptivePage> {
  bool _isSelected = true;
  double _sliderValue = 75;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaptive Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch.adaptive(
              value: _isSelected,
              onChanged: (value) {
                setState(() {
                  _isSelected = value;
                });
              },
            ),
            Slider.adaptive(
              value: _sliderValue,
              min: 0,
              max: 100,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            defaultTargetPlatform == TargetPlatform.iOS
                ? const Text('IOS')
                : const Text('Android'),
          ],
        ),
      ),
    );
  }
}