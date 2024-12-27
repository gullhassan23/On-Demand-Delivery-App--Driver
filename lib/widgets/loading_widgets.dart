// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:math' as math;

import 'package:driverapp/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


loadingDialog() => Get.dialog(progressIndicator(), barrierDismissible: false);

Center progressIndicator() {
  return const Center(
    child: CircularProgressIndicator(
      color: AppColors.primary,
      backgroundColor: Colors.black,
    ),
  );
}

class DelayTween extends Tween<double> {
  DelayTween({double? begin, double? end, required this.delay})
      : super(begin: begin, end: end);

  final double delay;

  @override
  double lerp(double t) =>
      super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}

class CustomLoadingSpinner extends StatefulWidget {
  const CustomLoadingSpinner({super.key, 
  
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  });

  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  _CustomLoadingSpinnerState createState() => _CustomLoadingSpinnerState();
}

class _CustomLoadingSpinnerState extends State<CustomLoadingSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    final List<double> delays = [
      .0,
      1.1,
      1.0,
      0.9,
      0.8,
      0.7,
      0.6,
      0.5,
      0.4,
      0.3,
      0.2,
      0.1
    ];

    const circleSize = 60 / 3;
    const center = Offset(100 / 2, 120 / 2);
    return Center(
      child: SizedBox(
        height: screenSize.height*0.010,
        width: 100,
        child: Stack(
          children: List.generate(
            12,
            (i) {
              final angle = 3.14 * i / 4;
              return Positioned.fromRect(
                rect: Rect.fromLTWH(
                  center.dx + circleSize * (math.sin(angle)) - circleSize / 4,
                  center.dy + circleSize * (math.cos(angle)) - circleSize / 2,
                  circleSize / 2,
                  circleSize,
                ),
                child: Transform.rotate(
                  angle: -angle,
                  child: Align(
                    alignment: Alignment.center,
                    child: FadeTransition(
                      opacity:
                          DelayTween(begin: 0.0, end: 1.0, delay: delays[i])
                              .animate(_controller),
                      child: SizedBox(
                        height: screenSize.height*0.01,
                        width: 5,
                        child: _itemBuilder(i),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration: BoxDecoration(
            color: widget.color ?? Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        );
}

class CircularLoadingWidget extends StatefulWidget {
  final double height;
  final ValueChanged<void>? onComplete;
  final String onCompleteText;

  const CircularLoadingWidget(
      {Key? key,
      required this.height,
      this.onComplete,
      required this.onCompleteText})
      : super(key: key);

  @override
  _CircularLoadingWidgetState createState() => _CircularLoadingWidgetState();
}

class _CircularLoadingWidgetState extends State<CircularLoadingWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    CurvedAnimation curve =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation = Tween<double>(begin: widget.height, end: 0).animate(curve)
      ..addListener(() {
        if (mounted) setState(() {});
      });
    Timer(const Duration(seconds: 10), () {
      if (mounted) animationController.forward();
      // ignore: unnecessary_statements
      widget.onComplete;
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return animationController.isCompleted
        ? Container(
            width: context.width,
            height: widget.height,
            color: Colors.transparent,
            child: Center(
              child: Text(
                widget.onCompleteText,
                style: Get.textTheme.bodySmall!.merge(
                  const TextStyle(fontSize: 14),
                ),
              ),
            ),
          )
        : Opacity(
            opacity: animation.value / 100 > 1.0 ? 1.0 : animation.value / 100,
            child: SizedBox(
              height: animation.value,
              child: Center(child: progressIndicator()),
            ),
          );
  }
}
