import 'package:flutter/material.dart';

class PageBar extends StatefulWidget {
  final List<String> tabs;
  final IndexedWidgetBuilder itemBuilder;
  final TextStyle textStyle;

  const PageBar({Key key, this.tabs, this.itemBuilder, this.textStyle})
      : super(key: key);

  @override
  State<PageBar> createState() => _PageBarState();
}

class _PageBarState extends State<PageBar> with SingleTickerProviderStateMixin {
  final pageController = PageController();
  AnimationController controller;
  final animationDuration = 250;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: animationDuration),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabs(),
        Expanded(
          child: PageView.builder(
            controller: pageController,
            itemCount: widget.tabs.length,
            itemBuilder: widget.itemBuilder,
          ),
        ),
      ],
    );
  }

  //----------------------------
  // Method Tabs
  //----------------------------
  Widget _buildTabs() {
    return Container(
      margin: const EdgeInsets.only(
        top: 24,
        left: 24,
        right: 24,
      ),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          final selectorAlignment = Alignment.lerp(
            Alignment.centerLeft,
            Alignment.centerRight,
            controller.value,
          );

          final itemWidthFactor = 1.0 / widget.tabs.length;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: widget.tabs
                    .asMap()
                    .map((key, value) {
                      final offset = key / (widget.tabs.length - 1);

                      final labelColor = Color.lerp(
                        Colors.white,
                        Colors.white70,
                        controller.value == offset ? 0.0 : 1.0,
                      );

                      return MapEntry(
                        key,
                        _buildTabItem(
                          value,
                          labelColor,
                          () {
                            controller.animateTo(
                              offset,
                              duration: Duration(
                                milliseconds: animationDuration,
                              ),
                              curve: Curves.easeInOut,
                            );
                            pageController.animateToPage(
                              key,
                              duration: Duration(
                                milliseconds: animationDuration,
                              ),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                      );
                    })
                    .values
                    .toList(growable: false),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: selectorAlignment,
                    child: FractionallySizedBox(
                      widthFactor: itemWidthFactor,
                      child: Container(
                        width: double.maxFinite,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromARGB(255, 91, 226, 91),
                              width: 3.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  //----------------------
  // Method Tab Item
  //----------------------
  Widget _buildTabItem(
    String label,
    Color activeColor,
    VoidCallback onPressed,
  ) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: DefaultTextStyle(
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: activeColor,
            ),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: widget.textStyle,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
