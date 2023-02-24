# Assignment 6

## Requirements

5/6 | Movies View Controller
:---: | :---
1/1 | Consistent color scheme via nav bar and tint color
2/2 | UISearchBar text is used to query movie results when "Search" is tapped
1/1 | Current search term saved to UserDefaults
1/1 | "Love" is default search term used on first launch
0/1 | Upon relaunch, search query defaults to last search term and displays search text

3/4 | Movies Collection View Cell
:---: | :---
0/1 | Cell uses a UIStackView to arrange content
1/1 | Adaptive layout allows for portrait and landscape on all phone sizes
2/2 | Uses average color of movie poster as cell background color

5/5 | Image Caching
:---: | :---
1/1 | MovieClient checks to see if image is in NSCache
1/1 | If so, uses cached image
1/1 | If not, downloads image using URLSession
1/1 | Downloaded image added to NSCache
1/1 | Placeholder image shown while waiting for download

7/7 | Filters View Controller
:---: | :---
3/3 | Release date sorting added to filters vc and data manager
2/2 | Changing filters or sorting updates the collection view
1/1 | Color popover matches color scheme
1/1 | UIStackView used to lay out views

5/5 | Detail View Controller
:---: | :---
1/1 | UIStackView used to layout views
1/1 | Movie poster image is prominent and maintains aspect ratio
1/1 | Description uses a UITextView to scroll if needed
0/1 | Displays release date
1/1 | Compass button opens movie preview in safari

5/5 | Data
:---: | :---
2/2 | Latest results from API stored in NSCache
2/2 | No network? Displays cached data
1/1 | Search bar reflects search regardless of live or cached data

3/3 | Dark Mode
:---: | :---
1/1 | Supports dark mode
1/1 | Text is visible in both light and dark mode
1/1 | Average background accounts for dark mode

11/12 | Code Quality
:---: | :---
2.5/3 | Fixed existing best practice issues
2.5/3 | Best Practice
2/2 | Well-Formatted
2/2 | Clearly Written
2/2 | Concise

3/3 | Miscellaneous
:---: | :---
1.5/1.5 | Compiles and runs with no warnings or errors
0.5/0.5 | `LaunchScreen.storyboard` has app name, student name, and CNET id
0.5/0.5 | Custom icon
0.5/0.5 | Cites sources

## Comments

Great work with functionality!

---

Strings are fragile and error-prone. Enums are type-safe and dynamic. `contentAdvisoryRating`
should be type `Rating`, and you should use that object type around the app. Wherever you see a
string type movei rating, it needs to be replaced with `Rating` type. And when using enums, instead 
of `if/else` statements, use switch statements.

Here's a snippet that needs improved:
```
if index == 0 {
    selectedRatingFilter = "g"
} else if index == 1 {
    selectedRatingFilter = "pg"
} else if index == 2 {
    selectedRatingFilter = "pg13"
} else if index == 3 {
    selectedRatingFilter = "r"
} else {
    selectedRatingFilter = "anyRating"
}
```

Where else in the app could this be utilized? (rhetorical question, just think about it)


## Score

### 47/50

