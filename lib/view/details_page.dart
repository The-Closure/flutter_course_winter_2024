import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/counter_provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          context.watch<CounterProvider>().counter.toString(),
          style: const TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
