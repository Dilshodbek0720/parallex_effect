import 'package:flutter/material.dart';
import 'package:parallex_effect/ui/utils/constants/constants.dart';
import 'package:parallex_effect/ui/videos/widgets/video_card.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }



  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: PageView.builder(
              controller: _pageController,
              itemCount: videos.length,
              itemBuilder: (context, index) {
                return VideoCard(
                  assetPath: videos[index],
                  isSelected: _selectedIndex == index,
                );
              },
              onPageChanged: (v){
                setState(() {
                  _selectedIndex = v;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}