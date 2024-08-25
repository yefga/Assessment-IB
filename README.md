# Assessment IndoBytes

## Project Overview
This project demonstrates a SwiftUI application built using Model-View-ViewModel (MVVM) architecture. It showcases a user list and user detail feature, incorporating various UI components and network operations.

## Prerequisites
Xcode 14 or Higher


## Project Structure
The project is organized into the following main folders:

1. App: Contains the core app logic, including:
2. Modules: Houses reusable modules like network error handling and reachability management.
3. Features: Implements specific functionalities, such as:
        
    - UserDetailFeature: Displays detailed information about a selected user.
    - UserListFeature: Presents a list of users.
4. Domains: Defines the data model and business logic:
    - UserDomain: Encapsulates user-related data and operations.
    - Entities: Represents the User data structure.
    - Interface: Defines protocols for data access and manipulation.
    - Source: Implements data access logic.
5. Components: Houses custom UI components like CirclePlaceholderView and UserItemView

## Preview
![figure description](demo.gif){width=200}
