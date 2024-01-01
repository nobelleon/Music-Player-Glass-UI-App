import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:music_player_glass_ui/widgets/bottom_tab_bar.dart';
import 'package:music_player_glass_ui/widgets/current_play_panel.dart';
import 'package:music_player_glass_ui/widgets/handle_bar.dart';

const animationDuration = Duration(milliseconds: 500);

class GlassBottomPanel extends StatefulWidget {
  final bool showCurrentPlay;

  const GlassBottomPanel({Key key, this.showCurrentPlay}) : super(key: key);

  @override
  State<GlassBottomPanel> createState() => _GlassBottomPanelState();
}

class _GlassBottomPanelState extends State<GlassBottomPanel>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  double capturedValue = 0.0;
  Offset capturedOffset;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      value: 0.0,
      duration: animationDuration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return ClipRRect(
          borderRadius: BorderRadiusTween(
            begin: BorderRadius.zero,
            end: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ).evaluate(animationController),
          child: child,
        );
      },
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 15.0,
          sigmaX: 15.0,
        ),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onVerticalDragStart:
              widget.showCurrentPlay ? _handleVerticalDragStart : null,
          onVerticalDragUpdate: _handleVerticalDragUpdate,
          onVerticalDragEnd: _handleVerticalDragEnd,
          child: Container(
            color: Colors.white24,
            padding: const EdgeInsets.only(
              bottom: 8.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                HandleBar(
                  animationController: animationController,
                ),
                if (widget.showCurrentPlay)
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: _handleOpen,
                    child: CurrentPlayPanel(
                      animationController: animationController,
                    ),
                  ),
                BottomTabBar(
                  animationController: animationController,
                  controller: ValueNotifier<int>(0),
                  items: [
                    BottomTabBarItem('Home', Ionicons.ios_home),
                    BottomTabBarItem('Navigator', Ionicons.ios_compass),
                    BottomTabBarItem('Chat', Ionicons.ios_chatbubbles),
                    BottomTabBarItem('Profile', Ionicons.ios_person),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleVerticalDragStart(DragStartDetails details) {
    capturedOffset = details.globalPosition;
  }

  void _handleVerticalDragUpdate(DragUpdateDetails details) {
    if (capturedOffset == null) return;

    final screenSize = MediaQuery.of(context).size;

    final diff = capturedOffset - details.globalPosition;

    animationController.value = capturedValue + diff.dy / screenSize.height;
  }

  void _handleVerticalDragEnd(DragEndDetails details) {
    if (capturedOffset == null) return;

    capturedOffset = null;

    if (animationController.value > 0.5) {
      _handleOpen();
    } else {
      _handleClose();
    }
  }

  void _handleOpen() {
    capturedValue = 1.0;
    animationController.animateTo(
      1.0,
      duration: animationDuration,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _handleClose() {
    capturedValue = 0.0;
    animationController.animateTo(
      0.0,
      duration: animationDuration,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
