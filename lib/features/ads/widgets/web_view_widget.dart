import 'package:flutter/material.dart';
import '../../../core/widgets/custom_appBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  final String link;
  const WebPage({super.key, required this.link});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  bool isError = false;
  changeError() {
    setState(() {
      isError = true;
    });
  }

  WebViewController? controller;
  giveControllerValue() {
    try {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onWebResourceError: (WebResourceError error) {
              changeError();
            },
            onNavigationRequest: (NavigationRequest request) {
              if (request.url
                  .startsWith('https://www.youtube.com/watch?v=snxybJkFeUo')) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse(widget.link));
    } catch (error) {
      setState(() {
        isError = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    giveControllerValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarForSearch(context),
      body: isError
          ? const Center(
              child: Text('لقد حدث خطا .'),
            )
          : WebViewWidget(controller: controller!),
    );
  }
}
