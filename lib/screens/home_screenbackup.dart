import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/home_screen_widgets.dart';

class NetflixHomeScreen extends StatefulWidget {
  const NetflixHomeScreen({super.key});

  @override
  _NetflixHomeScreenState createState() => _NetflixHomeScreenState();
}

class _NetflixHomeScreenState extends State<NetflixHomeScreen> {
  int _selectedIndex = 0;
  String _selectedCategory = 'Categories';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Function to open the expanded bottom sheet with close button
  void _showExpandedBottomSheet() {
    showModalBottomSheet(
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
              ListTile(
                title: const Text('My List',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _selectedCategory = 'My List');
                },
              ),
              ListTile(
                title: const Text('Available for Download',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _selectedCategory = 'Available for Download');
                },
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Browse by Languages',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title:
                    const Text('Hindi', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _selectedCategory = 'Hindi');
                },
              ),
              ListTile(
                title:
                    const Text('Tamil', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _selectedCategory = 'Tamil');
                },
              ),
              ListTile(
                title:
                    const Text('Telugu', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _selectedCategory = 'Telugu');
                },
              ),
              ListTile(
                title: const Text('Malayalam',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _selectedCategory = 'Malayalam');
                },
              ),
              ListTile(
                title: const Text('Marathi',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _selectedCategory = 'Marathi');
                },
              ),
              ListTile(
                title: const Text('English',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _selectedCategory = 'English');
                },
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Browse by Categories',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title:
                    const Text('Action', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _selectedCategory = 'Action');
                },
              ),
              ListTile(
                title:
                    const Text('Anime', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _selectedCategory = 'Anime');
                },
              ),
              ListTile(
                title: const Text('Award Winners',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _selectedCategory = 'Award Winners');
                },
              ),
              ListTile(
                title: const Text('Biographical',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _selectedCategory = 'Biographical');
                },
              ),
              ListTile(
                title: const Text('Blockbusters',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _selectedCategory = 'Blockbusters');
                },
              ),
              ListTile(
                title: const Text('Bollywood',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _selectedCategory = 'Bollywood');
                },
              ),
              ListTile(
                title: const Text('Kids & Family',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _selectedCategory = 'Kids & Family');
                },
              ),
              ListTile(
                title: const Text('Comedies',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _selectedCategory = 'Comedies');
                },
              ),
              ListTile(
                title: const Text('Documentaries',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _selectedCategory = 'Documentaries');
                },
              ),
            ],
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/Images/logo2.png',
            height: 40, // Netflix logo
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.download, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          // Category Row (TV Shows, Movies, Categories)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //categoryButton('TV Shows'),
                const SizedBox(
                  width: 10,
                ),
                // categoryButton('Movies'),
                const SizedBox(
                  width: 10,
                ),
                categoryButtonWithArrow('Categories'),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/Images/platform2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.play_arrow, color: Colors.black),
                        label: const Text('Play',
                            style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add, color: Colors.white),
                        label: const Text('My List',
                            style: TextStyle(color: Colors.white)),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Scrollable Lists
          sectionTitle('Mobile Games'),
          buildHorizontalList(['profile2.jpg', 'profile2.jpg', 'profile2.jpg']),

          sectionTitle('Continue Watching for mkjasni'),
          buildHorizontalList(['profile2.jpg', 'profile2.jpg', 'profile2.jpg']),

          sectionTitle('Downloads For You'),
          buildHorizontalList(['profile2.jpg', 'profile2.jpg']),

          sectionTitle('Family Time TV'),
          buildHorizontalList(['profile2.jpg', 'profile2.jpg', 'profile2.jpg']),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Downloads',
          ),
        ],
      ),
    );
  }

  // Function to create a category button with a down arrow
  Widget categoryButtonWithArrow(String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: _showExpandedBottomSheet, // Show the bottom sheet
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
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
              Icons.arrow_drop_down, // Downward arrow next to the text
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  // Function to create a section title
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Function to create a horizontal list
  Widget buildHorizontalList(List<String> imagePaths) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset(
              'assets/Images/${imagePaths[index]}',
              width: 100,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
