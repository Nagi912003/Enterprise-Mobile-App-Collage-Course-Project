# Enterprise Mobile App - Collage Course Project

This enterprise mobile app, developed collaboratively by my friend Youssef Hassan and I (nagiElshershaby) as part of a collage course project, incorporates API integration and offers a range of features. The app utilizes RX Dart, Inherited Widget, and Provider State Management to ensure efficient data flow and a seamless user experience.

Key Features:

Login Screen: Provides a login interface for users, returning either a login success or login failure response.

Signup Screen: Enables users to register with the app, validating various data fields. The signup process includes the following mandatory and optional fields:

Company Name
Contact Person Name
Company Industry (Checkbox List, optional)
Contact Person Phone Number (validated structure, mandatory)
Email (validated structure, mandatory)
Company Address (mandatory)
Company Location [Longitude - Latitude] (mandatory)
Company Size (options: Micro, Small, Mini, Large - optional)
Password (at least 8 characters, mandatory)
Confirm Password (matching password field, mandatory)
The signup process fails if any of the mentioned conditions are not met.

Edit Profile Screen: Allows users to edit their profile, including the ability to add a profile photo from the gallery or using the device's camera. The HTTP plugin is utilized for image handling.

Business Services List Screen: Displays a list of all available business services.

Favorite Services Screen: Allows users to add business services to their favorite services list.

Favorite Business Services List Screen: Presents a list of all favorited business services.

Company Profile Screen: Displays the profile of a selected business service provider.

Distance Calculation Screen: Calculates and presents the distance between the user's current location and the address of a business service provider.

Business Services by Company Screen: Shows a list of all business services offered by a specific company.

Search by Service Screen:

Allows users to select a service from a list.
Displays search results as a list of companies providing the selected service.
Offers a map view of the search results, showcasing the locations of companies providing the service.
Selected Search Result Screen: Shows the distance and provides directions between the user's current location and the selected company.


 

10. Create a screen for search by service:  
10.1. Select a service from a list 
10.2. Then view search results as a list of all companies that provides this service 
10.3. Change view of search results as map view for all companies that provides this service 
11. Select one of the search results: View the distance and directions between your current location and 
the selected company 
