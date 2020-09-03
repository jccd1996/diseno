import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> moverDerecha;
  Animation<double> moverIzquierda;
  Animation<double> moverArriba;
  Animation<double> moverAbajo;

  var movimientoVertical = 0.0;
  var movimientoHorizontal = 0.0;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4500),
    );

    moverDerecha = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.25, curve: Curves.bounceOut),
      ),
    );

    moverArriba = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.25, 0.50, curve: Curves.bounceOut),
      ),
    );

    moverIzquierda = Tween(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.51, 0.75, curve: Curves.bounceOut),
      ),
    );

    moverAbajo = Tween(begin: -100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.76, 1.0, curve: Curves.bounceOut),
      ),
    );

    animationController.addListener(() {
      movimientoHorizontal = (moverDerecha.value == 100.0
          ? moverIzquierda.value
          : moverDerecha.value);

      movimientoVertical =
          (moverArriba.value == -100.0 ? moverAbajo.value : moverArriba.value);

      if (animationController.status == AnimationStatus.completed) {
        animationController.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: _Rectangle(),
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
            offset: Offset(movimientoHorizontal, movimientoVertical),
            child: InkWell(
                onTap: () {
                  animationController.forward();
                },
                child: child));
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    );
  }
}
