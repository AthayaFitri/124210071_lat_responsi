// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../api/api_source.dart';
import '../utils/space_flight_blog.dart';
import '../flight/blogs_detail.dart';

class BlogsFlight extends StatefulWidget {
  const BlogsFlight({super.key});

  @override
  State<BlogsFlight> createState() => _BlogsFlightState();
}

class _BlogsFlightState extends State<BlogsFlight> {
  late Future<List<FlightBlog>> futureBlogs;

  @override
  void initState() {
    super.initState();
    futureBlogs = ApiSource().getBlogs();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'SPACE FLIGHT BLOGS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder<List<FlightBlog>>(
                  future: futureBlogs,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 5,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 5,
                              child: InkWell(
                                onTap: () {
                                  //detail blogs
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DetailBlogs(
                                        flightBlog: snapshot.data![index]);
                                  }));
                                },
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 120,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            bottomLeft: Radius.circular(12),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              snapshot.data![index].imageUrl!,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data![index].title ??
                                                    'No Title',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Expanded(
                                                child: Text(
                                                  snapshot
                                                      .data![index].summary!,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey[600]!,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.lime,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
