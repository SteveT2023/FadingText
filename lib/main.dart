import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _DarkAndLightModeState createState() => _DarkAndLightModeState();
}

class _DarkAndLightModeState extends State<MyApp> {
  bool _isLightMode = true;

  void toggleMode() {
    setState(() {
      _isLightMode = !_isLightMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isLightMode ? ThemeData.light() : ThemeData.dark(),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Fading Text Animations'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Animation 1'),
                Tab(text: 'Animation 2'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              FadingTextAnimation(toggleMode: toggleMode, isLightMode: _isLightMode),
              SecondFadingTextAnimation(),
            ],
          ),
        ),
      ),
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
  Color _textColor = Colors.black;

  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void changeColor(Color color) {
    setState(() {
      _textColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Fading Text Animation'),
        actions: [
          IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Pick a color'),
                  content: SingleChildScrollView(
                    child: BlockPicker(
                      pickerColor: _textColor,
                      onColorChanged: changeColor,
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: Text('Got it'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(widget.isLightMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.toggleMode,
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: toggleVisibility,
          child: AnimatedOpacity(
            opacity: _isVisible ? 1.0 : 0.0,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            child: Text(
              'Hello, Flutter!',
              style: TextStyle(fontSize: 24, color: _textColor),
            ),
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

class SecondFadingTextAnimation extends StatefulWidget {
  @override
  _SecondFadingTextAnimationState createState() => _SecondFadingTextAnimationState();
}

class _SecondFadingTextAnimationState extends State<SecondFadingTextAnimation> {
  bool _isVisible = true;
  bool _showFrame = false;
  Color _textColor = Colors.black;

  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void changeColor(Color color) {
    setState(() {
      _textColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Fading Text Animation'),
        actions: [
          IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Pick a color'),
                  content: SingleChildScrollView(
                    child: BlockPicker(
                      pickerColor: _textColor,
                      onColorChanged: changeColor,
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: Text('Got it'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: Duration(seconds: 3),
              child: Container(
                decoration: _showFrame
                    ? BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2.0),
                      )
                    : null,
                child: Text(
                  'Hello, Flutter!',
                  style: TextStyle(fontSize: 24, color: _textColor),
                ),
              ),
            ),
            SizedBox(height: 20),
            SwitchListTile(
              title: Text('Show Frame'),
              value: _showFrame,
              onChanged: (bool value) {
                setState(() {
                  _showFrame = value;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleVisibility,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
