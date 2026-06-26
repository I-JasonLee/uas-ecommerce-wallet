import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String status = "Belum ada transaksi";

  @override
  void initState() {
    super.initState();
    listenDeepLink();
  }

  void listenDeepLink() {
    AppLinks().uriLinkStream.listen((Uri uri) {
      if (uri.host == "result") {
        final result = uri.queryParameters['status'];
        final trxId = uri.queryParameters['trxId'];

        setState(() {
          status = "TRX $trxId : $result";
        });
      }
    });
  }

  void pay() async {
    final uri = Uri.parse(
      "walletapp://pay?amount=50000&trxId=123",
    );

    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Merchant App")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Produk: Kopi Susu"),
          Text("Harga: 50.000"),
          SizedBox(height: 20),

          ElevatedButton(
            onPressed: pay,
            child: Text("Bayar Sekarang"),
          ),

          SizedBox(height: 20),
          Text(status),
        ],
      ),
    );
  }
}