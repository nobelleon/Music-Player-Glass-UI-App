import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:music_player_glass_ui/widgets/play_controls.dart';
import 'package:music_player_glass_ui/widgets/play_info.dart';
import 'package:music_player_glass_ui/widgets/timeline_slider.dart';

class CurrentPlayPanel extends StatefulWidget {
  final AnimationController animationController;

  const CurrentPlayPanel({Key key, this.animationController}) : super(key: key);

  @override
  State<CurrentPlayPanel> createState() => _CurrentPlayPanelState();
}

class _CurrentPlayPanelState extends State<CurrentPlayPanel> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: AnimatedBuilder(
        animation: widget.animationController,
        builder: (context, child) {
          return Container(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 8,
            ),
            height: Tween<double>(
              begin: 58,
              end: screenSize.height - 120,
            ).animate(widget.animationController).value,
            child: child,
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Stack(
                children: [
                  OverflowBox(
                    alignment: Alignment.topLeft,
                    maxWidth: screenSize.width * 2,
                    maxHeight: screenSize.height,
                    child: AnimatedBuilder(
                      animation: widget.animationController,
                      builder: (context, child) {
                        final sizeTween = Tween<double>(
                          begin: 50.0,
                          end: screenSize.width - 24 - 24,
                        ).animate(widget.animationController);

                        final paddingTween = EdgeInsetsTween(
                          begin: EdgeInsets.zero,
                          end: const EdgeInsets.only(
                            top: 48,
                          ),
                        ).animate(widget.animationController);

                        return Padding(
                          padding: paddingTween.value,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: sizeTween.value,
                                height: sizeTween.value,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/img/Weezer - Pacific daydream.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              child,
                            ],
                          ),
                        );
                      },
                      child: AnimatedBuilder(
                        animation: widget.animationController,
                        builder: (context, child) {
                          return Opacity(
                            opacity: Tween<double>(
                              begin: 1.0,
                              end: 0.0,
                            ).evaluate(widget.animationController),
                            child: child,
                          );
                        },
                        child: SizedBox(
                          width: screenSize.width - 24 - 24 - 50,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                          bottom: 4,
                                        ),
                                        child: Text(
                                          'Happy Hour',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
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
                                              'Pacific daydream',
                                              style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          const Text(
                                            '2017',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Icon(
                                MaterialCommunityIcons.play,
                                size: 32,
                                color: Colors.white,
                              ),
                              const Icon(
                                MaterialCommunityIcons.close,
                                size: 32,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Transform.translate(
                offset: const Offset(0, 0),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(
                    top: 24,
                  ),
                  clipBehavior: Clip.none,
                  child: Stack(
                    children: [
                      AnimatedBuilder(
                        animation: widget.animationController,
                        builder: (context, child) {
                          final scaleTween = Tween<double>(
                            begin: 0.75,
                            end: 1.0,
                          ).evaluate(widget.animationController);

                          final trans1Tween = Tween(
                            begin: const Offset(0, 100),
                            end: Offset.zero,
                          ).evaluate(widget.animationController);

                          final trans2Tween = Tween(
                            begin: const Offset(0, 150),
                            end: Offset.zero,
                          ).evaluate(widget.animationController);

                          final trans3Tween = Tween(
                            begin: const Offset(0, 200),
                            end: Offset.zero,
                          ).evaluate(widget.animationController);

                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Transform.scale(
                                scale: scaleTween,
                                child: Transform.translate(
                                  offset: trans1Tween,
                                  child: PlayInfo(),
                                ),
                              ),
                              Transform.scale(
                                scale: scaleTween,
                                child: Transform.translate(
                                  offset: trans2Tween,
                                  child: const TimelineSlider(),
                                ),
                              ),
                              Transform.scale(
                                scale: scaleTween,
                                child: Transform.translate(
                                  offset: trans3Tween,
                                  child: const PlayControls(),
                                ),
                              ),
                              Transform.scale(
                                scale: scaleTween,
                                child: Transform.translate(
                                  offset: trans3Tween,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 16,
                                    ),
                                    child: OutlinedButton(
                                      onPressed: () {},
                                      style: outlineButtonStyle,
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 12.0,
                                        ),
                                        child: Text(
                                          '+ Add to cart',
                                        ),
                                      ),
                                      // color: Colors.white,
                                      // textColor: Colors.white,
                                      // borderSide: const BorderSide(
                                      //   color: Colors.white,
                                      //   width: 1.0,
                                      // ),
                                      // shape: RoundedRectangleBorder(
                                      //   borderRadius: BorderRadius.circular(10),
                                      // ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
    primary: Colors.white,
    //minimumSize: Size(88, 36),
    //padding: EdgeInsets.symmetric(horizontal: 16),

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ).copyWith(
    side: MaterialStateProperty.resolveWith<BorderSide>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed))
          return BorderSide(
            color: Colors.white,
            width: 1.0,
          );
        return null; // Defer to the widget's default.
      },
    ),
  );
}
