import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app/product/models/news.dart';
import 'package:news_app/product/utility/exceptions/custom_exception.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    CollectionReference news = FirebaseFirestore.instance.collection('news');
    // ignore: unnecessary_parenthesis
    final response = news.withConverter(fromFirestore: ((snapshot, options) {
      return News().fromFirebase(snapshot);
      // ignore: unnecessary_parenthesis
    }), toFirestore: ((value, options) {
      if (value == null) throw FirebaseCustomException('$value not null');
      return value.toJson();
    })).get();
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: response,
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<News?>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Placeholder();
            case ConnectionState.waiting:

            case ConnectionState.active:
              return const LinearProgressIndicator();
            case ConnectionState.done:
              if (snapshot.hasData) {
                final values =
                    snapshot.data!.docs.map((e) => e.data()).toList();
                return ListView.builder(
                  itemCount: values.length,
                  itemBuilder: (BuildContext contex, int index) {
                    return Card(
                      child: Column(
                        children: [
                          Image.network(
                            values[index]?.backgroundimage ?? '',
                            height: contex.dynamicHeight(0.1),
                          ),
                          Text(
                            values[index]?.title ?? '',
                            style: contex.textTheme.labelLarge,
                          )
                        ],
                      ),
                    );
                  },
                );
              } else {
                return const SizedBox();
              }
          }
        },
      ),
    );
  }
}
