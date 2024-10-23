# **E-Commerce App Powered by Firebase Cloud, Firestore, and GetX**

This is a dynamic, modern e-commerce mobile application built using Flutter, Firebase Cloud, Firestore, and GetX for state management. The app supports user authentication via Google, Facebook, or email/password and provides profile management features, including editing the user profile and adding profile images. The app also includes theming (light mode/dark mode) and reusable widgets for a consistent UI experience.

## **Table of Contents**
- [Features](#features)
- [Technologies Used](#technologies-used)
- [App Architecture](#app-architecture)
- [Reusable Widgets](#reusable-widgets)
- [Theming and Styling](#theming-and-styling)
- [User Authentication](#user-authentication)
- [Profile Management](#profile-management)
- [Installation](#installation)
- [Contact](#contact)

## **Features**
- **User Authentication**: Supports sign-up and login with Google, Facebook, or email/password.
- **Profile Management**: Users can edit their profile, change their profile image, and update other personal information.
- **Theming**: Dynamic light mode and dark mode themes, easily switched via GetX.
- **Reusable Widgets**: Reusable UI components for a consistent user experience.
- **Real-time Data**: Product listings and user interactions are powered by Firebase Firestore, ensuring real-time synchronization.
- **Secure Storage**: Firebase authentication ensures secure user data management and access.

## **Technologies Used**
- **Flutter**: For building the cross-platform mobile application.
- **Firebase Cloud & Firestore**: For user authentication and real-time database management.
- **GetX**: For state management, navigation, and theming.
- **Google/Facebook Auth**: For user authentication options.
- **Dart**: Programming language for Flutter development.

## **App Architecture**
- **MVVM (Model-View-ViewModel)**: The app follows the MVVM architecture to separate UI (View), business logic (ViewModel), and data (Model), ensuring clean, maintainable code.
- **Firebase Integration**: The app integrates Firebase services for both authentication and Firestore for managing product listings, user profiles, and more.
- **State Management with GetX**: All state changes, navigation, and theming are managed using GetX, ensuring a reactive and organized application.

## **Reusable Widgets**
The app is built with reusable components to ensure consistency and efficiency. Examples of reusable widgets include:
- **Custom Buttons**: Used across the app for actions like login, signup, and adding items to the cart.
- **Text Fields**: Custom-designed text fields for user input.
- **Product Cards**: Reusable cards for displaying product information in a grid or list format.

## **Theming and Styling**
- **Light Mode/Dark Mode**: The app supports both light and dark themes, which can be toggled by the user. The theming is handled dynamically using GetX.
- **Custom Styles**: Each component, like buttons, text, and cards, has its own style for both light and dark modes, ensuring a consistent look throughout the app.
- **GetX Theme Switching**: The theme switching is done seamlessly without needing to restart the app, using `Get.isDarkMode` for efficient UI updates.

## **User Authentication**
- **Google Authentication**: Users can sign in with their Google accounts.
- **Facebook Authentication**: Facebook login integration for easy user access.
- **Email/Password Authentication**: Users can sign up and log in using traditional email and password methods, with password reset options included.

## **Profile Management**
- **Profile Editing**: Users can edit their name, email, and other personal information.
- **Profile Picture**: Users can upload or update their profile picture using Firebase storage.
- **Profile Data**: All user data is securely stored and retrieved from Firebase Firestore.

## **Installation**

To get started with this project, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/MohsenBahaj/ecommerce-app.git
