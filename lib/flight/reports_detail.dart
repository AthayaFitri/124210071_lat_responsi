// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:flutter/material.dart';
import '../utils/space_flight_report.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailReports extends StatefulWidget {
  const DetailReports({super.key, required this.flightReport});

  final FlightReport flightReport;

  @override
  State<DetailReports> createState() => _DetailReportsState();
}

class _DetailReportsState extends State<DetailReports> {
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
                    widget.flightReport.imageUrl,
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
                            widget.flightReport.title!,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            widget.flightReport.summary!,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            widget.flightReport.publishedAt!,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            widget.flightReport.newsSite!,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            widget.flightReport.url!,
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
            '${widget.flightReport.url}',
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
