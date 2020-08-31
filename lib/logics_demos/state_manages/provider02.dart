import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider with ChangeNotifier {
  ///
  ///当前省略了其他的主题数据
  ///
  ///
  MaterialColor _primarySwitch;

  MaterialColor get primarySwitch => _primarySwitch;

  set primarySwitch(MaterialColor color) {
    if (color != _primarySwitch) {
      _primarySwitch = color;
      notifyListeners();
    }
  }
}

//有一个项目要求换肤
//颜色是从后台传入的
Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
  return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
}

extension HexColor on Color {
  static Color fromHex(String hex) {
    return hexToColor(hex);
  }
}

/*
static const MaterialColor pink = MaterialColor(
    _pinkPrimaryValue,
    <int, Color>{
       50: Color(0xFFFCE4EC),
      100: Color(0xFFF8BBD0),
      200: Color(0xFFF48FB1),
      300: Color(0xFFF06292),
      400: Color(0xFFEC407A),
      500: Color(_pinkPrimaryValue),
      600: Color(0xFFD81B60),
      700: Color(0xFFC2185B),
      800: Color(0xFFAD1457),
      900: Color(0xFF880E4F),
    },
  );
  static const int _pinkPrimaryValue = 0xFFE91E63;
  */

class MyThemeColor {
  String primaryColorValue = "#D32F2F";
  String backgroundColorValue = "#F4F5F7";

  static const Color c333333 = Color(0xFF333333);
  static const Color c999999 = Color(0xFF999999); //subtitle的颜色，搜索输入框颜色
  static const Color ccccccc = Color(0xFFCCCCCC); //比c99999更浅作为了输入密码的占位颜色

  static TextStyle get ts_24FBC3 {
    return TextStyle(fontSize: 24, color: c333333, fontWeight: FontWeight.bold);
  }

  static TextStyle get ts_20FBC3 {
    return TextStyle(fontSize: 20, color: c333333, fontWeight: FontWeight.bold);
  }

  static TextStyle get ts_16FBC3 {
    return TextStyle(fontSize: 16, color: c333333, fontWeight: FontWeight.bold);
  }

  static TextStyle get ts_16FNC3 {
    return TextStyle(
        fontSize: 16, color: c333333, fontWeight: FontWeight.normal);
  }

  static TextStyle get ts_14FBC3 {
    return TextStyle(fontSize: 14, color: c333333, fontWeight: FontWeight.bold);
  }

  static TextStyle get ts_14FBC9 {
    return TextStyle(fontSize: 14, color: c999999, fontWeight: FontWeight.bold);
  }

  static TextStyle get ts_12FNC3 {
    return TextStyle(
        fontSize: 12, color: c333333, fontWeight: FontWeight.normal);
  }

  static TextStyle get ts_12FNC9 {
    return TextStyle(
        fontSize: 12, color: c999999, fontWeight: FontWeight.normal);
  }

  static TextStyle get ts_12FBC3 {
    return TextStyle(fontSize: 12, color: c333333, fontWeight: FontWeight.bold);
  }

  static TextStyle get ts_10FNC3 {
    return TextStyle(fontSize: 10, color: c333333, fontWeight: FontWeight.bold);
  }

  static TextStyle get ts_10FNC9 {
    return TextStyle(fontSize: 10, color: c999999, fontWeight: FontWeight.bold);
  }

  ThemeData createTheme() {
    //直观
    Color primary = Color(0xFFD32F2F);
    Color bg = Color(0xFFF4F5F7);

    return ThemeData(
      primaryColor: HexColor.fromHex(primaryColorValue),

      /// A color that contrasts with the [primaryColor], e.g. used as the
      /// remaining part of a progress bar.
      /// backgroundColor ??= isDark ? Colors.grey[700] : primarySwatch[200];
      backgroundColor: HexColor.fromHex(backgroundColorValue),

      /// The default color of the [Material] that underlies the [Scaffold]. The
      /// background color for a typical material app or a page within the app.
      ///  canvasColor ??= isDark ? Colors.grey[850] : Colors.grey[50];
      /// scaffoldBackgroundColor ??= canvasColor;
    );
  }
}

extension ThemeColorAlpha on Theme {
  static Color pColor_a5(BuildContext context) {
    return Theme.of(context).primaryColor.withAlpha((0.05 * 255).ceil());
  }

  static Color pColor_a20(BuildContext context) {
    return Theme.of(context).primaryColor.withAlpha((0.2 * 255).ceil());
  }
}

class ThemeColorChangeDemo extends StatefulWidget {
  @override
  _ThemeColorChangeDemoState createState() => _ThemeColorChangeDemoState();
}

class _ThemeColorChangeDemoState extends State<ThemeColorChangeDemo> {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<ThemeProvider>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
                onPressed: () {
                  provider.primarySwitch = Colors.pink;
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.pink,
                )),
            RaisedButton(
                onPressed: () {
                  provider.primarySwitch = Colors.orange;
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.orange,
                )),
            RaisedButton(
                onPressed: () {
                  provider.primarySwitch = Colors.green;
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                )),
          ],
        ),
      ),
    );
  }
}
