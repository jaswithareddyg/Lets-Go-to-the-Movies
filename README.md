# Let's Go to the Movies 🍿 (Swift)

Enhance your movie exploration experience with the "Let's Go to the Movies" application. This assignment uses iTunes API to display a list of movies.

## Movies View Controller

- ### UI Styling
  - Styled the application with a consistent color scheme.
  
- ### Search Bar Functionality
  - Implemented the UISearchBar in the navigation bar to perform a search against the iTunes API.
  - Queries the API when the user taps the "Search" button.
  - Saves the current search term to UserDefaults for future recall.
  - Displays the last search term as the default search when the app launches.
  - Initially use "love" as the default search term for Saint Valentine's day.
  - Ensures the table view is not empty, except for the first launch (briefly until "love" results are loaded).

## Collection View Cell

- ### UI Enhancement
  - Implemented the collection view cells using a UIStackView for better content organization.
  - Implemented MovieClient to cache images using NSCache.
  - Implemented a method to download images on-demand, not all at once.
  - Performs image downloads on a background queue.
  - Displays a placeholder image while real images are downloading.
  - Determines the average color of the movie poster image and set it as the cell's backgroundColor.
  - Adjusts text color for visibility.

## Filters View Controller

- ### Additional Sorting Filter
  - Added a filter to sort results by release date (releaseDate in the iTunes API JSON).
  - Added a "Release Date" filter.

## Detail View Controller

- ### UI Improvements
  - Used a UIStackView for the detail view controller .
  - Displays the movie poster image maintaining the correct aspect ratio.
  - Implemented the "Compass" button to open Safari for a movie preview using the provided iTunes URL.

## Data

- ### Caching
  - Cached the latest results from the iTunes API call using NSCache.
    - Shows cached results in the collection view when a network connection is unavailable or the request fails.
  - Updates the search bar's text field with the search term corresponding to cached results.

## Dark Mode

- ### Theme Adaptation
  - Implemented the app to work in both light and dark modes.
  - Adjust text colors or limit changes between light and dark modes for optimal legibility.

## Attributions

- [Asynchronously Loading Images into Table and Collection Views](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/asynchronously_loading_images_into_table_and_collection_views)
- [Increasing Performance Through Caching](https://www.hackingwithswift.com/example-code/system/how-to-cache-data-using-nscache)
- [Average Color of a UIImage using CIAreaAverage](https://www.hackingwithswift.com/example-code/media/how-to-read-the-average-color-of-a-uiimage-using-ciareaaverage)
- [Date Picker Tutorial](https://www.youtube.com/watch?v=fhRJ5HQjBIE)
- [UIStackView Tutorial](https://www.kodeco.com/2198310-uistackview-tutorial-for-ios-introducing-stack-views)
- [NSCache Documentation](https://developer.apple.com/documentation/foundation/nscache)
- [DispatchQueue Main Async](https://stackoverflow.com/questions/59615860/how-do-i-ensure-my-dispatchqueue-executes-some-code-on-the-main-thread-specifica)
- [UIAppearance for Dark Mode](https://stackoverflow.com/questions/48699048/what-does-dispatchqueue-main-async-and-completed-escaping-mean-in)

## Additional Information

- This project was developed using Xcode and Swift.
- For issues or questions, contact [(Jas) Jaswitha](mailto:jaswithareddyguntaka@gmail.com).

Explore the cinematic world with "Let's Go to the Movies" and enjoy an enhanced movie viewing experience! 🎬🍿
