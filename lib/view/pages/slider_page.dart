
import 'package:flutter/material.dart';
import 'package:flutter_ui/view/widget/my_cirlce_avatar.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: 200,
              child: PageView(
                // controller: controller,
                children: [
                  Image.asset('images/logo/logo.png'),
                  Image.asset("images/logo/meta_logo.png")
                ],
              ),
            ),
            CircleAvatarWidget()
          ],
        ),
      ),
    );
  }
}
