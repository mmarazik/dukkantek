# testapp

A new Flutter project.

## Getting Started

This project is a Flutter Assignment for a job opening by DukkanTek

The app has the following:
1) Login page where user can login with email and password or choose to signup, as there was no mock API for login, so the logic is made by simply retrieving all users and finding the user with the requested email and comparing the password. If user found and password match, user is logged in, otherwise "Invalid credentials" error will appear to the user

2) Signup page: collects basic info and posts to mock api, creating a user on the backend. Mock API can be checked on the following URL
https://625d5f174c36c7535773fdde.mockapi.io/api/v1/user

3) SignIn with google: As this is a test app and google allows only registered users to login, so if you want to test this feature please send a gmail account that you will be using to test and i can add to the allowed logins, send to may@aucegypt.edu, or use this testing account to sign in with google, dukkantek2022@gmail.com, password: “DukkanTek123!”

4) Home Page: with message "Welcome <full_name> <email>" and a top drop down menu with logout button to logout and go back to login screen.
