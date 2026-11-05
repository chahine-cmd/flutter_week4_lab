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
          mainAxisAlignment: MainAxisAlignment.center, //It centers widgets vertically.
          crossAxisAlignment: CrossAxisAlignment.center, //It centers widgets horizontally.

          children: [
            
RichText( //Uses RichText to display multiple styles in a single title.
  textAlign: TextAlign.center,
  text: TextSpan(
    children: [

       TextSpan(
        text: 'Week 4 Lab:\n',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
 
      TextSpan(
        text: 'Gesture-Controlled Interface',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
),

            /* //this command disable sections of code without deleting them.
            Text(
              'Week 4 Lab:', // I Changed the title
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
           
            SizedBox(height: 40), // Adds space below the title.
           
                       Text(
              'Gesture-Controlled Interface', // I Changed the title
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            
            */

            SizedBox(height: 40), // Adds space below the title.

            Text(
              'Welcome to Flutter Gestures Lab',
              style: TextStyle(
                fontSize: 18,
                color: Colors.red
              ),
            ),
         
            SizedBox(height: 20),
           
            Icon(
              Icons.touch_app,
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

              child: const Text('Open Gesture Demo'),
            ),
          ],
        ),
      ),
    );
  }
}

// Screen 2
// StatefulWidget because its content can change.

class WidgetDemoScreen extends StatefulWidget {
  const WidgetDemoScreen({super.key});

  @override
  State<WidgetDemoScreen> createState() => _WidgetDemoScreenState();
}

// This class manages the changing content on Screen 2.

class _WidgetDemoScreenState extends State<WidgetDemoScreen> {

   String message = 'Tap, Long Press, or Swipe the Square'; //stores the message displayed on the screen
   String gestureStatus = 'Waiting for gesture...'; //stores the most recent gesture detected = Variable
   String buttonText = 'Press Me';// Stores the button text
   Color squareColor = Colors.blue;
   String squareText = 'Touch Here';
   bool isCircle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gesture Demo',
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

            const SizedBox(height: 80), //space between status text & instruction text.

            Text(
              gestureStatus,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            
            const SizedBox(height: 20), //space between text section and square.

            GestureDetector( 
              
              //this is the code before I added return to Homepage button
              /*onTap: () {
                setState(() {
                  gestureStatus = 'Tap Detected';
                  message = 'Nice Tap! Try a Long Press Next';
                  squareColor = Colors.green;
                });
              },*/

              onTap: () {
                if (squareText == 'Homepage') {
                  Navigator.pop(context);
                  return;
                }
                setState(() {
                  gestureStatus = 'Tap Detected';
                  message = 'Nice Tap! Try a Long Press Next';
                  squareColor = Colors.green;
                });
              },

              onLongPress: () {
                setState(() {
                  gestureStatus = 'Long Press Detected';
                  message = 'Great! Now try Swiping';
                  squareColor = Colors.orange;
                });
              },

              onHorizontalDragEnd: (details) { //Swipe function
                setState(() {
                  gestureStatus = 'Swipe Detected';
                  message = 'Gesture Master Unlocked!';
                  squareColor = Colors.purple;
                  squareText = 'Homepage';
                  isCircle = true;
                });
              },

              child: Container( //this is the square
                width: 200,
                height: 200,

                decoration: BoxDecoration(
                  color: squareColor,
                  shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                ),
              
                child: Center(
                  child: Text(
                    squareText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                  )
                )
              )
            )
           
            /* OutlinedButton( // Changes the message when pressed.
              onPressed: () {
                setState(() { //It updates the data & tell Flutter to refresh the UI
                  message = 'Thank you for testing my app!';
                  buttonText = 'The End';        
                });
              },

              child: Text(buttonText),
            ), */ //Week 3 button saved for reference.


          ],
        ),
      ),
    );
  }
}