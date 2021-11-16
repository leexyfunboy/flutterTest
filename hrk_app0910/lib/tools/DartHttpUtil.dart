
import 'dart:io';
import 'package:dio/dio.dart';

class DartHttpUtils {
  //配置dio，通过BaseOptions
  Dio _dio = Dio(BaseOptions(
      baseUrl: "http://262tf89717.zicp.vip/HRK_server0729",
      connectTimeout: 5000,
      receiveTimeout: 5000));

  //dio的GET请求
  getDio() async {
    var url = "/path1?name=abc&pwd=123";
    _dio.get(url).then((Response response) {
      if (response.statusCode == 200) {
        print(response.data.toString());
      }
    });
  }

  getUriDio() async {
    var url = "/path1?name=abc&pwd=123";
    _dio.getUri(Uri.parse(url)).then((Response response) {
      if (response.statusCode == 200) {
        print(response.data.toString());
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

//dio的GET请求，通过queryParameters配置传递参数
   getParametersDio() async {
    var url = "/login";
    await _dio.get(url, queryParameters: {"userid": '李昕煜', "userpassword": '123456'}).then(
            (Response response) {
          if (response.statusCode == 200) {
            print(response.data.toString());
          }
        }).catchError((error) {
      print(error.toString());
    });
  }

//发送POST请求，application/x-www-form-urlencoded
  /**
   * 向服务器servlet的login发送登录验证请求
   */
  Future<String> postUrlencodedDio(String userinput,String userpassword) async {
    var url = "/login";
    String res = "";
    await _dio.post(url,
        data: {"userid": userinput, "userpassword": userpassword},
        options: Options(
            contentType: "application/x-www-form-urlencoded"
          )
        ).then((Response response) {
      if (response.statusCode == 200) {
        res = response.data.toString();
        print("statuscode::: "+response.statusCode.toString());
        print("data::: "+response.data.toString());
      }
    }).catchError((error) {
      print(error.toString());
    });
    return res;
  }

  /**
   * 获取登录用户的User对象
   */
  Future<String> search_Userinfo(String userinput) async {
    var url = "/userinfo";
    String res = "";
    await _dio.post(url,
        data: {"userid": userinput},
        options: Options(
            contentType: "application/x-www-form-urlencoded"
        )
    ).then((Response response) {
      if (response.statusCode == 200) {
        res = response.data.toString();
        print("statuscode::: "+response.statusCode.toString());
        print("data::: "+response.data.toString());
      }
    }).catchError((error) {
      print(error.toString());
    });
    return res;
  }

  // //发送POST请求，application/json
  // postJsonDio() async {
  //   var url = "/path3";
  //   _dio
  //       .post(url,
  //       data: {"name": 'value1', "pwd": 123},
  //       options: Options(contentType: ContentType.json))
  //       .then((Response response) {
  //     if (response.statusCode == 200) {
  //       print(response.data.toString());
  //     }
  //   }).catchError((error) {
  //     print(error.toString());
  //   });
  // }
  //
  // // 发送POST请求，multipart/form-data
  // postFormDataDio() async {
  //   var url = "/path4";
  //   FormData _formData = FormData.from({
  //     "name": "value1",
  //     "pwd": 123,
  //   });
  //   _dio.post(url, data: _formData).then((Response response) {
  //     if (response.statusCode == 200) {
  //       print(response.data.toString());
  //     }
  //   }).catchError((error) {
  //     print(error.toString());
  //   });
  // }
  //
  // // 发送POST请求，multipart/form-data，上传文件
  // postFileDio() async {
  //   var url = "/path5";
  //   FormData _formData = FormData.from({
  //     "description": "descriptiondescription",
  //     "file": UploadFileInfo(File("./example/upload.txt"), "upload.txt")
  //   });
  //   _dio.post(url, data: _formData).then((Response response) {
  //     if (response.statusCode == 200) {
  //       print(response.data.toString());
  //     }
  //   }).catchError((error) {
  //     print(error.toString());
  //   });
  // }

  //dio下载文件
  downloadFileDio() {
    var urlPath = "https://abc.com:8090/";
    var savePath = "./abc.html";
    _dio.download(urlPath, savePath).then((Response response) {
      if (response.statusCode == 200) {
        print(response.data.toString());
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

///其余的HEAD、PUT、DELETE请求用法类似，大同小异，大家可以自己试一下
///在Widget里请求成功数据后，使用setState来更新内容和状态即可
///setState(() {
///    ...
///  });
}
