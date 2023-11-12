**Assignment Flutter App with Back4App Integration**

**Name: AMRUTHAM TEJASWINI BITS ID: 2022mt93700**

**Reference links:**
https://www.back4app.com/docs/flutter/parse-sdk/parse-flutter-sdk

https://www.back4app.com/docs/flutter/parse-sdk/data-objects/flutter-crud

**Step 1: Set up Back4App**
1. Sign up for back4App => https://parse-dashboard.back4app.com/apps/b5c26f28-663c-4b19-babb-1c387a7f45e1/browser/Task
2. Create a new back4App and create a class named **Task** with Title(String) and Description(String)

teju
![Back4App](https://github.com/Amruthammm/CrossPlatform_Assignment_Task-App/assets/38911925/174de202-4117-45f4-be4f-f281b863db98)
teju

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

   ![image](https://github.com/Amruthammm/CrossPlatform_Assignment_Task-App/assets/38911925/8a021781-08fe-4265-b61e-83512624480e)


**Step 6: Initialize the Parse SDK in your Flutter app**
1. Go to lib/main.dart file and update keyApplicationId, keyClientKey, keyParseServerUrl which are copied from the Back4app ApplicationId, Client Id, ServerUrl respectively. 
   ![image](https://github.com/Amruthammm/CrossPlatform_Assignment_Task-App/assets/38911925/28008e0c-1b4f-4ad3-a46a-e452f3482ea4)
 


**Step: Added Insert, Update, Delete and view the Task Details**
1. Updated the code in the lib/main.dart file for Inserting, Updating, Deleting and viewing the Task Details in the Back4 app


**New Record Insertion**

![image](https://github.com/Amruthammm/CrossPlatform_Assignment_Task-App/assets/38911925/ac07e98e-e10d-4aaa-869d-47e5f27880ca)

![image](https://github.com/Amruthammm/CrossPlatform_Assignment_Task-App/assets/38911925/f92314c9-970c-425d-a9f4-d76db39be5ca)


**View the Task Details:**

![image](https://github.com/Amruthammm/CrossPlatform_Assignment_Task-App/assets/38911925/ef157e9f-583a-4fd3-8a1b-5c231701877a)


**Update the Task Details:**

![image](https://github.com/Amruthammm/CrossPlatform_Assignment_Task-App/assets/38911925/91ff8173-dc6a-4da4-9d28-8a68c57f845e)


**Delete the Task Details:**
Deleted the Second Task Details

![image](https://github.com/Amruthammm/CrossPlatform_Assignment_Task-App/assets/38911925/921381f9-ab26-4805-acee-df5dd00ea94c)




**Step 7: Additional Features: Added Scrolling Feature**

![image](https://github.com/Amruthammm/CrossPlatform_Assignment_Task-App/assets/38911925/41acf8e7-cf6e-4e09-b61b-d623986873a4)


![image](https://github.com/Amruthammm/CrossPlatform_Assignment_Task-App/assets/38911925/12d05e1f-a986-41c5-bd3f-9775bb2974b8)



