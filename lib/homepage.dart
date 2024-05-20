import 'package:blog_club/data.dart';
import 'package:blog_club/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = AppDatabase.stories;
    final category = AppDatabase.categories;
    return Scaffold(
      bottomNavigationBar: bottomnav(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Hi, Johnatan',
                      style: TextStyle(),
                    ),
                    Image.asset(
                      'assets/img/icons/notification.png',
                      width: 24,
                      height: 24,
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 32, bottom: 16),
                child: Text(
                  'Explore Todays',
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: stories.length,
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                    itemBuilder: (context, index) {
                      final story = stories[index];
                      return Container(
                          width: 68,
                          height: 68,
                          margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  profileimage(story),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Image.asset(
                                        'assets/img/icons/${story.iconFileName}',
                                        width: 24,
                                        height: 24,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                story.name,
                                style: const TextStyle(color: Colors.black),
                              )
                            ],
                          ));
                    }),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 350,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: ClampingScrollPhysics(),
                  itemCount: category.length,
                  itemBuilder: (context, index) {
                    final Category = category[index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16, 32, 0, 32),
                      child: PostImage(category: Category),
                    );
                  },
                ),
              ),
              const PostItem(),
            
            ],
          ),
        ),
      ),
    );
  }

  Container profileimage(StoryData story) {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
            Color(0xff376aed),
            Color(0xff498ef2),
            Color(0xff9cecf8),
          ])),
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(4),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset('assets/img/stories/${story.imageFileName}')),
      ),
    );
  }
}

class PostImage extends StatelessWidget {
  const PostImage({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 350,
            width: 300,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: const LinearGradient(
                    colors: [Color(0xaa0D253c), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                "assets/img/posts/large/${category.imageFileName}",
                fit: BoxFit.cover,
              ),
            )),
        Positioned(
          bottom: 16,
          left: 32,width: 300,
          child: Text(category.title,
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .apply(color: Colors.white)),
        )
      ],
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    final post = AppDatabase.posts;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Latest News',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'more',
                    style: TextStyle(color: Colors.blue),
                  )),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ListView.builder(
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemExtent: 141,
          shrinkWrap: true,
          itemCount: post.length,
          itemBuilder: (context, index) {
            final Post = post[index];
            return Container(
              margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
              width: MediaQuery.of(context).size.width,
              height: 149,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                          'assets/img/posts/small/${Post.imageFileName}')),
                          SizedBox(width: 16,),
                    Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Post.caption,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff376AED)),
                        ),
                        Text(Post.title),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            Icon(CupertinoIcons.hand_thumbsup,size: 16,),
                            SizedBox(width: 4,),
                            Text(Post.likes),
                            SizedBox(width: 4,),
                            Icon(CupertinoIcons.clock, size: 16,),
                            Text(Post.time),
                            Expanded(child: Icon(Post.isBookmarked? Icons.bookmark: Icons.bookmark_border))
                          ],
                        )
                      ],
                    ),
                  ) 
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
