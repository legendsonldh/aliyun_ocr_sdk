A sdk tool for developers use functions of aliyun OCR text recognition 
in the dart language for flutter framework.

## Features
This package supports users skip the process of generating the signature to use
the aliyun OCR text recognition api with HTTP by uploading the image's url in web.

This package supports old and new version of aliyun OCR Method, the old one is Ok
but the new one only support using the url format image but not the binary image.

> [aliyun_ocr_homepage](https://help.aliyun.com/product/252763.html)
> [aliyun signature page](https://help.aliyun.com/document_detail/294534.html)

### Old Method
It's Ok
### New Method
**NOTES:**  In some reason, I can not upload my image with the HTTP ERROR 503.
            After consulting the engineers from aliyun,they tell me to debug
            other framework sdk such as JAVA to find some way and refuse to
            show me how to put my image binary file into the http body.

## Getting started

This package needs user have the aliyun **accessKeyId** and **accessKeySecret**.
Your should login in the website of the aliyun and follow this approach:

> User's image 

> AccessKey Management 

## Usage

```dart

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
```

## Additional information

Some issues can be submitted into [My Homepage](https://github.com/legendsonldh/aliyun_ocr_sdk)

This package has been published in pub.dev website, here is the link [aliyun_ocr_sdk 1.0.0](https://pub.dev/packages/aliyun_ocr_sdk)