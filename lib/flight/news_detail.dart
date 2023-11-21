// ignore_for_file: file_names, unnecessary_string_interpolations, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:flutter/material.dart';
import '../utils/space_flight_news.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailNews extends StatefulWidget {
  const DetailNews({Key? key, required this.flightNew}) : super(key: key);

  final FlightNew flightNew;

  @override
  State<DetailNews> createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
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
                    widget.flightNew.imageUrl!,
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
                            widget.flightNew.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            widget.flightNew.summary!,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            widget.flightNew.publishedAt!,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            widget.flightNew.newsSite!,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            widget.flightNew.url!,
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
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchInBrowser(
            '${widget.flightNew.url ?? 'https://www.google.com/'}',
          );
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
      print('Error launching URL: $_url');
      print('Error details: $e');
      throw Exception('Failed to open link: $_url :(');
    }
  }
}
