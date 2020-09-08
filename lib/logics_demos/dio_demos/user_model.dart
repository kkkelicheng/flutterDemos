class User {
  factory User() => _getInstance();
  static User _instance;

  //私有化命名构造函数
  User._config() {
    //do something...
  }

  static User _getInstance() {
    if (_instance == null) {
      _instance = User._config();
    }
    return _instance;
  }

  String token = "";
}
