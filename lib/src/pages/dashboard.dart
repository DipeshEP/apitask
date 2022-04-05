import 'package:flutter/material.dart';
import 'package:apitask/src/pages/apihelper.dart';
import 'package:apitask/src/pages/apiresponse.dart';
import 'package:apitask/src/pages/detailed.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Articles> result = [];
  getData() async {
    final response =
    await ApiHelper().getRequest("NewsAPI/everything/cnn.json");
    result = response.articles!;
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Dashboard",
            style: TextStyle(
                fontStyle: FontStyle.italic, fontSize: 30, color: Colors.black),
          ),
        ),
        body: ListView.builder(
            itemCount: result.length,
            itemBuilder: (context, int index) {
              return ListTile(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (
                              context) => const DetailedPage(),
                          settings: RouteSettings(
                            arguments: result[index],
                          )));
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(result[index].urlToImage ?? ''),
                ),
                title: Text(result[index].title ?? ''),
                subtitle: Text(result[index].description?? ''),
              );
            }));
  }
}