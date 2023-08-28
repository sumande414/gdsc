# gdsc - Task

This is a project built by flutter framework.
I. To build this project from source code follow the following instruction:
1. Install the Flutter framework for your machine "https://docs.flutter.dev/get-started/install" and setup the environment variables.
2. Go to the main directory of the project say "C:/gdsc".
3. Open a command window and run the command 
    ```cmd

    flutter build apk --release
4. The apk file can be found in "gdsc/build/app/output/flutter-apk/app-release.apk"
5. Intall the apk to a physical android device or an Android Virtual Device.

II. To view the source code, go to the lib folder. ("gdsc/lib")

The folder contains 4 files:-
1. main.dart -> Starting point of the app. Contains the Scaffold and Theme Data
2. home_page.dart -> Contains the home_page layout. The cards are built here. The api is called in this file. And the objects are displayed using FutureBuilder() and ListView.builder() functions.
3. bottom_bar.dart -> Contains the layout of the bottomModalSheet widget.
4. model.dart -> Contains a model class which acts as a blueprint for the data supplied by the api.
