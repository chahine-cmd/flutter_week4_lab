import 'package:flutter/material.dart'; // Imports pre-made UI design tools.

void main() {
  runApp(const MainApp()); // Launches my application.
}
// The starting point where the app turns on.

class MainApp extends StatelessWidget { // Main application widget.
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the red DEBUG banner.
      // Screen 1 becomes the application's home screen.

      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
// Screen 1 uses a StatelessWidget because its content does not change.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            // In Week 2, this was my Hello World message.
            // For Week 3, I changed it to the lab title.

            Text(
              'Week 3 Lab: UI Design in Flutter',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
           
            SizedBox(height: 40), // Adds space below the title.
           
            Text(
              'Welcome to Flutter Widgets Lab',
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
            ),
         
            SizedBox(height: 20),
           
            Icon(
              Icons.science,
              size: 100,
              color: Colors.blue,
            ),
           
            SizedBox(height: 50),
         
            ElevatedButton( // This button navigates the user to Screen 2.
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WidgetDemoScreen(),
                  ),
                );
              },

              child: const Text('Open Widget Demo'),
            ),
          ],
        ),
      ),
    );
  }
}

// Screen 2
// I am using a StatefulWidget because its content can change.

class WidgetDemoScreen extends StatefulWidget {
  const WidgetDemoScreen({super.key});

  @override
  State<WidgetDemoScreen> createState() => _WidgetDemoScreenState();
}

// This class manages the changing content on Screen 2.

class _WidgetDemoScreenState extends State<WidgetDemoScreen> {

   String message = 'Press the Button Below'; //stores the message displayed on the screen
   String buttonText = 'Press Me';// Stores the button text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Demo',
          style: TextStyle(
          color: Colors.blue,
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Displays the current message.

            Text(
              message,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),

              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 100),

            // Changes the message when pressed.

            OutlinedButton( // I used a different button widget
              onPressed: () {
                setState(() {
                  message = 'Thank you for testing my app!';
                  buttonText = 'The End';        
                });
              },

              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}