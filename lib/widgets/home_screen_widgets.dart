import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/grid_view_screen.dart';

// Function to create a category button without an arrow
Widget categoryButton(String title, Future future, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey, width: 1),
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  GridViewMovieScreen(future: future, title: title)),
        );
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        minimumSize: const Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
      ),
    ),
  );
}

playList() {
  return Column(
    children: [
      const Row(),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.play_arrow, color: Colors.black),
          label: const Text('Play', style: TextStyle(color: Colors.black)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        const SizedBox(width: 10),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text('My List', style: TextStyle(color: Colors.white)),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ]),
    ],
  );
}

newEpisode() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(3),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 4.0,
      vertical: 2.0,
    ),
    child: const Text(
      "New Episode",
      style: TextStyle(
          fontFamily: 'NetflixSansBold', fontSize: 12, color: Colors.white),
    ),
  );
}

newEpisodeGames() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(3),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 4.0,
      vertical: 2.0,
    ),
    child: const Text(
      "New Season",
      style: TextStyle(
          fontFamily: 'NetflixSansBold', fontSize: 12, color: Colors.white),
    ),
  );
}

categoryButtonWithArrow(String title, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey, width: 1),
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextButton(
      onPressed: () {
        showExpandedBottomSheet(context);
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1.5),
        minimumSize: const Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const Icon(
            Icons.arrow_drop_down,
            color: Colors.grey,
          ),
        ],
      ),
    ),
  );
}

showExpandedBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.black.withOpacity(0.7),
    builder: (BuildContext context) {
      return Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Home',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            buildList('My List', context),
            buildList('Available for Download', context),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Browse by Languages',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            buildList('Hindi', context),
            buildList('Tamil', context),
            buildList('Telugu', context),
            buildList('Malayalam', context),
            buildList('Marathi', context),
            buildList('English', context),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Browse by Categories',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            buildList('Action', context),
            buildList('Anime', context),
            buildList('Award Winners', context),
            buildList('Biographical', context),
            buildList('Blockbusters', context),
            buildList('Bollywood', context),
            buildList('Kids & Family', context),
            buildList('Comedies', context),
            buildList('Documentaries', context),
          ],
        )),
      );
    },
  );
}

buildList(String name, BuildContext context) {
  return ListTile(
    title: Text(name, style: const TextStyle(color: Colors.white)),
    onTap: () {
      Navigator.pop(context);
    },
  );
}
