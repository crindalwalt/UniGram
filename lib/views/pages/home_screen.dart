import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  // Dummy data for stories
  final List<Map<String, dynamic>> _stories = [
    {
      'username': 'You',
      'imageUrl':
          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
      'isYourStory': true,
    },
    {
      'username': 'Alex',
      'imageUrl':
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
      'isYourStory': false,
    },
    {
      'username': 'Maya',
      'imageUrl':
          'https://images.unsplash.com/photo-1517841905240-472988babdf9',
      'isYourStory': false,
    },
    {
      'username': 'Carlos',
      'imageUrl':
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d',
      'isYourStory': false,
    },
    {
      'username': 'Priya',
      'imageUrl':
          'https://images.unsplash.com/photo-1531123897727-8f129e1688ce',
      'isYourStory': false,
    },
  ];

  // Dummy data for feed posts
  final List<Map<String, dynamic>> _posts = [
    {
      'username': 'Alex Wang',
      'userImage':
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
      'timeAgo': '15 min',
      'postImage':
          'https://images.unsplash.com/photo-1523050854058-8df90110c9f1',
      'caption':
          'Great lecture today on quantum computing! #ComputerScience #QuantumPhysics',
      'likes': 124,
      'comments': 18,
      'shares': 3,
    },
    {
      'username': 'University Events',
      'userImage':
          'https://images.unsplash.com/photo-1592280771190-3e2e4d977759',
      'timeAgo': '2 hours',
      'postImage':
          'https://images.unsplash.com/photo-1540575467063-178a50c2df87',
      'caption':
          'Don\'t miss the annual Spring Festival this weekend! Live music, food, and fun activities for all students. #CampusLife #SpringFestival',
      'likes': 287,
      'comments': 42,
      'shares': 31,
    },
    {
      'username': 'Sarah Miller',
      'userImage':
          'https://images.unsplash.com/photo-1517841905240-472988babdf9',
      'timeAgo': '4 hours',
      'postImage':
          'https://images.unsplash.com/photo-1519389950473-47ba0277781c',
      'caption':
          'Study group for tomorrow\'s calculus exam - meeting in the library at 6pm! Comment if you\'re joining! #StudyGroup #CalcExam',
      'likes': 98,
      'comments': 32,
      'shares': 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface.withAlpha(200),
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primary.withAlpha(200),
                theme.colorScheme.secondary.withAlpha(200),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.school, color: Colors.white),
            ),
            SizedBox(width: 10),
            Text(
              'UniGram',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onPrimary,
                letterSpacing: 1.0,
                fontSize: 22,
                // shadows: [
                //   Shadow(
                //     color: theme.colorScheme.onPrimary,
                //     blurRadius: 2,
                //     offset: Offset(0, 1),
                //   ),
                // ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
            iconSize: 26,
          ),
          IconButton(
            icon: Badge(
              label: Text('3'),
              backgroundColor: theme.colorScheme.error,
              child: Icon(Icons.notifications_outlined, color: Colors.white),
            ),
            onPressed: () {},
          ),
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: IconButton(
              icon: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.chat_bubble_outline,
                    color: Colors.white, size: 22),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // In a real app, this would refresh the feed
          await Future.delayed(Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Stories section
              Container(
                height: 120,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _stories.length,
                  itemBuilder: (context, index) {
                    bool isFirstStory = index == 0;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Container(
                            width: 68,
                            height: 68,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: isFirstStory
                                  ? null
                                  : LinearGradient(
                                      colors: [
                                        theme.colorScheme.secondary,
                                        theme.colorScheme.primary,
                                        theme.colorScheme.error
                                      ],
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                    ),
                              border: isFirstStory
                                  ? Border.all(
                                      color: theme.dividerColor, width: 2)
                                  : null,
                            ),
                            padding: EdgeInsets.all(3),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: theme.scaffoldBackgroundColor,
                                    width: 2),
                                image: DecorationImage(
                                  image:
                                      NetworkImage(_stories[index]['imageUrl']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: isFirstStory
                                  ? Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme.primary,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color:
                                                  theme.scaffoldBackgroundColor,
                                              width: 2),
                                        ),
                                        child: Icon(Icons.add,
                                            color: theme.colorScheme.onPrimary,
                                            size: 16),
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            _stories[index]['username'],
                            style: TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Divider after stories
              Divider(height: 1),

              // Posts section
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _posts.length,
                separatorBuilder: (context, index) => SizedBox(height: 8),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0.5,
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Post header with user info
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(_posts[index]['userImage']),
                          ),
                          title: Text(
                            _posts[index]['username'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(_posts[index]['timeAgo']),
                          trailing: IconButton(
                            icon: Icon(Icons.more_horiz),
                            onPressed: () {},
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        ),

                        // Post image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            _posts[index]['postImage'],
                            width: double.infinity,
                            height: 240,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // Post actions (like, comment, share)
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.favorite_outline),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.chat_bubble_outline),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.share_outlined),
                                onPressed: () {},
                              ),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.bookmark_outline),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),

                        // Likes count
                        Padding(
                          padding: EdgeInsets.only(left: 16, bottom: 8),
                          child: Text(
                            '${_posts[index]['likes']} likes',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),

                        // Caption
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  color: theme.textTheme.bodyLarge?.color),
                              children: [
                                TextSpan(
                                  text: _posts[index]['username'] + ' ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: _posts[index]['caption'],
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Comments section
                        Padding(
                          padding: EdgeInsets.only(left: 16, top: 4, bottom: 8),
                          child: Text(
                            'View all ${_posts[index]['comments']} comments',
                            style: TextStyle(
                                color: theme.textTheme.bodySmall?.color,
                                fontSize: 13),
                          ),
                        ),

                        // Add comment section
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundImage:
                                    NetworkImage(_stories[0]['imageUrl']),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Add a comment...',
                                  style: TextStyle(color: theme.hintColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.explore), label: 'Explore'),
          NavigationDestination(
              icon: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(4),
                child: Icon(Icons.add, color: theme.colorScheme.onPrimary),
              ),
              label: 'Create'),
          NavigationDestination(icon: Icon(Icons.event), label: 'Events'),
          NavigationDestination(
              icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
        selectedIndex: 0,
        onDestinationSelected: (index) {
          // Handle navigation
        },
      ),
    );
  }
}
