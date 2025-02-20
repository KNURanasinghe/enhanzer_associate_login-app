# 📱 Flutter Mobile Login App

## 🚀 Overview
This is a simple Flutter mobile application that implements login functionality using an API. The app authenticates users with a username and password, then stores the received response in an SQLite database.

---

## 🛠️ Features
✅ User Login via API
✅ SQLite Database Integration
✅ Secure Data Storage
✅ Responsive UI

---

## 🔗 API Details
- **Authentication URL:** [Invoke API](https://api.ezuite.com/api/External_Api/Mobile_Api/Invoke)
- **Request Format:**
```json
{
  "API_Body": [
    {
      "Unique_Id": "",
      "Pw": "Welcome#5"
    }
  ],
  "Api_Action": "GetUserData",
  "Company_Code": "info@enhanzer.com"
}
```


- **Response Format:**
```json

{
  "Status_Code": 200,
  "Message": "GetUserData Mobile API Executed Successfully.",
  "Response_Body": [
    {
      "User_Code": "EZCMP1/EZUSR-1",
      "User_Display_Name": "eZuite Admin",
      "Email": "info@enhanzer.com",
      "User_Employee_Code": "EZCMP1/EZLOC2/EMP-7",
      "Company_Code": "EZCMP-1",
      "User_Locations": [],
      "User_Permissions": []
    }
  ]
}
```
## 📂 Project Structure
```
📂 flutter_login_app
├── 📁 lib
│   ├── 📄 main.dart (Entry point)
│   ├── 📁 screens
│   │   ├── 📄 login_screen.dart
│   │   ├── 📄 dashboard_screen.dart
│   ├── 📁 services
│   │   ├── 📄 api_service.dart
│   ├── 📁 db
│   │   ├── 📄 db_helperl.dart
│   ├── 📁 components
│   │   ├── 📄 custom_text_field.dart
│   ├── 📁 constant
│   │   ├── 📄 constants.dart
├── 📄 pubspec.yaml (Dependencies)
```

## 🛠️ Installation & Setup

1️⃣ Clone the repository
```
git clone https://github.com/your-repo/flutter-login-app.git
```
2️⃣ Navigate to project directory
```
cd flutter-login-app
```
3️⃣ Install dependencies
```
flutter pub get
```
4️⃣ Run the app
```
flutter run
```

## 🏗️ Dependencies Used

📌 http - For API calls

📌 sqflite - For local database storage

📌 path - For accessing database directory


## 🎥 Assignment Submission

📌 .APK file - Included ✅

📌 Source Code Folder - Included ✅

📌 Screen Recording - Included ✅

## ✨ Author

👨‍💻 Developed by: [KNU Ranasinghe]

📧 Contact: nidarshanauthpala90@gmail.com

🔗 LinkedIn: [My LinkedIn Profile](https://www.linkedin.com/in/knuranasinghe?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app)


## 🎉 Thank you for checking out my project! Happy Coding! 🚀
```
```
