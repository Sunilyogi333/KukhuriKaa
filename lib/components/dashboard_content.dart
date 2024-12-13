import 'package:flutter/material.dart';
import 'package:kukhurikaa/components/circular_progress.dart';
import 'package:kukhurikaa/components/control_card.dart';
import 'package:kukhurikaa/providers/control_provider.dart';
import 'package:kukhurikaa/providers/control_state.dart';
import 'package:provider/provider.dart';

class DashboardContent extends StatefulWidget {
  const DashboardContent({super.key});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  bool isTemperatureControlOn = false;
  bool isHumidityControlOn = false; // Default humidity value

  @override
  Widget build(BuildContext context) {
    final controlProvider = Provider.of<ControlProvider>(context);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularProgress(
                  title: "Temperature",
                  progress: controlProvider.temperature,
                  unit: "°C",
                  foregroundColor: Colors.red,
                ),
                SizedBox(
                  width: 20,
                ),
                CircularProgress(
                  title: "Humidity",
                  progress: controlProvider.humidity,
                  unit: '%',
                  foregroundColor: Colors.blue,
                ),
              ],
            ),
            // Row for temperature and humidity control
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Control",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
                  ),
                ),
                Row(
                  spacing: 16,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     ElevatedButton(
                  //       onPressed: () {
                  //         controlProvider.incrementTemperature();
                  //       },
                  //       child: Text('+ Temp'),
                  //     ),
                  //     SizedBox(width: 10),
                  //     ElevatedButton(
                  //       onPressed: () {
                  //         controlProvider.decrementTemperature();
                  //       },
                  //       child: Text('- Temp'),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 16),
                  // // Debug Buttons for Humidity
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     ElevatedButton(
                  //       onPressed: () {
                  //         controlProvider.incrementHumidity();
                  //       },
                  //       child: Text('+ Humidity'),
                  //     ),
                  //     SizedBox(width: 10),
                  //     ElevatedButton(
                  //       onPressed: () {
                  //         controlProvider.decrementHumidity();
                  //       },
                  //       child: Text('- Humidity'),
                  //     ),
                  //   ],
                  children: [
                    ControlCard(
                      title: "Temperature",
                      initialState: isTemperatureControlOn,
                      onToggle: (value) {
                        Provider.of<ControlState>(context, listen: false)
                            .toggleTemperatureControl(value);
                        // Additional logic for enabling/disabling temperature control
                      },
                    ),
                    ControlCard(
                      title: "Humidity",
                      initialState: isHumidityControlOn,
                      onToggle: (value) {
                        Provider.of<ControlState>(context, listen: false)
                            .toggleHumidityControl(value);
                        // Additional logic for enabling/disabling humidity control
                      },
                    ),
                  ],
                ),
              ],
            ),
            // Example list of items (can be a list of recent alerts, logs, etc.)
            ListTile(
              leading: Icon(Icons.warning, color: Colors.red),
              title: Text('Alert: High Temperature'),
              subtitle: Text('The temperature has exceeded the safe limit!'),
            ),
            ListTile(
              leading: Icon(Icons.warning, color: Colors.red),
              title: Text('Alert: Low Humidity'),
              subtitle: Text('The humidity is below the recommended level!'),
            ),
          ],
        ),
      ),
    );
  }
}