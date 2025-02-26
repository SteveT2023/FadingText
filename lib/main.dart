import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _darkAndLightMode createState() => _darkAndLightMode();
  }

class _darkAndLightMode extends State<MyApp> {
  bool _isLightMode = true;

  void toggleMode () {
    setState((){
      _isLightMode =! _isLightMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isLightMode ? ThemeData.light() : ThemeData.dark(),
      home: FadingTextAnimation(toggleMode : toggleMode, isLightMode : _isLightMode),
    );
  }
}

class FadingTextAnimation extends StatefulWidget {
  final VoidCallback toggleMode;
  final bool isLightMode;
  FadingTextAnimation({required this.toggleMode, required this.isLightMode});
  
  @override
  _FadingTextAnimationState createState() => _FadingTextAnimationState();
}

class _FadingTextAnimationState extends State<FadingTextAnimation> {
  bool _isVisible = true;

  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fading Text Animation'),
        actions:[
          IconButton(
            icon: Icon(widget.isLightMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.toggleMode,
          )
        ]
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0,
          duration: Duration(seconds: 1),
          child: Text(
            'Hello, Flutter!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleVisibility,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}