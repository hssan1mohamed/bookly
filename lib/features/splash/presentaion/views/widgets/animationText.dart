import 'package:flutter/material.dart';


class AnimationText extends StatelessWidget {
  const AnimationText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context,_) {
          return SlideTransition(
            position: slidingAnimation ,
            child: const Text('Read Free Books',style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.w500
            ),
              textAlign: TextAlign.center,),
          );
        }
    );
  }
}
