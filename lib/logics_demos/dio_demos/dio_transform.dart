
/*
pub dio_flutter_transformer
A dio transformer especially for flutter, 
by which the json decoding will be in background with [compute] function.
在后台运行，避免了UI顿卡，但是耗时。

import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';



var dio=Dio();
dio.transformer = FlutterTransformer(); // replace dio default transformer
dio.get(...);


*/

/*
转换器Transformer 用于对请求数据和响应数据进行编解码处理。
Dio实现了一个默认转换器DefaultTransformer作为默认的 Transformer. 
如果你想对请求/响应数据进行自定义编解码处理，可以提供自定义转换器，通过 dio.transformer设置


请求转换器 Transformer.transformRequest(...) 
只会被用于 'PUT'、 'POST'、 'PATCH'方法，
因为只有这些方法才可以携带请求体(request body)。
但是响应转换器 Transformer.transformResponse() 
会被用于所有请求方法的返回数据。


如果你在开发Flutter应用
，强烈建议json的解码通过compute方法在后台进行，
这样可以避免在解析复杂json时导致的UI卡顿。
实际测试，发现通过compute在后台解码json耗时比直接解码慢很多，建议开发者仔细评估。

// 必须是顶层函数
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

void main() {
  ...
  // 自定义 jsonDecodeCallback
  (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
  runApp(MyApp());
}

*/