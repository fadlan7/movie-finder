import 'package:flutter/material.dart';
import 'package:movie_finder/components/bookmark_button.dart';
import 'package:movie_finder/components/notfound_widget.dart';
import 'package:movie_finder/model/movie_data.dart';
import 'package:movie_finder/screens/detail_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  List<MovieData> _filteredMovieLists = movieDataList;

  @override
  void initState() {
    _textEditingController.addListener(() {
      filterMovies();
    });
    super.initState();
  }

  void filterMovies() {
    String q = _textEditingController.text.toLowerCase();
    setState(() {
      _filteredMovieLists = movieDataList.where((movie) {
        return movie.title.toLowerCase().contains(q);
      }).toList();
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Finder'),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SearchForm(
                  textEditingController: _textEditingController,
                ))),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 630) {
            return Column(
              children: <Widget>[
                Expanded(
                    child: SizedBox(
                  child: MovieList(filteredMovies: _filteredMovieLists),
                ))
              ],
            );
          } else if (constraints.maxWidth <= 780) {
            return MovieListWebView(
                filteredMovies: _filteredMovieLists,
                gridCount: 2,
                aspectRatio: 0.90);
          } else if (constraints.maxWidth <= 950) {
            return MovieListWebView(
                filteredMovies: _filteredMovieLists,
                gridCount: 3,
                aspectRatio: 0.80);
          } else if (constraints.maxWidth <= 1265) {
            return MovieListWebView(
                filteredMovies: _filteredMovieLists,
                gridCount: 4,
                aspectRatio: 0.75);
          } else {
            return MovieListWebView(
                filteredMovies: _filteredMovieLists,
                gridCount: 5,
                aspectRatio: 0.75);
          }
        },
      ),
    );
  }
}

class SearchForm extends StatelessWidget {
  final TextEditingController textEditingController;

  const SearchForm({super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10.0),
          child: TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a title',
                prefixIcon: Icon(Icons.search_outlined)),
          ),
        ),
      ],
    );
  }
}

class MovieList extends StatelessWidget {
  final List<MovieData> filteredMovies;

  const MovieList({super.key, required this.filteredMovies});

  @override
  Widget build(BuildContext context) {
    if (filteredMovies.isEmpty) {
      return const NotFoundWidget();
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        final MovieData movie = filteredMovies[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPage(movie: movie);
            }));
          },
          child: Card(
            margin: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: AspectRatio(
                    aspectRatio: 2 / 1,
                    child: Image.asset(
                      movie.imageAsset,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_pin),
                              Text(movie.country,
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const BookmarkButton()
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                              child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                            child: Text(movie.title,
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                softWrap: false,
                                style: const TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold)),
                          ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.calendar_today),
                              Text(movie.releaseDate,
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.star),
                                  Text(movie.rating)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: filteredMovies.length,
    );
  }
}

class MovieListWebView extends StatelessWidget {
  final int gridCount;
  final double aspectRatio;
  final List<MovieData> filteredMovies;

  const MovieListWebView(
      {super.key,
      required this.filteredMovies,
      required this.gridCount,
      required this.aspectRatio});

  @override
  Widget build(BuildContext context) {
    if (filteredMovies.isEmpty) {
      return const NotFoundWidget();
    }
    return GridView.count(
      crossAxisCount: gridCount,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: aspectRatio,
      children: filteredMovies.map((movie) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPage(movie: movie);
            }));
          },
          child: Card(
            margin: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: AspectRatio(
                    aspectRatio: 2 / 1,
                    child: Image.asset(
                      movie.imageAsset,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_pin),
                              Text(movie.country,
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const BookmarkButton()
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                              child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                            child: Text(movie.title,
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                softWrap: false,
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ))
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today),
                          Text(movie.releaseDate,
                              style: const TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.star),
                                Text(movie.rating)
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}