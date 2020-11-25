import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class GridItem extends StatefulWidget {
  final String idCam;
  final int index;
  GridItem({this.index, this.idCam});
  @override
  State<StatefulWidget> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  final String urlToStreamVideo =
      'http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_60fps_normal.mp4';
  VlcPlayerController controller;
  @override
  void initState() {
    super.initState();
    controller = new VlcPlayerController(onInit: () {
      controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blueAccent,
            width: .8,
          ),
        ),
        child: Stack(
          children: [
            Container(
              child: VlcPlayer(
                aspectRatio: 1 / 1,
                url: urlToStreamVideo,
                controller: controller,
                placeholder: Center(child: CircularProgressIndicator()),
              ),
            ),
            Container(
              margin: EdgeInsets.all(
                4.0,
              ),
              decoration: BoxDecoration(
                color: Colors.black38,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(
                10.0,
              ),
              child: Text(
                (widget.index + 1).toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width / 24.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
