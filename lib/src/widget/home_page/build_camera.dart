import 'package:flutter/material.dart';
import 'package:flutter_webrtc/webrtc.dart';

class CameraMiniView extends StatefulWidget {
  final RTCVideoRenderer remoteRenderer;
  CameraMiniView({this.remoteRenderer});
  @override
  State<StatefulWidget> createState() => _CameraMiniViewState();
}

class _CameraMiniViewState extends State<CameraMiniView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FittedBox(
      fit: BoxFit.contain,
      child: SizedBox(
        width: size.width,
        height: size.width,
        child: new Transform(
          transform: Matrix4.identity()..rotateY(0.0),
          alignment: FractionalOffset.center,
          child: new Texture(
            textureId: widget.remoteRenderer.textureId,
          ),
        ),
      ),
    );
  }
}
