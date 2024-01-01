import 'package:flutter/material.dart';
import 'package:music_player_glass_ui/widgets/glass_bottom_panel.dart';
import 'package:music_player_glass_ui/widgets/page_bar.dart';
import 'package:music_player_glass_ui/widgets/search.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 13, 13),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            SafeArea(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeadline(),
                    Search(),
                    Expanded(
                      child: PageBar(
                        tabs: const [
                          'Tracks',
                          'Albums',
                          'Reviews',
                          'Contacts',
                        ],
                        itemBuilder: (context, index) {
                          return Container();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: GlassBottomPanel(),
            ),
          ],
        ),
      ),
    );
  }

  //----------------------
  // Method Headline
  //----------------------
  Widget _buildHeadline() {
    return const Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 16,
      ),
      child: Text(
        'Find the best music\nfor you soul',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 32,
          color: Colors.white70,
        ),
      ),
    );
  }
}
