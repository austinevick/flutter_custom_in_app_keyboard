import 'package:flutter/material.dart';

class CustomTranslationAnimation extends StatefulWidget {
  final Duration delay;
  final Widget child;
  final Offset begin;
  final Offset end;
  const CustomTranslationAnimation({
    Key? key,
    this.delay = Duration.zero,
    required this.child,
    this.begin = Offset.zero,
    this.end = Offset.zero,
  }) : super(key: key);

  @override
  State<CustomTranslationAnimation> createState() =>
      _CustomTranslationAnimationState();
}

class _CustomTranslationAnimationState extends State<CustomTranslationAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 650));
    animation = Tween<Offset>(begin: widget.begin, end: widget.end).animate(
        CurvedAnimation(
            parent: animationController, curve: Curves.easeOutCirc));
    startAnimation();
  }

  void startAnimation() async {
    await Future.delayed(widget.delay);
    if (mounted) {
      animationController.reset();
      animationController.forward();
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, child) => Transform.translate(
        offset: animation.value,
        child: child,
      ),
      child: widget.child,
    );
  }
}
