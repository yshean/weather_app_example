import 'package:flutter/material.dart';

class MyAppLifecycle extends StatefulWidget {
  @override
  _MyAppLifecycleState createState() => _MyAppLifecycleState();
}

class _MyAppLifecycleState extends State<MyAppLifecycle>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    // Add observer to start listening to lifecycle changes
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // Remove observer when the widget is disposed
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // This method is called when the app's lifecycle state changes
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // Log or perform actions based on the current state
    if (state == AppLifecycleState.resumed) {
      print("App is in resumed state");
      // Resume operations like animations, live data fetching, etc.
    } else if (state == AppLifecycleState.paused) {
      print("App is in paused state");
      // Pause operations like animations, and save user data
    } else if (state == AppLifecycleState.inactive) {
      print("App is in inactive state");
      // Handle temporary pauses (e.g., call overlays)
    } else if (state == AppLifecycleState.detached) {
      print("App is in detached state");
      // Clean up resources as the app is about to be terminated
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Lifecycle Example"),
      ),
      body: Center(
        child: Text("Observe the console for lifecycle state changes"),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyAppLifecycle(),
  ));
}
