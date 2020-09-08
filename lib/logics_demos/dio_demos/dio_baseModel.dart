class BaseEntity {
  int code;
  String message;
  dynamic data;

  BaseEntity({this.code, this.message, this.data});

  factory BaseEntity.fromJson(json) {
    return BaseEntity(
      code: json["code"],
      message: json["msg"],
      // data值需要经过工厂转换为我们传进来的类型
      data: json["data"],
    );
  }
}

extension BaseEntityTrieve on BaseEntity {
  List<Map<String, dynamic>> listDatas() {
    return data["list"];
  }

  Map<String, dynamic> info() {
    return data["xxx"];
  }
}
