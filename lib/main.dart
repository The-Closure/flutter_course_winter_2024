import 'package:animation_pro/routes/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RoutesManager.router,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Color color = Colors.amber;
  Color color1 = Colors.red;
  double size = 200;
  Tween<double> value = Tween<double>(
    begin: 0,
    end: 1,
  );

  late AnimationController animationController;
  late Animation<Color?> colorTween;
  late Animation<double> sizeTween;
  bool isFav = false;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    colorTween = ColorTween(
      begin: Colors.grey.shade400,
      end: Colors.red,
    ).animate(animationController);
    sizeTween = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 100, end: 150), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 150, end: 100), weight: 50),
    ]).animate(animationController);
    animationController.addListener(() {
      print(colorTween.value);
    });
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isFav = true;
      } else {
        isFav = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/settingsPage');
        },
      ),
      body: AnimatedContainer(
        curve: Curves.bounceIn,
        decoration: BoxDecoration(
          gradient: RadialGradient(colors: [color, color1]),
        ),
        duration: const Duration(
          seconds: 3,
        ),
        width: 500,
        height: 500,
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    color = Colors.pink;
                    color1 = Colors.teal;
                    size = 500;
                    print(color.value);
                  });
                },
                child: const Text("Cahnge Color")),
            TweenAnimationBuilder(
              tween: value,
              duration: const Duration(
                seconds: 3,
              ),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Padding(
                    padding: EdgeInsets.only(top: value * 30),
                    child: child,
                  ),
                );
              },
              child: const Text(
                "Hello FLutter",
                style: TextStyle(fontSize: 50),
              ),
            ),
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return IconButton(
                  onPressed: () {
                    isFav
                        ? animationController.reverse()
                        : animationController.forward();
                  },
                  icon: Icon(
                    color: colorTween.value,
                    Icons.favorite,
                    size: sizeTween.value,
                  ),
                );
              },
            ),
            Lottie.network(
              'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
