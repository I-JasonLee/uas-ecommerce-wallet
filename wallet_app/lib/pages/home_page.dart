import 'package:flutter/material.dart';
import '../data/wallet_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Money Wallet"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Saldo",
              style: TextStyle(fontSize:18),
            ),

            const SizedBox(height:10),

            Text(
              "Rp ${WalletData.saldo}",
              style: const TextStyle(
                fontSize:30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height:30),

            const Text(
              "Riwayat",
              style: TextStyle(fontSize:18),
            ),

            const SizedBox(height:10),

            Expanded(

              child: ListView.builder(

                itemCount: WalletData.history.length,

                itemBuilder: (context,index){

                  return ListTile(

                    leading: const Icon(Icons.payment),

                    title: Text(WalletData.history[index]),

                  );

                },

              ),

            ),

          ],

        ),

      ),

    );

  }

}