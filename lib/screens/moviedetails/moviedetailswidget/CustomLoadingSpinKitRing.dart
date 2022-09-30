import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoadingSpinKitRing extends StatelessWidget {

  final Color? loadingColor;

  CustomLoadingSpinKitRing({
    required this.loadingColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Icon(
            Icons.videocam,
            size: 20,
            color: loadingColor ?? Colors.transparent,
          ),
        ),
        SpinKitRing(
          color: loadingColor ?? Colors.transparent,
          size: 50,
          lineWidth: 2,
        ),
      ],
    );
  }
}