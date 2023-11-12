**Assignment Flutter App with Back4App Integration**

**Name: AMRUTHAM TEJASWINI BITS ID: 2022mt93700**

**Reference links:**
https://www.back4app.com/docs/flutter/parse-sdk/parse-flutter-sdk

https://www.back4app.com/docs/flutter/parse-sdk/data-objects/flutter-crud

**Step 1: Set up Back4App**
1. Sign up for back4App => https://parse-dashboard.back4app.com/apps/b5c26f28-663c-4b19-babb-1c387a7f45e1/browser/Task
2. Create a new back4App and create a class named **Task** with Title(String) and Description(String)

![Back4App](https://github.com/Amruthammm/CrossPlatform_Assignment_Task-App/assets/38911925/84b5334d-05e5-4340-9c0f-cf6e774fe1b2)

**Step 2: Pre-Reqs**
1. Install flutter on Windows => Download the flutter SDK => Extract the downloaded Zip file to a location on your computer and Add the flutter bin directory to your System PATH
2. Install Andriod Studio
3. Setp up an Emulator a) Open Andriod Studio => Virtual Device Manager b) Create a Device and download c) Run the Emulator and Check.

**Step 3: Verify Installation**
1. Run 'flutter doctor' on terminal and look for errors and ensure there are no errors. 


**Step 4: Flutter Setup**
1. Create a New Flutter Project => 'flutter create mytask' 
2. Open the project in the Andriod Studio.

**Step 5:Update Dependency in pubspec.yaml**
1. Add the required dependencies to your pubspec.yaml file.

![pubspec](https://github.com/Amruthammm/CrossPlatform_Assignment_Task-App/assets/38911925/75d35c5b-b2f9-4ebd-9b24-7dbc11645e10)


**Step 6: Initialize the Parse SDK in your Flutter app**
1. Go to lib/main.dart file and update keyApplicationId, keyClientKey, keyParseServerUrl which are copied from the Back4app ApplicationId, Client Id, ServerUrl respectively. 

![Parse_SDK](https://github.com/Amruthammm/CrossPlatform_Assignment_Task-App/assets/38911925/d4317477-baf1-476f-9df9-0ecc7eed99e6)


**Step: Added Insert, Update, Delete and view the Task Details**
1. Updated the code in the lib/main.dart file for Inserting, Updating, Deleting and viewing the Task Details in the Back4 app


**New Record Insertion**
![New Record](https://github.com/Amruthammm/CrossPlatform_Assignment_Task-App/assets/38911925/27971d6e-2d3f-4556-9d9d-860c22dd3556)

![New Record_Added](https://github.com/Amruthammm/CrossPlatform_Assignment_Task-App/assets/38911925/0d8c06ed-c809-4e2e-abc2-0b90b3f6aba4)


**View the Task Details:**

![View_the_Task_Details](https://github.com/Amruthammm/CrossPlatform_Assignment_Task-App/assets/38911925/d2ff55e3-e38c-405e-8162-963b8ae1e76f)

**Update the Task Details:**

![Update_the_Task_Details](https://github.com/Amruthammm/CrossPlatform_Assignment_Task-App/assets/38911925/3b5e69bd-97b8-4015-bc80-642d9e3d603c)


**Delete the Task Details:**
Deleted the Second Task Details

![Delete_the_Task_Details](https://github.com/Amruthammm/CrossPlatform_Assignment_Task-App/assets/38911925/26689eeb-6c5b-4f39-a799-87afe1a20fb7)


**Step 7: Additional Features: Added Scrolling Feature**

![Added_Scrolling_Feature1](https://github.com/Amruthammm/CrossPlatform_Assignment_Task-App/assets/38911925/aad40da7-a55d-4372-9d1d-d9384ec67b12)

![Added_Scrolling_Feature2](https://github.com/Amruthammm/CrossPlatform_Assignment_Task-App/assets/38911925/5efa2aa1-6693-4eb3-bb0d-7210630cec11)


