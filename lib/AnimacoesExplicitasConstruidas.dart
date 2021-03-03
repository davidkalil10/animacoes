import 'package:flutter/material.dart';

class AnimacoesExplicitasConstruidas extends StatefulWidget {
  @override
  _AnimacoesExplicitasConstruidasState createState() => _AnimacoesExplicitasConstruidasState();
}

class _AnimacoesExplicitasConstruidasState extends State<AnimacoesExplicitasConstruidas>
with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  AnimationStatus _animationStatus;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync:this
    )..addStatusListener((status) {
      _animationStatus = status;
    })..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: 300,
              height: 400,
            child: RotationTransition(
              child: Image.asset("imagens/logo.png"),
              alignment: Alignment.center,
              turns: _animationController,
            ),
          ),
          ElevatedButton(
            child: Text("Pressione"),
            onPressed: (){
              if (_animationStatus == AnimationStatus.dismissed){
                _animationController.repeat();
              }else{
                _animationController.reverse();
              }
            },
          )
        ],
      ),
    );
  }
}
