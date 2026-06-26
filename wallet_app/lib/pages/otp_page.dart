import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OtpPage extends StatelessWidget {
  final String trxId;

  OtpPage({required this.trxId});

  final otpController = TextEditingController();

  void sendResult(String status) async {
    final uri = Uri.parse(
      "merchantapp://result?status=$status&trxId=$trxId",
    );

    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OTP 2FA")),
      body: Column(
        children: [
          TextField(
            controller: otpController,
            decoration: InputDecoration(labelText: "OTP"),
          ),

          ElevatedButton(
            onPressed: () {
              if (otpController.text == "123456") {
                sendResult("success");
              } else {
                sendResult("failed");
              }
            },
            child: Text("Verifikasi"),
          )
        ],
      ),
    );
  }
}