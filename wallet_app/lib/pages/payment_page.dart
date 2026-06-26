import 'package:flutter/material.dart';
import 'otp_page.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map?;

    final amount = args?["amount"];
    final trxId = args?["trxId"];

    return Scaffold(
      appBar: AppBar(title: Text("Payment")),
      body: Column(
        children: [
          Text("Amount: $amount"),
          Text("Transaction: $trxId"),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => OtpPage(trxId: trxId),
                ),
              );
            },
            child: Text("Lanjut OTP"),
          )
        ],
      ),
    );
  }
}