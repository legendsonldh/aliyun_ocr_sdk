import 'package:aliyun_ocr_sdk/aliyun_ocr_sdk.dart';
import 'package:dio/dio.dart';

void main() async {
  // init the class
  var aliYunSdk = aliYunOcRClient();
  aliYunSdk.accessKeyId = "YouraccessKeyId";
  aliYunSdk.accessKeySecret = "YouraccessKeySecret";
  aliYunSdk.imgUrl =
  "https://img.alicdn.com/tfs/TB1Wo7eXAvoK1RjSZFDXXXY3pXa-2512-3509.jpg";

  aliYunSdk.queries['AccessKeyId'] = aliYunSdk.accessKeyId;
  aliYunSdk.queries['Url'] = aliYunSdk.imgUrl;

  /// Generate Signature and update the queries
  aliYunSdk.generateSignature(
      accessKeySecret: aliYunSdk.accessKeySecret,
      queries: aliYunSdk.queries,
      method: "POST",
  );

  print(aliYunSdk.queries);

  // Use the post method
  var dio = Dio();
  Response response1;
  try {
    response1 =
    await dio.post(aliYunSdk.baseUrl, queryParameters: aliYunSdk.queries);
    print(response1.statusCode);
    print(response1.data);
  } on DioError catch (e) {
    final response = e.response;
    if (response != null) {
      print(response.data);
      print(response.headers);
      print(response.requestOptions);
    } else {
      /// Something happened in setting up or sending the request that triggered an Error
      print(e.requestOptions);
      print(e.message);
    }
  }

}
