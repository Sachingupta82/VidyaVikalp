import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sensors_plus/sensors_plus.dart';

class RandomStoryPage extends StatefulWidget {
  @override
  _RandomStoryPageState createState() => _RandomStoryPageState();
}

class _RandomStoryPageState extends State<RandomStoryPage> {
  final Random _random = Random();
  late Map<String, dynamic> _currentStory;
  final FlutterTts flutterTts = FlutterTts();
  bool isReading = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _currentStory = getRandomStory();
    _setupAccelerometer();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when disposing the widget
    super.dispose();
  }

  Map<String, dynamic> getRandomStory() {
    return stories[_random.nextInt(stories.length)];
  }

  void loadRandomStory() {
    setState(() {
      _currentStory = getRandomStory();
    });
  }

  Future<void> speak(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  Future<void> readAloud() async {
    setState(() {
      isReading = true;
    });

    await speak(_currentStory['title']);
    await Future.delayed(Duration(seconds: 1)); // Pause between title and content

    await speak(_currentStory['content']);

    setState(() {
      isReading = false;
    });
  }

  void _setupAccelerometer() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      if (!isReading && (event.x.abs() > 12 || event.y.abs() > 12 || event.z.abs() > 12)) {
        readAloud();
        // Start a timer to stop reading after 10 seconds
        _timer = Timer(Duration(seconds: 10), () {
          flutterTts.stop();
          setState(() {
            isReading = false;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Story'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _currentStory['title'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              _currentStory['content'],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: null,
              child: isReading ? CircularProgressIndicator() : Text('Shake or Vibrate to Read Aloud'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: loadRandomStory,
              child: Text('Load Another Story'),
            ),
          ],
        ),
      ),
    );
  }
}

// Your stories data
final List<Map<String, dynamic>> stories = [
  {
    'id': 1,
    'title': 'The Adventure Begins',
    'content': 'Once upon a time, in a kingdom far, far away, there lived a young prince named Alexander. '
        'He longed for adventure and yearned to explore the world beyond the castle walls. '
        'One day, he made a daring decision to embark on a journey that would change his life forever...',
  },
  {
    'id': 2,
    'title': 'Mystery of the Old Mansion',
    'content': 'Hidden deep within the dense forest, an old mansion stood tall, its walls shrouded in mystery. '
        'Many tales were told of the mansion\'s dark past and the secrets it held within. '
        'Determined to uncover the truth, a brave young explorer ventured into the mansion\'s eerie halls, '
        'where he encountered strange occurrences and uncovered long-forgotten secrets...',
  },
  {
    'id': 3,
    'title': 'The Lost Treasure',
    'content': 'Legends spoke of a treasure hidden deep within the mountains, guarded by mythical creatures '
        'and ancient traps. Many had sought to claim the treasure, but none had succeeded. '
        'Undeterred by the tales of danger, a fearless adventurer set out on a quest to find the lost treasure '
        'and unlock its untold riches. Little did he know, the greatest challenge lay not in the treasure itself, '
        'but in the journey that awaited him...',
  },
  {
    'id': 4,
    'title': 'The Enchanted Forest',
    'content': 'Beyond the bustling town and winding rivers lay an enchanted forest, where magic lingered in the air '
        'and creatures of myth roamed freely. Few dared to enter the forest, for its mysteries were as captivating '
        'as they were perilous. Yet, for one brave soul, the call of adventure was too strong to resist. '
        'With courage in their heart and determination in their eyes, they ventured into the depths of the enchanted forest, '
        'where they discovered wonders beyond imagination and forged bonds that would last a lifetime...',
  }
];