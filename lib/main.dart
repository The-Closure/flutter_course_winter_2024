import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

PageController controller = PageController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 70, 233, 75),
              title: Text("Whatsapp"),
              actions: [Icon(Icons.search)],
            ),
            body: PageView(
              controller: controller,
              children: [firstpage(), SecondPage()],
            )));
  }
}

class scroll_widget extends StatelessWidget {
  const scroll_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      //  reverse: true,
      child: Column(
        children: [
          ListTile(
            // isThreeLine: true,
            leading: CircleAvatar(
              child: Image.asset('images/logo/logo.png'),
            ),
            title: Text('Hello WOlrd13'),
            subtitle: Text(
                'Cupidatat ea deserunt pariatur nostrud cupidatat commodo dolor id culpa labore nisi in sit culpa.'),
            trailing: Text('1000+'),
          ),
          Divider(
            indent: 20,
            endIndent: 20,
            color: Colors.red,
            thickness: 3,
          ),

          // Spacer(
          //   flex: 30,
          // ),
          ListTile(
            leading: CircleAvatar(
              child: Image.asset('images/logo/logo.png'),
            ),
            title: Text('Hello WOlrd'),
            subtitle: Text(
                'Cupidatat ea deserunt pariatur nostrud cupidatat commodo dolor id culpa labore nisi in sit culpa.'),
            trailing: Text('1000+'),
          ),
          // Spacer(
          //   flex: 30,
          // ),
          ListTile(
            leading: CircleAvatar(
              child: Image.asset('images/logo/logo.png'),
            ),
            title: Text('Hello WOlrd'),
            subtitle: Text(
                'Cupidatat ea deserunt pariatur nostrud cupidatat commodo dolor id culpa labore nisi in sit culpa.'),
            trailing: Text('1000+'),
          ),

          // Spacer(
          //   flex: 30,
          // ),
          ListTile(
            leading: CircleAvatar(
              child: Image.asset('images/logo/logo.png'),
            ),
            title: Text('Hello WOlrd'),
            subtitle: Text(
                'Cupidatat ea deserunt pariatur nostrud cupidatat commodo dolor id culpa labore nisi in sit culpa.'),
            trailing: Text('1000+'),
          ),
          // Spacer(
          //   flex: 30,
          // ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('images/logo/logo.png'),
          ElevatedButton(
              onPressed: () {
                controller.previousPage(
                    duration: Duration(seconds: 2), curve: Curves.bounceOut);
              },
              child: Text('next')),
          Text(
              'Mollit non commodo ex irure sint nisi magna nisi pariatur fugiat elit exercitation esse adipisicing. Mollit Lorem Lorem id non veniam ea cupidatat do laborum aliquip exercitation aliquip. Non veniam qui ullamco dolor sint sunt velit sint. Nisi cillum aliqua sint nulla id et reprehenderit sint elit. Nisi esse pariatur do irure id culpa mollit consequat.')
        ],
      ),
    );
  }
}

class firstpage extends StatelessWidget {
  const firstpage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('images/logo/meta_logo.png'),
          Text('Veniam cillum eu nostrud aliquip.'),
          ElevatedButton(
              onPressed: () {
                controller.nextPage(
                    duration: Duration(seconds: 2), curve: Curves.bounceOut);
              },
              child: Text('next'))
        ],
      ),
    );
  }
}
