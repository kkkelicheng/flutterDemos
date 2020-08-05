import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'demo_localizations.dart';

class LangProvider with ChangeNotifier {
  Locale _currentLang = Locale('zh', 'CH');

  Locale get currentLang => _currentLang;

  void changeLang(Locale locale) {
    if (locale != _currentLang) {
      _currentLang = locale;
      print("LangProvider changeLang ${locale.languageCode}");
    }
    notifyListeners();
  }
}

class LangTestPage1 extends StatefulWidget {
  @override
  _LangTestPage1State createState() => _LangTestPage1State();
}

class _LangTestPage1State extends State<LangTestPage1> {
  var flag = false;

  @override
  Widget build(BuildContext context) {
    print("LangTestPage1 build");
    return Scaffold(
      appBar: AppBar(title: Text("LangTestPage1")),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(DemoLocalizations.of(context).clickTop),
            RaisedButton(onPressed: _changeLocale, child: Text("some")),
            RaisedButton(onPressed: _showMyDatePicker, child: Text("date pick"))
          ],
        ),
      ),
    );
  }

  void _showMyDatePicker() {
    // showTimePicker(context: context, initialTime: TimeOfDay(hour: 10,minute: 10));
    showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now().subtract(new Duration(days: 30)), // 减 30 天
      lastDate: new DateTime.now().add(new Duration(days: 30)), // 加 30 天
    ).then((DateTime val) {
      print(val); // 2018-07-12 00:00:00.000
    }).catchError((err) {
      print(err);
    });
  }

  void _changeLocale() {
    var langProvider = context.read<LangProvider>();
    if (flag) {
      langProvider.changeLang(const Locale('zh', "CH"));
    } else {
      langProvider.changeLang(const Locale('en', "US"));
    }
    flag = !flag;
  }

  ///
  ///主要的方法是下面的，使用Localizations 这个Widget
  ///
  // @override
  // Widget build(BuildContext context) {
  //   return new Localizations.override(
  //     context: context,
  //     locale: _locale,
  //     child: widget.child,
  //   );
  // }

}
