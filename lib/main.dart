import 'package:flutter/material.dart';
import 'package:responsive_dash_board/views/desktop_layout.dart';
import 'package:responsive_dash_board/views/mobile_layout.dart';
import 'package:responsive_dash_board/views/tablet_layout.dart';

import 'views/adaptive_layout.dart';

void main() {
  runApp(const ResponsiveDashBoard());
}

class ResponsiveDashBoard extends StatelessWidget {
  const ResponsiveDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AdaptiveLayout(
        mobileLayout: MobileLayout(),
        tabletLayout: TabletLayout(),
        desktopLayout: DesktopLayout(),
      ),
    );
  }
}
