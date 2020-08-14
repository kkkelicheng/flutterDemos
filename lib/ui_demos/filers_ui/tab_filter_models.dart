import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FilterDatas {
  final List<FilterTabModel> models;
  FilterDatas({this.models});

  setSelectIndex(int index) {
    if (index >= models.length) {
      return;
    }
    var indexModel = models[index];
    if (indexModel.isSelected) {
      indexModel.setSelect();
    } else {
      models.forEach((element) {
        element.reset();
      });
      indexModel.setSelect();
    }
  }
}

class FilterTabStatusModel with DiagnosticableMixin {
  int id;
  String desc;
  String imageName;
  Color titleColor;
  double fontSize;

  FilterTabStatusModel(
      {this.id,
      this.desc,
      this.imageName,
      this.titleColor = Colors.black,
      this.fontSize = 13})
      : super();

  @override
  String toStringShort() {
    return "$desc id:$id";
  }
}

class FilterTabModel {
  FilterTabStatusModel defaultStatus;
  List<FilterTabStatusModel> selectStatus;
  int _currentIndex = -1;

  FilterTabModel({this.defaultStatus, this.selectStatus});

  //触发选中
  void setSelect() {
    var willIndex = _currentIndex + 1;
    if (willIndex >= selectStatus.length) {
      willIndex = -1;
    }
    _currentIndex = willIndex;
  }

  //重置
  void reset() {
    _currentIndex = -1;
  }

  //UI接口，展示的时候就按这个来
  FilterTabStatusModel get currentShowStatus {
    if (_currentIndex < 0 || _currentIndex >= selectStatus.length) {
      return defaultStatus;
    }
    return selectStatus[_currentIndex];
  }

  bool get isSelected {
    return _currentIndex != -1;
  }

  //数据接口
  int get selectId {
    if (_currentIndex == -1 || _currentIndex >= selectStatus.length) {
      return null;
    }
    return selectStatus[_currentIndex].id;
  }
}

class FilterTabItems extends StatelessWidget {
  final FilterTabStatusModel statusModel;
  FilterTabItems(this.statusModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: <Widget>[
            Text(
              "${statusModel.desc}",
              style: TextStyle(
                  fontSize: statusModel.fontSize,
                  color: statusModel.titleColor),
            ),
            statusModel.imageName != null
                ? Image(
                    image: AssetImage("asset/images/${statusModel.imageName}"))
                : Container()
          ],
        ),
      ),
    );
  }
}
