import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviechitchat/models/Movie.dart';
import 'package:moviechitchat/screens/moviedetails/moviedetailswidget/CustomLoadingSpinKitRing.dart';
import 'package:moviechitchat/utils/Constants.dart';
import 'package:moviechitchat/utils/StarCalculator.dart' as starCalculator;

class MovieDetailScreen extends StatefulWidget {

  final Movie movie;

  MovieDetailScreen(this.movie);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();

}

class _MovieDetailScreenState extends State<MovieDetailScreen> {

  List<Widget>? stars;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    () async {
      List<Widget> temp2 = starCalculator.getStars(rating: double.parse("${widget.movie.rating}"), starSize: 15);
      setState(() {
        stars = temp2;
      });
    }();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (stars == null)
          ? CustomLoadingSpinKitRing(loadingColor: Colors.blueAccent)
          : SafeArea(
            child: CustomScrollView(
        slivers: [
            SliverAppBar(
              shadowColor: Colors.transparent.withOpacity(0.1),
              elevation: 0,
              backgroundColor: Color(0xFF101010),
              leading: Padding(
                padding: EdgeInsets.only(left: 3),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              automaticallyImplyLeading: false,
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 22,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 3),
                  child: IconButton(
                    onPressed: () {
                      setState(() {

                      });
                    },
                    icon: Icon((isFavorite)
                        ? Icons.bookmark_sharp
                        : Icons.bookmark_border_sharp),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Overview"),
                background: SafeArea(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    placeholder: (context, url) => SafeArea(
                      child: Container(
                        height: 22,
                        child: CustomLoadingSpinKitRing(
                            loadingColor: Colors.blueAccent),
                      ),
                    ),
                    imageUrl: "https://cdn.wallpapersafari.com/38/2/1APX3s.jpg",
                    errorWidget: (context, url, error) => SafeArea(
                      child: Container(
                        height: 22,
                        child: CustomLoadingSpinKitRing(
                            loadingColor: Colors.blueAccent),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          child: Wrap(
                            children: [
                              Center(
                                child: Container(
                                  height: 300,
                                  width: MediaQuery.of(context).size.width,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => SafeArea(
                                      child: Container(
                                        height: 22,
                                        child: CustomLoadingSpinKitRing(
                                            loadingColor: Colors.blueAccent),
                                      ),
                                    ),
                                    imageUrl: Constants.imgBaseUrl + widget.movie.img!,
                                    errorWidget: (context, url, error) => SafeArea(
                                      child: Container(
                                        height: 22,
                                        child: CustomLoadingSpinKitRing(
                                            loadingColor: Colors.blueAccent),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Wrap(
                            children: [
                              Row(
                                children: [
                                  Text("Moive: ", style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black
                                  ),
                                  ),
                                  Text(
                                    "${widget.movie.title} ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text("Rating: "),
                            ),
                            Text("${widget.movie.rating}"),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(children: stars!),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  if (widget.movie.overview != "")
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3, vertical: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  right: 20,
                                  left: 20,
                                  top: 20,
                                  bottom: 0),
                              child: Container(
                                child: Text("Storyline",
                                    style: TextStyle(fontSize: 18)),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: 20,
                                    left: 20,
                                    top: 10,
                                    bottom: 20),
                                child: Text(
                                  widget.movie.overview!,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            )
        ],
      ),
          ),
    );
  }
}


