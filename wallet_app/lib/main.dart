import 'package:flutter/material.dart';
import 'services/deeplink_service.dart';
import 'pages/payment_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final DeepLinkService deepLinkService = DeepLinkService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet App',
      routes: {
        '/payment': (context) => PaymentPage(),
      },
      home: Builder(
        builder: (context) {
          deepLinkService.init(context);
          return HomePage();
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Wallet Home - Ready"),
      ),
    );
  }
}