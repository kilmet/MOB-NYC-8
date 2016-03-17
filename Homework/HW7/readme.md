# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) Assignment 6 : Persistence

### PROMPT

**Goal**: *Store data across app sessions and gain familiarity with iOS file input/output methods.*

In this assignment you'll be creating an app that "persists" user data using different techniques. You'll build a series of scenes, each prompting for data to be written to various **persistent stores** (flat files, plists, `NSUserDefaults`), and consequently reading that data.

**VIDEO** We've outlined the steps to help you to be able build what you need. You can take a look at [sample deliverable](https://youtu.be/rnanrQMjYqQ) to get started.

**You will be working individually for this project**, but we'll be guiding you along the process and helping as you go. Show us what you've got!

---

### DELIVERABLES

Your app must include:

* Use flat files and property lists (.plist files) to store user input to be recalled later.
* Create an array from a piece of space-separated text.
* Split a string by spaces and save the resulting array to a property list.
* Follow the specific screen requirements and constraints below.

#### View Controller 1 - NSUserDefaults

![](../img/default.png)
![](../img/default2.png)

* The view controller should contain a text view that displays the values of the keys `test_string` and `test_number` from `NSUserDefaults`.
* There should be a button titled "Next" in the navigation bar that when tapped segues to the next view controller below.

#### View Controller 2 - Settings Bundle

![](../img/test.png)
![](../img/replacetest.png)

* This view controller should also contain a single text view.
* When the view controller loads, it should read two values from `NSUserDefaults`, one String and one Double, using keys of your choosing.
* These values should be set by a text field and slider, respectively, placed into the Settings Bundle of the app, accessible through the iOS "Settings" app.
* This means you'll have to create a Settings Bundle, add a text field and slider to it, then give them values by navigating to Settings > "Your App's Name" to give those fields values.
* For information about implementing a Settings Bundle (which utilizes `NSUserDefaults`), see the [Apple Documentation](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/UserDefaults/Preferences/Preferences.html).

#### View Controller 3 and 4 - Flat Files

![](../img/text.png)
![](../img/text2.png)
![](../img/flatfile2.png)

* View controller #4 should contain a single text view.
* When the user taps the "Next" button, save the text in this text view into a flat file.
* When the next view controller loads (#5), read that same file and display its contents in its single text view.

#### View Controller 5 and 6 - Property Lists

![](../img/flatfile3.png)
![](../img/flatfile4.png)

* View controllers #5 and #6 should each contain a single text view.
* When view controller #5 dismisses, it should save all the words in the text view into an Array of Strings stored in a property list file. For example, "a b c" will be saved as ["a", "b", "c"].
* Then when view controller #6 loads, read the saved Array from the property list file, join its elements by single spaces into a single String, then display that String in the text view.

---

### SUBMISSION

* A working **XCode project**, built by you, uploaded to your Github repo.
* Send your **Github page link** to the instructional team via email/Slack.
* A **README** file on your repo with explanations of the approach taken.

---

### EVALUATION

Your assignment will be evaluated by your instructor(s) in the following areas:

1. __Technical Requirements__: Did you deliver a project that met all the technical requirements?

2. __Code Quality__: Did you follow code style guidance and best practices covered in class?

3. __Deployment__: Did you deploy your application to GitHub Pages? Can my instructor build and run my app?

Score | Expectations
----- | ------------
**0** | _Incomplete._
**1** | _Does not meet expectations._
**2** | _Meets expectations, good job!_
**3** | _Exceeds expectations, you wonderful creature, you!_

This will serve as a helpful overall gauge of whether you met the assignment goals, but __the more important scores are the individual ones__ above, which can help you identify where to focus your efforts for the next project!


---
### RESOURCES

* [Beginning iOS Development: Data Persistence](http://code.tutsplus.com/tutorials/beginning-ios-development-data-persistence--mobile-4645)
* [Core Data Programming Guide ](https://developer.apple.com/library/tvos/documentation/Cocoa/Conceptual/CoreData/index.html#//apple_ref/doc/uid/TP40001075-CH2-SW1)
