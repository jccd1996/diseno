import 'package:diseno/pages/animaciones_page.dart';
import 'package:diseno/retos/cuadrado_animado_page.dart';
import 'package:diseno/widgets/headers.dart';
import 'package:flutter/material.dart';

import '../labs/circular_progress_page.dart';
import 'graficas_circulares_page.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GraficasCircularesPage(),
    );
  }
}
