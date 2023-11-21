// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'blogs_page.dart';
import 'reports_page.dart';
import 'package:lottie/lottie.dart';

import 'news_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATHAYA BERITA',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildCard(
                title: 'SPACE FLIGHT NEWS',
                description:
                    'Get an overview of the latest Spaceflight news, from various sources! Easily link your users to the right websites.',
                gifUrl:
                    'https://lottie.host/dc5a6a66-fa97-48b0-bce7-4357e7db81a9/geEokOApEy.json',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const NewsFlight();
                    },
                  ));
                },
              ),
              buildCard(
                title: 'SPACE FLIGHT BLOGS',
                description:
                    'Blogs often provide a more detailed overview of launches and missions. A must-have for the serious spaceflight enthusiast.',
                gifUrl:
                    'https://lottie.host/a2a5b63d-f28b-49b6-bf7c-64825e65a65f/BZxey0DSe4.json',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const BlogsFlight();
                    },
                  ));
                },
              ),
              buildCard(
                title: 'SPACE FLIGHT REPORTS',
                description:
                    'Space stations and other missions often publish their data. With SNAPI, you can include it in your app as well!',
                gifUrl:
                    'https://lottie.host/9352a542-cc13-4098-9567-a3d24304e53b/nFjKOxpC0r.json',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const FlightReports();
                    },
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard({
    required String title,
    required String description,
    required String gifUrl,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Lottie.network(
                  gifUrl,
                  repeat: true,
                  reverse: false,
                  animate: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600]!,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
