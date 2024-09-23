import 'package:flutter/material.dart';
import 'package:movie_finder/components/full_screen_image.dart';
import 'package:movie_finder/model/movie_data.dart';

class ImageDetailPage extends StatelessWidget {
  final MovieData movie;
  final int selectedImageIndex;
  final ValueChanged<int> onImageSelected;

  const ImageDetailPage({
    super.key,
    required this.movie,
    required this.selectedImageIndex,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullScreenImage(
                  imageUrl: movie.imageUrls[selectedImageIndex],
                ),
              ),
            );
          },
          child: Image.network(
            movie.imageUrls[selectedImageIndex],
            fit: BoxFit.cover,
            height: 300,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 80.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movie.imageUrls.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  onImageSelected(index);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selectedImageIndex == index ? Colors.blue : Colors.transparent,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      movie.imageUrls[index],
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}