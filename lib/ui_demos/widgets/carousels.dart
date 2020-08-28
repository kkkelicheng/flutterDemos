import 'dart:async';

import 'package:flutter/material.dart';

class NewsCarousel extends StatefulWidget {
  final List<String> datas;
  final void Function(int) indexChange;
  final void Function(int) indexTaped;
  final Axis direction;
  final Widget Function(BuildContext, int) buildItem;
  final bool dragable;
  final bool autoRun;
  NewsCarousel(
      {@required this.datas,
      this.indexChange,
      this.indexTaped,
      this.buildItem,
      this.direction = Axis.horizontal,
      this.dragable = true,
      this.autoRun = true,
      Key key})
      : assert(datas != null && datas.length != 0),
        super(key: key);

  @override
  _NewsCarouselState createState() => _NewsCarouselState();
}

class _NewsCarouselState extends State<NewsCarousel> {
  var pageIndex = 1;
  PageController _pageController;
  Timer _timer;
  bool timerTriggerValid = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: pageIndex, keepPage: true);
    if (widget.datas.length > 1) {
      startTimer();
    }
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  void startTimer() {
    timerTriggerValid = true;
    if (_timer == null && widget.autoRun) {
      const period = const Duration(seconds: 2);
      _timer = Timer.periodic(period, (timer) {
        nextPage();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    cancelTimer();
  }

  int dataIndex(int showIndex) {
    if (widget.datas.length == 1) {
      return 0;
    }
    if (showIndex == 0) {
      return widget.datas.length - 1;
    } else if (showIndex == widget.datas.length + 1) {
      return 0;
    }
    return showIndex - 1;
  }

  void nextPage() {
    if (!timerTriggerValid) {
      return;
    }
    pageIndex += 1;
    var completed = _pageController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    completed.whenComplete(() {});
  }

  void resetToFirst() {
    pageIndex = 1;
    _pageController.jumpToPage(1);
  }

  void resetToLast() {
    pageIndex = widget.datas.length;
    _pageController.jumpToPage(widget.datas.length);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [buildPager()]);
  }

  Widget buildPager() {
    return NotificationListener<ScrollNotification>(
        onNotification: _onNotification,
        child: PageView.builder(
          scrollDirection: widget.direction,
          physics: widget.dragable ? null : NeverScrollableScrollPhysics(),
          itemCount: widget.datas.length + 2,
          controller: _pageController,
          itemBuilder: buildItem,
          onPageChanged: onPageViewIndexChange,
        ));
  }

  void onPageViewIndexChange(int index) {
    print("onPageViewIndexChange");
    pageIndex = index;
    if (widget.indexChange != null) {
      widget.indexChange(dataIndex(index));
    }
  }

  bool _onNotification(ScrollNotification noti) {
    if (noti is ScrollEndNotification && noti.depth == 0) {
      print("ScrollEndNotification");
      checkShouldReset();
      startTimer();
    } else if (noti is ScrollStartNotification && noti.depth == 0) {
      if (noti.dragDetails != null) {
        timerTriggerValid = false;
        cancelTimer();
      }
    }

    return true;
  }

  void checkShouldReset() {
    print("checkShouldReset");
    if (pageIndex == widget.datas.length + 1) {
      resetToFirst();
    } else if (pageIndex == 0) {
      print("pageIndex == 0");
      resetToLast();
    }
  }

  Widget buildItem(BuildContext ctx, int index) {
    var realIndex = dataIndex(index);
    Widget result;
    if (widget.buildItem != null) {
      result = widget.buildItem(ctx, realIndex);
    } else {
      var data = widget.datas[realIndex];
      result = Center(child: Text(data));
    }
    return GestureDetector(
      child: result,
      onTap: () {
        indexTaped(realIndex);
      },
    );
  }

  void indexTaped(int realIndex) {
    if (widget.indexTaped != null) {
      widget.indexTaped(realIndex);
    }
  }
}

class NewsCarouselPage extends StatefulWidget {
  @override
  _NewsCarouselPageState createState() => _NewsCarouselPageState();
}

class _NewsCarouselPageState extends State<NewsCarouselPage> {
  final List<String> _datas = ["0", "1111111", "2222", "3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新闻标题轮播"),
      ),
      body: Container(
        child: Center(
          child: Container(
              color: Colors.red,
              width: 300,
              height: 40,
              child: NewsCarousel(
                datas: _datas,
                indexTaped: _newsTapedIndex,
                autoRun: true,
              )),
        ),
      ),
    );
  }

  void _newsTapedIndex(int index) {
    print("index:$index , content:${_datas[index]}");
  }
}
