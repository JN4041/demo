import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Step_count extends StatefulWidget {
  const Step_count({Key? key}) : super(key: key);

  @override
  State<Step_count> createState() => _Step_countState();
}

class _Step_countState extends State<Step_count> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() async {
    // Request the necessary permission
    if (await Permission.activityRecognition.request().isGranted) {
      _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
      _pedestrianStatusStream
          .listen(onPedestrianStatusChanged)
          .onError(onPedestrianStatusError);

      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream.listen(onStepCount).onError(onStepCountError);
    } else {
      // Handle the case where permission is not granted
    }
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedometer Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Steps Taken',
              style: TextStyle(fontSize: 30),
            ),
            CircularStepProgressIndicator(
              totalSteps: 100,
              currentStep: _steps.length,
              stepSize: 10,
              selectedColor: Colors.teal,
              unselectedColor: Colors.white,
              padding: 0,
              width: 200,
              height: 100,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    _steps,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
              selectedStepSize: 15,
              roundedCap: (_, __) => true,
            ),
            const Divider(
              height: 100,
              thickness: 0,
              color: Colors.white,
            ),
            const Text(
              'Pedestrian Status',
              style: TextStyle(fontSize: 30),
            ),
            Icon(
              _status == 'walking'
                  ? Icons.directions_walk
                  : _status == 'stopped'
                      ? Icons.accessibility_new
                      : Icons.error,
              size: 100,
            ),
            Center(
              child: Text(
                _status,
                style: _status == 'walking' || _status == 'stopped'
                    ? const TextStyle(fontSize: 30)
                    : const TextStyle(fontSize: 20, color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}
