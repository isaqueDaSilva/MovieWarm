# Table of Contents
1. [Description](#description)
2. [Getting started](#getting-started)
3. [Usage](#usage)
4. [Arhitecture](#arhitecture)
5. [Structure](#structure)
6. [API](#api)
7. [Workflow](#workflow)
8. [Demonstration](#demonstration)

# MovieWarm
The best way to register your thoughts about the movies that you watch.
 
# Description
<p>The Movie Warm project is an app that helps users to anotates your thinking about the movies that he watched, with a simple and elegant way.<br>

It's design to turn the usage more straight to the point, and no distraction or hard UI.<br> 

And to improviment even more the user experience, I integrated the OMDb API to fetch the data about the movie to displayed some movie details for user, beyound the your thoughts and reviews about the movie.</p>

# Getting started
<p>
1. Make sure you have the Xcode version 15.3 or above installed on your computer.<br>
2. Download the Movie Warm project files from the repository.<br>
3. Access the OMDb API website and creates a new API Key.<br>
4. Opens the project files in Xcode.<br>
5. Creates a new "Config.xcconfig" file.<br>
6. Add your API in "Config.xcconfig" as following.<br>

```
API_KEY = {Sua API Key}
```
7. Run the active scheme.<br>

# Usage
When you open the project, click the + button and search some movie, review it, and then save.

# Architecture
* Movie Warm project is implemented using the <strong>Model-View-ViewModel (MVVM)</strong> architecture pattern.
* Model has any necessary data to fetch the Movie details and crating the Core Data schema.
* View is responsible for displaying the list of movies saved and your details.
* ViewModel handles any user input or interactions, update the Model and View as needed, and fetch the movies from the API.
* Project uses the <strong>Core Data</strong> to persist the movie's detail and review produced by user.<br>

# Structure 
* "Splash Screen": Contains a SwiftUI file with an animation that is displayed when the app is open;
- "Storage": Contains the all models and the default setting of the Core Data;
- "DTOs": Contains the all models that used by decoding a response that coming from the API after the fetch action is finised;
- "Extensions": Contains all custom extensions used by app;
- "Error": Conatins all erros used by app;
- "View": Conatins all subfiles that stores the all SwiftUI files and their ViewModels.<br>

# API 
* [OMDb API](http://www.omdbapi.com)

# Workflow

* Reporting bugs:<br> 
If you come across any issues while using the MovieWarm, please report them by creating a new issue on the GitHub repository.

* Reporting bugs form: <br> 

```
App version: 1.0
iOS version: 17.5
Description: When I tap on the "Delete Movie" button, the home view does not update the list of saved movies.
Steps to reproduce: Open some "Movie", tap on the "Delete Movie" button, tap on the "Delete" button in the alert, I'm directed back to the home view, and the movie's reference is there yet, but when I click it, the details view does't show any detail. 
```

* Submitting pull requests: <br> 
If you have a bug fix or a new feature you'd like to add, please submit a pull request. Before submitting a pull request, 
please make sure that your changes are well-tested and that your code adheres to the Swift style guide.

* Improving documentation: <br> 
If you notice any errors or areas of improvement in the documentation, feel free to submit a pull request with your changes.

* Providing feedback:<br> 
If you have any feedback or suggestions for the Movie Warm project, please let us know by creating a new issue.

# Demonstration
- [Click here](https://youtu.be/XWvWaojRgc8) to watch a little demonstration assistir of how app is working.
