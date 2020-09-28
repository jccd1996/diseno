import 'package:diseno/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: MiSlidesShow()),
            Expanded(child: MiSlidesShow()),
          ],
        ),
      ),
    );
  }
}

class MiSlidesShow extends StatelessWidget {
  const MiSlidesShow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 20.0,
      bulletSecundario: 12.0,
      puntosArribas: false,
      colorPrimario: Colors.blue,
      colorSecundario: Colors.blueGrey,
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
