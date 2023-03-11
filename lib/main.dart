import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late MapController controller;
  @override
  void initState() {
    controller = MapController.withPosition(
        initPosition: GeoPoint(latitude: 42.867, longitude: 74.5749));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Title'),
      ),
      body: OSMFlutter(
        controller: controller,
        initZoom: 15,
        trackMyPosition: true,
        onMapIsReady: (p0) {},
        onLocationChanged: (p0) {
          print(p0);
        },
      ),
    );
  }
}
