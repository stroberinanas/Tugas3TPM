import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MaterialApp(
    home: StopwatchPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  List<String> _lapTimes = [];

  String _formatTime(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String formattedHours = (hours % 60).toString().padLeft(2, '0');
    String formattedMinutes = (minutes % 60).toString().padLeft(2, '0');
    String formattedSeconds = (seconds % 60).toString().padLeft(2, '0');

    return "$formattedHours:$formattedMinutes:$formattedSeconds";
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      setState(() {});
    });
  }

  void _startStopwatch() {
    _stopwatch.start();
    _startTimer();
  }

  void _pauseStopwatch() {
    _stopwatch.stop();
    _timer?.cancel();
  }

  void _resetStopwatch() {
    _stopwatch.reset();
    _stopwatch.stop();
    _timer?.cancel();
    _lapTimes.clear();
    setState(() {});
  }

  void _recordLapTime() {
    setState(() {
      _lapTimes.insert(0, _formatTime(_stopwatch.elapsedMilliseconds));
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _stopwatch.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final time = _formatTime(_stopwatch.elapsedMilliseconds);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Stopwatch'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(251, 180, 72, 1),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Animasi waktu berjalan
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: Text(
                time,
                key: ValueKey<String>(time),
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(
                  label: _stopwatch.isRunning ? 'Pause' : 'Start',
                  color: _stopwatch.isRunning ? Colors.red : Colors.green,
                  onPressed:
                      _stopwatch.isRunning ? _pauseStopwatch : _startStopwatch,
                ),
                const SizedBox(width: 20),
                _buildButton(
                  label: 'Lap',
                  color: Colors.orange,
                  onPressed: _stopwatch.isRunning ? _recordLapTime : null,
                ),
                const SizedBox(width: 20),
                _buildButton(
                  label: 'Reset',
                  color: Colors.grey,
                  onPressed: _resetStopwatch,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: _lapTimes.isEmpty
                  ? const Center(
                      child: Text(
                        'No laps yet',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _lapTimes.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text('Lap ${_lapTimes.length - index}'),
                          trailing: Text(_lapTimes[index]),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required String label,
    required Color color,
    required VoidCallback? onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      child: Text(label),
    );
  }
}
