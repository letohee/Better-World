BetterWorld — Charity Support & Reward App (Flutter)

BetterWorld is a mobile app that encourages users to support global charity projects through engagement and gamified rewards. Users earn points by interacting with the app, track progress toward charity goals, and manage their own profile — all powered by Firebase authentication and Firestore.

The app was created as part of a Mobile Platform Development university project.
It focuses on usability, accessibility, and real-time cloud data integration. 

Original design concept wirefra…

🎯 Purpose

Many users want to contribute to charitable causes but lack simple, engaging tools to track impact and stay motivated.
BetterWorld solves this by:

letting users choose a charity focus

collecting points via in-app activities

storing progress securely

showing charity updates and galleries

The app demonstrates real-world mobile concepts such as authentication, state management, cloud data syncing, and UI design principles. 

demo sheet completed (1)

📱 Core Features
👤 User Authentication

Sign up / log in with email & password

Secure Firebase authentication

Session management with logout


demo sheet completed (1)

🏠 Profile & Points

Displays username, location, current charity, and accumulated points

Real-time Firestore sync

Persistent user progress


demo sheet completed (1)

✏️ Edit Profile

Update profile name and location

Saves directly to Firestore


demo sheet completed (1)

❤️ Choose a Charity

Select from available charity projects

Selected charity appears on profile page

Supports future global expansion


demo sheet completed (1)

▶️ Watch Ads / Earn Points

Timer-based “watch ad” screen

Adds reward points on refresh

Demonstrates reward mechanics (future upgrade: real ad service)


demo sheet completed (1)

🖼 Charity Gallery

Showcase of charity imagery

Simple gallery layout (hover effect planned)


Original design concept wirefra…

🔄 Data Refresh

Refresh button fetches latest Firestore values


demo sheet completed (1)

🎨 Design & UX Principles

Material Design throughout

Blue + white palette for trust and clarity

Bottom navigation for intuitive page access

Clear instructions and icons for accessibility

Large buttons and readable typography


demo sheet completed (1)

Supports planned localization and multi-region content (Yemen, Palestine, Sahara). 

demo sheet completed (1)

🏗️ Tech Stack

Flutter

Firebase Authentication

Cloud Firestore

Provider/Stateful Widgets (state mgmt)

Dart

Android emulator + physical device testing

🚀 Getting Started
Prerequisites

Flutter SDK installed

Firebase project configured

Emulator or physical device

Setup
git clone https://github.com/your-username/betterworld.git
cd betterworld
flutter pub get


Configure Firebase:

1️⃣ Add your google-services.json / GoogleService-Info.plist
2️⃣ Enable Authentication → Email/Password
3️⃣ Create Firestore collections (e.g., users, points)

Run the app:

flutter run

🧪 Testing

Performed during development:

Firebase read/write tests

Registration / login flows

Charity selection

Real-time point updates

Team review + manual walkthroughs


demo sheet completed (1)

🔮 Future Enhancements

Real rewarded ad integration

Live donation & payment support

Leaderboards

Multi-language toggle

Currency formats

Live charity project feed

Gallery hover interaction completion


demo sheet completed (1)

👤 Author

Antoan Bachev
Mobile Platform Development — University Project
Student ID: N1112540 

Original design concept wirefra…

📜 License

This project is for academic and portfolio demonstration.
Commercial use requires permission and compliant API/charity integrations.