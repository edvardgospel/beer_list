import 'package:beer_list/context/beer_context.dart';
import 'package:beer_list/server/model/beer_response.dart';
import 'package:beer_list/server/server_request.dart';
import 'package:beer_list/view/pages/beer_selector_page.dart';
import 'package:beer_list/view/pages/connection_error_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<BeerContext>(
          create: (_) => BeerContext(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beer List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Beer List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ConnectivityResult? _connectivityStatus;
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();
    _checkInternetConnectivity();
  }

  Future<void> _checkInternetConnectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
      if (result != ConnectivityResult.none) {
        initBeers();
      }
    } catch (e) {
      result = ConnectivityResult.none;
    }

    if (!mounted) return;
    setState(() {
      _connectivityStatus = result;
    });
  }

  initBeers() async {
    List<Beer> beers = await fetchBeers();
    context.beerContext(listen: false).setBeers(beers);
  }

  @override
  Widget build(BuildContext context) {
    return _connectivityStatus == ConnectivityResult.none
        ? ConnectionErrorPage(onTap: () => _checkInternetConnectivity())
        : const BeerSelectorPage();
  }
}
