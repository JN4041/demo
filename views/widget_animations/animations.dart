import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../coman_texfile.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  bool so = false;
  @override
  void initState() {
    Timer(
      Duration(seconds: 4),
      () => print("jaydip Done"),
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: () {
            setState(() {
              so = !so;
            });
          },
          color: Colors.red,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        Visibility(
          visible: so,
          child: InteractiveViewer(
            child: Image.network(
                "https://rukminim2.flixcart.com/image/850/1000/kl5hh8w0/poster/6/n/z/medium-cute-cartoon-wall-sticker-poster-interior-wall-poster-original-imagycg3dxbt2kms.jpeg?q=90"),
          ),
        ),
      ],
    );
  }
}
