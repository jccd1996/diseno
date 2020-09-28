import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArribas;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  Slideshow({
    @required this.slides,
    this.puntosArribas = false,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12,
    this.bulletSecundario = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlidesShowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              setDataToProvider(context);
              return _CrearEstructuraSlideshow(
                puntosArribas: puntosArribas,
                slides: slides,
              );
            },
          ),
        ),
      ),
    );
  }

  void setDataToProvider(BuildContext context) {
    Provider.of<_SlidesShowModel>(context).colorPrimario = this.colorPrimario;
    Provider.of<_SlidesShowModel>(context).colorSecundario =
        this.colorSecundario;
    Provider.of<_SlidesShowModel>(context).bulletPrimario = this.bulletPrimario;
    Provider.of<_SlidesShowModel>(context).bulletSecundario =
        this.bulletSecundario;
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    Key key,
    @required this.puntosArribas,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArribas;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.puntosArribas) _Dots(slides.length),
        Expanded(
          child: _Slides(this.slides),
        ),
        if (!this.puntosArribas) _Dots(slides.length),
      ],
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SlidesShowModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  _Dots(
    this.totalSlides,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.totalSlides, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SlidesShowModel>(context);
    var tamano;
    var color;
    if (_transitionValidation(slideshowModel)) {
      tamano = slideshowModel.bulletPrimario;
      color = slideshowModel.colorPrimario;
    } else {
      tamano = slideshowModel.bulletSecundario;
      color = slideshowModel.colorSecundario;
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  bool _transitionValidation(_SlidesShowModel _slidesShowModel) {
    return (_slidesShowModel.currentPage >= (index - 0.5) &&
        _slidesShowModel.currentPage < index + 0.5);
  }
}

class _SlidesShowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.blue;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  Color get colorPrimario => this._colorPrimario;

  set colorPrimario(Color value) {
    _colorPrimario = value;
  }

  Color get colorSecundario => this._colorSecundario;

  set colorSecundario(Color value) {
    _colorSecundario = value;
  }

  double get currentPage => _currentPage;

  set currentPage(double value) {
    _currentPage = value;
    notifyListeners();
  }

  double get bulletPrimario => this._bulletPrimario;

  set bulletPrimario(double value) {
    _bulletPrimario = value;
  }

  double get bulletSecundario => this._bulletSecundario;

  set bulletSecundario(double value) {
    _bulletSecundario = value;
  }
}
