// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import '../utils/space_flight_blog.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailBlogs extends StatefulWidget {
  const DetailBlogs({Key? key, required this.flightBlog}) : super(key: key);

  final FlightBlog flightBlog;

  @override
  State<DetailBlogs> createState() => _DetailBlogsState();
}

class _DetailBlogsState extends State<DetailBlogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 350,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    widget.flightBlog.imageUrl!,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            widget.flightBlog.title!,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            widget.flightBlog.summary!,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            widget.flightBlog.publishedAt!,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            widget.flightBlog.newsSite!,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            widget.flightBlog.url!,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchInBrowser('${widget.flightBlog.url}');
        },
        backgroundColor: Colors.lime,
        child: const Icon(Icons.open_in_browser),
      ),
    );
  }

  Future<void> _launchInBrowser(String url) async {
    final Uri _url = Uri.parse(url);
    try {
      await launchUrl(Uri.parse(_url.toString()));
    } catch (e) {
      throw Exception('Failed to open link: $_url :(');
    }
  }
}
