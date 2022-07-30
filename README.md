A sdk tool for developers use functions of aliyun OCR text recognition 
in the dart language for flutter framework.

## Features
This package supports users skip the process of generating the signature to use
the aliyun OCR text recognition api with HTTP by uploading the image's url in web.

> [aliyun_ocr_homepage](https://help.aliyun.com/product/252763.html)
> [aliyun signature page](https://help.aliyun.com/document_detail/294534.html)

**NOTES:**  In some reason, I can not upload my image with the HTTP ERROR 503.
            After consulting the engineers from aliyun,they tell me to debug
            other framework sdk such as JAVA to find some way and refuse to
            show me how to put my image binary file into the http body.

## Getting started

This package needs user have the aliyun **accessKeyId** and **accessKeySecret**.
Your should login in the website of the aliyun and follow this approach:

> User's image -> AccessKey Management 

## Usage

```dart
  var aliYunSdk = aliYunOcRClient();
  aliYunSdk.accessKeyId = "YouraccessKeyId";
  aliYunSdk.accessKeySecret = "YouraccessKeySecret";
  aliYunSdk.imgUrl ="https://img.alicdn.com/tfs/TB1Wo7eXAvoK1RjSZFDXXXY3pXa-2512-3509.jpg";

  aliYunSdk.queries['AccessKeyId'] = aliYunSdk.accessKeyId;
  aliYunSdk.queries['Url'] = aliYunSdk.imgUrl;
  /// Generate Signature and update the queries
  aliYunSdk.generateSignature(
    accessKeySecret: aliYunSdk.accessKeySecret,
    queries: aliYunSdk.queries,
    method: "POST",);
```

## Additional information

Some issues can be submitted into [My Homepage](https://github.com/legendsonldh/aliyun_ocr_sdk)
