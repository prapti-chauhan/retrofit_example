// ignore_for_file: sized_box_for_whitespace

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_example/repository/api/api_client.dart';
import 'package:retrofit_example/repository/model/post.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Retrofit Example"),
        ),
        body: fetch(context),
      ),
    );
  }

  // build list view & manage states
  FutureBuilder<List<Post>> fetch(BuildContext context) {
    final client = ApiClient(Dio(BaseOptions(contentType: 'application/json')));
    return FutureBuilder<List<Post>>(
      future: client.getPosts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<Post>? posts = snapshot.data;
          return ListView.builder(
            itemCount: posts!.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                child: Column(
                  children: [
                    Text('userId: ${posts[index].userId}'),
                    Text('id: ${posts[index].id}'),
                    Text('title: ${posts[index].title}'),
                    Text(
                      '${posts[index].completed}',
                      style: TextStyle(color: Colors.white,
                          backgroundColor: posts[index].completed
                              ? Colors.green
                              : Colors.red),

                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
