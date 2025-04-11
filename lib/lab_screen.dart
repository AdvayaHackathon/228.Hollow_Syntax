import 'package:flutter/material.dart';

class LabScreen extends StatefulWidget {
  const LabScreen({super.key});

  @override
  State<LabScreen> createState() => _LabScreenState();
}

class _LabScreenState extends State<LabScreen> {
  int completedExperiments = 0;
  List<String> experiments = ['Circuit', 'pH Test', 'Magnet Test'];
  List<bool> isCompleted = [false, false, false];

  void completeExperiment(int index) {
    if (!isCompleted[index]) {
      setState(() {
        isCompleted[index] = true;
        completedExperiments++;
      });
    }
  }

  Widget experimentCard(String title, int index, VoidCallback onStart) {
    return Card(
      color: isCompleted[index] ? Colors.green.shade100 : null,
      child: ListTile(
        title: Text(title),
        trailing: isCompleted[index]
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.play_circle_outline),
        onTap: onStart,
      ),
    );
  }

  void showCircuitExperiment() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Circuit Builder"),
        content: const Text("Drag battery + wire + bulb → Tap 'Complete' if bulb glows!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              completeExperiment(0);
            },
            child: const Text("Complete"),
          )
        ],
      ),
    );
  }

  void showPhExperiment() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("pH Mixing"),
        content: const Text("Mix red & blue liquids → Observe color change!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              completeExperiment(1);
            },
            child: const Text("Complete"),
          )
        ],
      ),
    );
  }

  void showMagnetExperiment() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Magnet Test"),
        content: const Text("Drag magnet over items → Check if they're magnetic."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              completeExperiment(2);
            },
            child: const Text("Complete"),
          )
        ],
      ),
    );
  }

  String getBadge() {
    if (completedExperiments == 3) return "🧪 Lab Master";
    if (completedExperiments == 2) return "🔬 Lab Explorer";
    if (completedExperiments == 1) return "👩‍🔬 Lab Beginner";
    return "❌ No badge yet";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Virtual Lab")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text("Completed: $completedExperiments / 3", style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          Text("Badge: ${getBadge()}", style: const TextStyle(fontSize: 20)),
          const Divider(),
          Expanded(
            child: ListView(
              children: [
                experimentCard('⚡ Build a Circuit', 0, showCircuitExperiment),
                experimentCard('🧪 pH Mixing Test', 1, showPhExperiment),
                experimentCard('🧲 Magnet Attraction', 2, showMagnetExperiment),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
