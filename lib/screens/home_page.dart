import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_finder/model/movie_data.dart';

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
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: <Widget>[
              SearchForm(
                textEditingController: _textEditingController,
              ),
              Expanded(
                  child: SizedBox(
                child: MovieList(filteredMovies: _filteredMovieLists),
              ))
            ],
          );
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
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/undraw_no_data.svg',
            height: 150,
            width: 150,
          ),
          const Text('No movies found')
        ],
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        final MovieData movie = filteredMovies[index];
        return InkWell(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return DetailScreen(movie: movie);
            // }));
          },
          child: Card(
            elevation: 2,
            margin: const EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(movie.imageAsset),
                      ),
                    ),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 15.0),
                    child: Column(
                      children: [
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
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 0.0, 0.0, 20.0),
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
                              elevation: 2,
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
                    )),
              ],
            ),
          ),
        );
      },
      itemCount: filteredMovies.length,
    );
  }
}

class BookmarkButton extends StatefulWidget {
  const BookmarkButton({super.key});

  @override
  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isBookmark = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isBookmark ? Icons.bookmark : Icons.bookmark_outline,
      ),
      onPressed: () {
        setState(() {
          isBookmark = !isBookmark;
        });
      },
    );
  }
}
