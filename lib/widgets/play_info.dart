import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PlayInfo extends StatefulWidget {
  PlayInfo({Key key}) : super(key: key);

  @override
  State<PlayInfo> createState() => _PlayInfoState();
}

class _PlayInfoState extends State<PlayInfo> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 4,
                ),
                child: Text(
                  'Happy Hour',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8,
                    ),
                    child: Text(
                      'Pacific daydream 2017',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Text(
                    '2017',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              liked = !liked;
            });
          },
          child: Center(
            child: liked
                ? const Icon(
                    MaterialCommunityIcons.heart,
                    color: Color.fromARGB(255, 118, 230, 84),
                    size: 24,
                  )
                : const Icon(
                    MaterialCommunityIcons.heart_outline,
                    color: Colors.white,
                    size: 24,
                  ),
          ),
        ),
        IconButton(
          color: Colors.white,
          icon: const Icon(
            MaterialCommunityIcons.dots_horizontal_circle_outline,
            size: 24,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
