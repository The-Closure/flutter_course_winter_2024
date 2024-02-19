import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_provider_theme/providers/counter_provider.dart';
import 'package:shared_provider_theme/providers/theme_provider.dart';
import 'package:shared_provider_theme/view/details_page.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Hello");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Demo With Provider"),
        actions: [
          Switch(
            value: context.watch<ThemeProvider>().isDarkMode!,
            onChanged: (value) {
              context.read<ThemeProvider>().changeTheme();
            },
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailsPage(),
                    ));
              },
              icon: const Icon(Icons.arrow_forward))
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // setState(() {
              //   counter++;
              // });
              context.read<CounterProvider>().increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              // setState(() {
              //   counter--;
              // });
              context.read<CounterProvider>().decrement();
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              // setState(() {
              //   counter--;
              // });
              context.read<CounterProvider>().clear();
            },
            child: const Icon(Icons.clear),
          ),
        ],
      ),
      body: Center(
        child: Text(
          context.watch<CounterProvider>().counter.toString(),
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
