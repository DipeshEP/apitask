import 'package:flutter/material.dart';
import 'package:apitask/src/pages/apiresponse.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({Key? key}) : super(key: key);

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  @override
  Widget build(BuildContext context) {
    final res = ModalRoute.of(context)!.settings.arguments as Articles;

    return Scaffold(
        appBar: AppBar(),
        body: ListView(children: [
          Image(image: NetworkImage(res.urlToImage ?? '')),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  res.title ?? '',
                  style: const TextStyle(fontSize: 22.5, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 180),
                child: Text(
                  res.publishedAt ?? '',
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0, left: 180),
                child: Text(
                  res.author ?? '',
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 14),
                child: Text(
                  res.description ?? '',
                  style: const TextStyle(fontSize: 18),
                ),
              )
            ],
          )
        ]));
  }
}