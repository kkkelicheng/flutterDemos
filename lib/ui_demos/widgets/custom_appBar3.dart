import 'package:flutter/material.dart';

class NormalSearchBar extends StatefulWidget implements PreferredSizeWidget {
  final bool showLeft;
  final void Function() leftAction;
  final bool showRight;
  final void Function() rightAction;
  final bool activeInputTap;
  final void Function() inputTapAction;
  final Widget rightWidgets;

  NormalSearchBar(
      {Key key,
      this.showLeft = true,
      this.showRight = false,
      this.leftAction,
      this.rightAction,
      this.activeInputTap = false,
      this.inputTapAction,
      this.rightWidgets})
      : super(key: key);

  @override
  _NormalSearchBarState createState() => _NormalSearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _NormalSearchBarState extends State<NormalSearchBar> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          top: true,
          child: Container(
            color: Colors.orange,
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  widget.showLeft ? leftBackWidget() : Container(),
                  Expanded(child: centerSearchInput()),
                  widget.showRight ? rightFunctionWidgets() : Container()
                ],
              ),
            ),
          )),
    );
  }

  Widget leftBackWidget() {
    return GestureDetector(
      onTap: onLeftAction,
      child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        SizedBox(width: 12),
        Container(width: 24, height: 24, color: Colors.black)
      ]),
    );
  }

  void onLeftAction() {
    print("onLeftAction");
    if (widget.leftAction != null) {
      widget.leftAction();
    } else if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  Widget rightFunctionWidgets() {
    if (widget.rightWidgets != null) {
      return widget.rightWidgets;
    }
    return GestureDetector(
      onTap: rightAction,
      child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Container(
          width: 24,
          height: 24,
          color: Colors.blue,
        ),
        SizedBox(width: 12)
      ]),
    );
  }

  void rightAction() {
    print("onRightAction");
    if (widget.rightAction != null) {
      widget.rightAction();
    } else {}
  }

  void centerAction() {
    print("centerAction");
    if (widget.activeInputTap && widget.inputTapAction != null) {
      widget.inputTapAction();
    }
  }

  Widget centerSearchInput() {
    return GestureDetector(
      onTap: centerAction,
      child:
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
        SizedBox(
          width: 12,
        ),
        Expanded(
            child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              height: 28,
              color: Colors.grey,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(width: 24, height: 24, color: Colors.red),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(border: InputBorder.none),
                      enabled: !widget.activeInputTap,
                    ),
                  )
                ],
              )),
        )),
        SizedBox(
          width: 12,
        )
      ]),
    );
  }
}

class NormalSearchBarPage extends StatefulWidget {
  @override
  _NormalSearchBarPageState createState() => _NormalSearchBarPageState();
}

class _NormalSearchBarPageState extends State<NormalSearchBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalSearchBar(
        showRight: true,
        activeInputTap: false,
      ),
      body: Container(
        color: Colors.green,
      ),
    );
  }
}
