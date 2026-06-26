import 'package:flutter/material.dart';
import 'services/deeplink_service.dart';
import 'pages/payment_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final DeepLinkService deepLinkService = DeepLinkService();

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