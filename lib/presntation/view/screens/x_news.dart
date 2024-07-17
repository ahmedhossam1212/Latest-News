import 'package:flutter/material.dart';
import 'package:latest_news/presntation/view/widgets/orgnization_news.dart';

class XNews extends StatefulWidget {
  const XNews({super.key});

  @override
  State<XNews> createState() => _XNewsState();
}

class _XNewsState extends State<XNews> {
  @override
  Widget build(BuildContext context) {
    return const OrgnizationNews(
      name: "X",
    );
  }
}
