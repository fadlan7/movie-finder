class MovieData {
  String title;
  String country;
  String description;
  String category;
  String releaseDate;
  String rating;
  String imageAsset;
  List<String> imageUrls;

  MovieData({
    required this.title,
    required this.country,
    required this.description,
    required this.category,
    required this.releaseDate,
    required this.rating,
    required this.imageAsset,
    required this.imageUrls,
  });
}

var movieDataList = [
  MovieData(
    title: 'The Lord of the Rings: The Return of the King',
    country: 'United States',
    description:
        'As armies mass for a final battle that will decide the fate of the world--and powerful, ancient forces of Light and Dark compete to determine the outcome--one member of the Fellowship of the Ring is revealed as the noble heir to the throne of the Kings of Men. Yet, the sole hope for triumph over evil lies with a brave hobbit, Frodo, who, accompanied by his loyal friend Sam and the hideous, wretched Gollum, ventures deep into the very dark heart of Mordor on his seemingly impossible quest to destroy the Ring of Power.',
    category: 'Adventure, Fantasy, Action',
    releaseDate: '01/14/2004',
    rating: '94',
    imageAsset: 'assets/images/lotr.jpg',
    imageUrls: [
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/5daoHVyAAvJsusr6AowCFOasQQT.jpg',
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/vMWwOiwwQY2Q9j2MWR4OFYpACm2.jpg',
      'https://image.tmdb.org/t/p/original/pm0RiwNpSja8gR0BTWpxo5a9Bbl.jpg'
    ],
  ),
  MovieData(
    title: 'The Shawshank Redemption',
    country: 'United States',
    description:
        'Imprisoned in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.',
    category: 'Drama, Crime',
    releaseDate: '01/07/2016',
    rating: '87',
    imageAsset: 'assets/images/shawshank.png',
    imageUrls: [
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/zfbjgQE1uSd9wiPTX4VzsLi0rGG.jpg',
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/v8xVDqt8uCul3c3mgx4VpGCwxJC.jpg',
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/yM67XrFH3l0GqDbnGR0Q6UjzJoO.jpg',
    ],
  ),
  MovieData(
    title: 'Interstellar',
    country: 'United States',
    description:
        'The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage.',
    category: 'Adventure, Science Fiction',
    releaseDate: '11/06/2014',
    rating: '84',
    imageAsset: 'assets/images/interstellar.png',
    imageUrls: [
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/d9pKI0znqfl3dbUUTw59EaVilOd.jpg',
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/8sNiAPPYU14PUepFNeSNGUTiHW.jpg',
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/mPqKyZY6YnHJVXZJ0eo7VtTPWBG.jpg',
    ],
  ),
  MovieData(
    title: 'Parasite',
    country: 'South Korea',
    description:
        'All unemployed, Ki-taek\'s family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.',
    category: 'Thriller, Drama',
    releaseDate: '06/24/2019',
    rating: '85',
    imageAsset: 'assets/images/parasite.png',
    imageUrls: [
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/bERQoM81bIewmVbffRYAVnUoEqP.jpg',
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/uG3m6jBwU8jUkt0jbUOj8Vb2Y11.jpg',
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/vbC0rzdrb7Ohc2TkbEbxtOABECe.jpg',
    ],
  ),
  MovieData(
    title: 'Avengers: Endgame',
    country: 'United States',
    description:
        'After the devastating events of Avengers: Infinity War, the universe is in ruins due to the efforts of the Mad Titan, Thanos. With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos actions and restore order to the universe once and for all, no matter what consequences may be in store.',
    category: 'Science Fiction, Action',
    releaseDate: '04/24/2019',
    rating: '83',
    imageAsset: 'assets/images/avengers.png',
    imageUrls: [
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/wMFad1v8SwyVvrKXmsIkLhSxCEC.jpg',
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/xuYDe1Ntxp9OOvz4aEypxmilgvr.jpg',
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/1qjS1enn14Bey78GnF0q4xWGXCm.jpg',
    ],
  ),
  MovieData(
    title: 'Top Gun: Maverick',
    country: 'United States',
    description:
        'After more than thirty years of service as one of the Navy\’s top aviators, and dodging the advancement in rank that would ground him, Pete “Maverick” Mitchell finds himself training a detachment of TOP GUN graduates for a specialized mission the likes of which no living pilot has ever seen.',
    category: 'Action, Drama',
    releaseDate: '05/27/2022',
    rating: '82',
    imageAsset: 'assets/images/topgun.png',
    imageUrls: [
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/kBSSbN1sOiJtXjAGVZXxHJR9Kox.jpg',
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/5AcP07WJl1VZbnloLZrMVgYjR2s.jpg',
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/m1aaLpSnmq72jMu5vIbBEdyR508.jpg',
    ],
  ),
  MovieData(
    title: 'The Dark Knight',
    country: 'United States',
    description:
        'Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.',
    category: 'Action, Crime',
    releaseDate: '07/18/2008',
    rating: '85',
    imageAsset: 'assets/images/batman.png',
    imageUrls: [
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/nMKdUUepR0i5zn0y1T4CsSB5chy.jpg',
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/qejZvo4zzL6KQ74h2IVnfGDbeQj.jpg',
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/plDp52MirFHc2PMJRMNWoG0kfr3.jpg',
    ],
  ),
  MovieData(
    title: 'Forrest Gump',
    country: 'United States',
    description:
        'A man with a low IQ has accomplished great things in his life and been present during significant historic events in each case, far exceeding what anyone imagined he could do. But despite all he has achieved, his one true love eludes him.',
    category: 'Comedy, Drama',
    releaseDate: '06/07/1994',
    rating: '85',
    imageAsset: 'assets/images/forest.png',
    imageUrls: [
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/zujN1md554VNrvOATMxSAcPG6p1.jpg',
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/rgz51ESlPANtfy1PUsYItTi1HaB.jpg',
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/esIkb7Wkfk016ZNpqX24w0gbgkb.jpg',
    ],
  ),
  MovieData(
    title: 'Oppenheimer',
    country: 'United States',
    description:
        'The story of J.Robert Oppenheimer\'s role in the development of the atomic bomb during World War II.',
    category: 'Drama, History',
    releaseDate: '07/19/2023',
    rating: '81',
    imageAsset: 'assets/images/oppenheimer.png',
    imageUrls: [
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/neeNHeXjMF5fXoCJRsOmkNGC7q.jpg',
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/zpkUscxB4Is9HMbrSkCoWHRIGOw.jpg',
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/kSC1OrznffwvQX8Tu9gbgG0hpuT.jpg',
    ],
  ),
  MovieData(
    title: 'Spider-Man: No Way Home',
    country: 'United States',
    description:
        'Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.',
    category: 'Action, Science Fiction',
    releaseDate: '12/15/2021',
    rating: '80',
    imageAsset: 'assets/images/nwh.png',
    imageUrls: [
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/VlHt27nCqOuTnuX6bku8QZapzO.jpg',
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/6TI2ficXEHkUI3mu4ViQm117RXk.jpg',
      'https://media.themoviedb.org/t/p/w1000_and_h563_face/6BO9oackFxQPZhrpSLwT8fwgXCv.jpg',
    ],
  ),
];
