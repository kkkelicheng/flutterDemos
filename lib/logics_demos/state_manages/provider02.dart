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
