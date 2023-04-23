import 'package:flutter/material.dart';
import './art_util.dart';

void main() {
  runApp(ArtScreen());
}

class ArtScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        // Added
        length: 3, // Added
        initialIndex: 0, //Added
        child: Scaffold(
          appBar: AppBar(
            title: Text('Art Tab'),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.art_track),
                  text: ArtUtil.CARAVAGGIO,
                ),
                Tab(
                  icon: Icon(Icons.art_track),
                  text: ArtUtil.MONET,
                ),
                Tab(
                  icon: Icon(Icons.art_track),
                  text: ArtUtil.VANGOGH,
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 1.5,
                    image: NetworkImage(ArtUtil.IMG_CARAVAGGIO),
                  ),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 1.5,
                    image: NetworkImage(ArtUtil.IMG_MONET),
                  ),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 1.5,
                    image: NetworkImage(ArtUtil.IMG_VANGOGH),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
