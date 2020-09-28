import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({
    @required this.onPressed,
    @required this.icon,
  });
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  PinterestMenu({
    this.mostrar = true,
    this.backgroundColor,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    @required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Builder(
        builder: (context) {
          Provider.of<_MenuModel>(context, listen: false).activeColor =
              activeColor;
          Provider.of<_MenuModel>(context, listen: false).inactiveColor =
              inactiveColor;
          Provider.of<_MenuModel>(context, listen: false).backgroundColor =
              backgroundColor;
          return AnimatedOpacity(
            opacity: (mostrar) ? 1 : 0,
            duration: Duration(milliseconds: 250),
            child: _PinterestMenuBackground(
              child: _MenuItems(items),
            ),
          );
        },
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  _PinterestMenuBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 60,
        decoration: BoxDecoration(
            color:
                Provider.of<_MenuModel>(context, listen: false).backgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black38,
                blurRadius: 10,
                spreadRadius: -5,
              ),
            ]),
        child: child,
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length,
          (index) => _PinterestMenuButton(index, menuItems[index])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado == index) ? 35.0 : 25.0,
          color: (itemSeleccionado == index)
              ? Provider.of<_MenuModel>(context, listen: false).activeColor
              : Provider.of<_MenuModel>(context, listen: false).inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;
  Color _backgroundColor = Colors.white;

  Color get backgroundColor => this._backgroundColor;

  set backgroundColor(Color value) {
    _backgroundColor = value;
  }

  Color get activeColor => this._activeColor;

  set activeColor(Color value) {
    this._activeColor = value;
  }

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado(int value) {
    this._itemSeleccionado = value;
    notifyListeners();
  }

  Color get inactiveColor => this._inactiveColor;

  set inactiveColor(Color value) {
    this._inactiveColor = value;
  }
}
