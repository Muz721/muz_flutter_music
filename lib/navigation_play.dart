import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
class NavigationPay extends StatefulWidget {
  @override
  _NavigationPay createState() => _NavigationPay();

}

class _NavigationPay extends State<NavigationPay>
    with TickerProviderStateMixin {
  AnimationController controller;
  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new Divider(height: 1.0,),
      new Container(
          decoration: new BoxDecoration(
            color: Theme
                .of(context)
                .cardColor,
          ),
          child: _playView()),
    ],);
  }

  Widget _playView() {
    Animation<double> animation;
    controller = AnimationController(
        duration: const Duration(milliseconds: 1200), vsync: this); //动画控制器
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.addStatusListener((status){
      if(status == AnimationStatus.completed){
        controller.repeat();
      }
    });
//    isPlay = true;
//    controller.repeat();
    return new Container(
      margin: const EdgeInsets.all(8.0),
      child: new Row(
        children: <Widget>[
          new RotationTransition(
            alignment: new Alignment(0, 0),
            child:
            new ClipOval(
              child:
              new Image.asset(
                'images/img_11.jpg',
                height: 50.0,
                width: 50.0,
                fit: BoxFit.cover,
              ),
            ), turns: animation, //new AlwaysStoppedAnimation(90 / 360)
          ),
          new Expanded(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 8.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text('卡农(Live)'),
                  new Text('张惠妹'),
                ],
              ),
            ),
          ),

//    new IconButton(
//    icon: new Icon(Icons.pause),
//    onPressed: _play),
//
//    new IconButton(
//    icon: new Icon(Icons.play_arrow),
//    onPressed: _play)
//    ,
    NavigationPayICon(controller:controller),
          new IconButton(
              icon: new Icon(Icons.playlist_play),
          onPressed: null,)

        ],
      ),
    );
  }
}
class NavigationPayICon extends StatefulWidget {
  NavigationPayICon({Key key, this.controller}) : super(key: key);
  AnimationController controller;
  @override
  _NavigationPayIcon createState() => _NavigationPayIcon();
}
class _NavigationPayIcon extends State<NavigationPayICon>{
  AudioPlayer audioPlayer = new AudioPlayer();
  AudioCache player = new AudioCache(prefix:'audios/');
//  audioPlayer=player.fixedPlayer;
  bool isPlay = false;
  @override
  Widget build(BuildContext context) {
    return     new IconButton(
        icon: new Icon(isPlay?Icons.pause:Icons.play_arrow),
        onPressed: _play);
  }
  void _play(){

setState((){
  if(isPlay){
    isPlay = false;
    widget.controller.stop();
    print("nihaoa");
    print(isPlay);
//    audioPlayer.stop();
    player.fixedPlayer.stop();
//    player.play().super
  }else{
    isPlay = true;
    widget.controller.forward();
//  controller.repeat();
    print("否");
    print(isPlay);

    player.play('msmw.mp3');
  }
});
  }
  void autio(){

  }
}