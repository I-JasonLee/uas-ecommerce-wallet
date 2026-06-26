import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';

class DeepLinkService {
  final AppLinks _appLinks = AppLinks();

  void init(BuildContext context) {
    _appLinks.uriLinkStream.listen((Uri uri) {
      if (uri.host == "pay") {
        final amount = uri.queryParameters['amount'];
        final trxId = uri.queryParameters['trxId'];

        Navigator.pushNamed(
          context,
          '/payment',
          arguments: {
            "amount": amount,
            "trxId": trxId,
          },
        );
      }
    });
  }
}