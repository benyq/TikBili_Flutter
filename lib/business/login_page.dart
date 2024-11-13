import 'package:TikBili/business/app_routes.dart';
import 'package:TikBili/business/data/user_storage.dart';
import 'package:TikBili/http/bilibili/bilibili_server.dart';
import 'package:TikBili/http/dio_client.dart';
import 'package:TikBili/utils/log.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String _websiteUrl = 'https://www.bilibili.com/';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late WebViewController _controller;
  final String userAgent =
      "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.55";
  bool _isLoading = true;
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setUserAgent(userAgent)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            setState(() {
              _progress = progress / 100;
            });
          },
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onHttpError: (HttpResponseError error) {
            Log.e(error.toString());
          },
          onWebResourceError: (WebResourceError error) {
            Log.e(error.toString());
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('bilibili://')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(_websiteUrl));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, result) async {
        if (didPop) {
          return;
        }
        if (await _controller.canGoBack()) {
          await _controller.goBack();
          return;
        } else {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Column(
          children: [
            _isLoading
                ? LinearProgressIndicator(value: _progress)
                : Container(),
            Expanded(child: WebViewWidget(controller: _controller))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _checkLoginState(context);
          },
          child: const Icon(Icons.check),
        ),
      ),
    );
  }

  void _checkLoginState(BuildContext context) {
    SmartDialog.showLoading();
    var startTime = DateTime.now().millisecondsSinceEpoch;
    final cookieManager = WebviewCookieManager();
    _controller.runJavaScriptReturningResult('document.cookie').then((v){
      var cookie = v.toString();
      Log.e('cookie: $cookie');
    });
    cookieManager.getCookies(_websiteUrl).then((gotCookies) {
      return gotCookies.map((v) => "${v.name}=${v.value}").join(';');
    }).then((cookie) {
      UserStorage.updateLoginState(cookie);
      var server = BiliBiliServer(DioClient().dio);
      return server.getAccountInfo();
    }).then((response) {
      if (response.isSuccess) {
        if (mounted) {
          SmartDialog.dismiss();
          Navigator.pushNamed(context, AppRoutes.homePage);
        }
      } else {
        // 清除cookie
        UserStorage.updateLoginState('');
        Log.e('登陆失败');
      }
    }).catchError((error) {
      Navigator.pop(context);
      Log.e(error.toString());
    }).whenComplete(() {
      var endTime = DateTime.now().millisecondsSinceEpoch;
      var costTime = endTime - startTime;
      if (costTime < 1000) {
        Future.delayed(Duration(milliseconds: costTime)).then((value) {
          SmartDialog.dismiss();
        });
      }else {
        SmartDialog.dismiss();
      }
    });
  }

}
