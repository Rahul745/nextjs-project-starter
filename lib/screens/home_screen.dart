import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_app/widgets/video_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Dummy data for videos
  final List<Map<String, String>> _videos = [
    {
      'id': '1',
      'title': 'Amazing Video 1',
      'author': 'Creator 1',
      'thumbnailUrl': 'https://picsum.photos/300/200',
    },
    {
      'id': '2',
      'title': 'Awesome Video 2',
      'author': 'Creator 2',
      'thumbnailUrl': 'https://picsum.photos/300/201',
    },
    {
      'id': '3',
      'title': 'Epic Video 3',
      'author': 'Creator 3',
      'thumbnailUrl': 'https://picsum.photos/300/202',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Video App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // Home Feed
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _videos.length,
            itemBuilder: (context, index) {
              final video = _videos[index];
              return VideoCard(
                title: video['title']!,
                author: video['author']!,
                thumbnailUrl: video['thumbnailUrl']!,
                onTap: () => context.go('/video/${video['id']}'),
              );
            },
          ),
          // Favorites
          const Center(
            child: Text('Favorites'),
          ),
          // Profile
          const Center(
            child: Text('Profile'),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.grey[900],
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
