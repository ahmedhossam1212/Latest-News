import 'package:flutter/material.dart';
import 'package:latest_news/config/routes/app_routs.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/style_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GazaWebView extends StatefulWidget {
  const GazaWebView({super.key});

  @override
  State<GazaWebView> createState() => _GazaWebViewState();
}

class _GazaWebViewState extends State<GazaWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.bbc.com/news/topics/cgv64vq5z82t'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              AppRouter.goBack(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          'Gaza',
          style: getBoldStyle(color: AppColors.black, fontSize: 20),
        ),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
