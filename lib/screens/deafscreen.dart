
import 'package:flutter/material.dart';
import 'package:vidyavikalp/screens/chapScreen.dart';
import 'package:vidyavikalp/screens/reportpage.dart';
import 'package:vidyavikalp/screens/resourcepage.dart';


class DeafPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: const Color.fromARGB(255, 208, 223, 208),
      ),
      body: Container(
        color: Color.fromARGB(255, 243, 239, 242),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            ProgressCircle(),
            SizedBox(height: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ChapScreen()),
                            );
                          },
                          child: Container(
                            height: 160,
                            width: 70,
                            child: CustomCard(
                              child: ListTile(
                                leading: Icon(Icons.book),
                                title: Text('Chapters',style: TextStyle(fontSize: 10),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ReportPage()),
                            );
                          },
                          child: Container(
                            height: 160,
                            child: CustomCard(
                              child: ListTile(
                                leading: Icon(Icons.report),
                                title: Text('Report',style: TextStyle(fontSize: 10),),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ResourcesPage()),
                            );
                          },
                          child: Container(
                            height: 160,
                            child: CustomCard(
                              child: ListTile(
                                leading: Icon(Icons.source),
                                title: Text('Resources',style: TextStyle(fontSize: 10),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Perform logout action
                          },
                          child: Container(
                            height: 160,
                            child: CustomCard(
                              child: ListTile(
                                leading: Icon(Icons.logout),
                                title: Text('Log Out',style: TextStyle(fontSize: 10),),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final Widget child;

  const CustomCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: child,
      ),
    );
  }
}

class ProgressCircle extends StatefulWidget {
  @override
  _ProgressCircleState createState() => _ProgressCircleState();
}

class _ProgressCircleState extends State<ProgressCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 0.5, // Initial progress value (can be changed dynamically)
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: 120,
          height: 120,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: _animation.value,
                strokeWidth: 8,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              Center(
                child: Text(
                  '${(_animation.value * 100).toStringAsFixed(0)}%',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}