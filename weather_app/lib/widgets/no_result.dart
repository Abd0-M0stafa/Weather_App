import 'package:flutter/material.dart';

import '../screens/search_padge.dart';

class NoResult extends StatelessWidget {
  const NoResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => SearchPadge(),
                ),
              );
            },
          )
        ],
        title: const Text('Weather App'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'there is no weater.. start',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              'shearching now',
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
