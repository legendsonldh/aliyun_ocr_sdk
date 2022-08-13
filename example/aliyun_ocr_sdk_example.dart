import 'dart:io';
import 'package:aliyun_ocr_sdk/aliyun_ocr_sdk.dart';
import 'package:aliyun_ocr_sdk/src/aliyun_ocr_sdk_base.dart';
import 'package:dio/dio.dart';

void main() async {

  /// 1. Old Method OCR
  var aliYunSdkOld = aliYunOcrClientOld();

  /// 1.1 Input Your appcode
  aliYunSdkOld.appCode = "YourappCode";
  aliYunSdkOld.generateHeaders();

  print(aliYunSdkOld.headers);

  /// 1.2 Input ImgUrl
  aliYunSdkOld.imgUrl = "https://img.alicdn.com/tfs/TB1Wo7eXAvoK1RjSZFDXXXY3pXa-2512-3509.jpg";
  aliYunSdkOld.generateBodyWithImg();

  /// 1.2 Or Input Img binary
  final value = File("bin/1.png");
  var bytes =await value.readAsBytes();
  aliYunSdkOld.imgBinary = bytes.buffer.asUint8List();
  aliYunSdkOld.generateBodyWithImg();

  // 1.3 Use the post method
  var dio = Dio();
  Response response;
  try {
    response =
    await dio.post(
      aliYunSdkOld.baseUrl,
      data:aliYunSdkOld.body,
      options: Options(
        headers: aliYunSdkOld.headers,
      )
    );
    print(response.statusCode);
    print(response.data);
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


  /// 2. New Method OCR
  var aliYunSdkNew = aliYunOcrClientNew();

  /// 2.1 Input Your accessKey
  aliYunSdkNew.accessKeyId = "YouraccessKeyId";
  aliYunSdkNew.accessKeySecret = "YouraccessKeySecret";

  /// 2.2 Input imgUrl
  aliYunSdkNew.imgUrl =
  "https://img.alicdn.com/tfs/TB1Wo7eXAvoK1RjSZFDXXXY3pXa-2512-3509.jpg";

  aliYunSdkNew.queries['AccessKeyId'] = aliYunSdkNew.accessKeyId;
  aliYunSdkNew.queries['Url'] = aliYunSdkNew.imgUrl;

  /// 2.3 Generate Signature and update the queries
  aliYunSdkNew.generateSignature(
      accessKeySecret: aliYunSdkNew.accessKeySecret,
      queries: aliYunSdkNew.queries,
      method: "POST",
  );

  print(aliYunSdkNew.queries);

  // 2.4 Use the post method
  var dio1 = Dio();
  Response response1;
  try {
    response1 =
    await dio1.post(aliYunSdkNew.baseUrl, queryParameters: aliYunSdkNew.queries);
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
