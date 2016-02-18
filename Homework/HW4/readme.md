# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) Assignment 4: Data Structures

### PROMPT

**Goal**: *Learn about deploying Swift data structures to hold app state and use basic iOS design patterns.*

In this project, you'll demonstrate using data structures to store user input, a common way of using **delegation**, and how to use **notifications** to respond to keyboard events. Before you get started, you'll want to have a good understanding of Arrays and Dictionaries.

We'll cover the following technical topics in this assignment:

* Data Structures
* App State
* iOS Design Patterns

**VIDEO:** We've provided a video that shows how this app should behave. Before you jump in, take a look at the [sample deliverable](https://youtu.be/q4fU_W-RQh8)!

**You will be working individually for this project**, but we'll guide you along the process and as you go.

---

### DELIVERABLES

Your app must:

* use an Array to hold a list of items,
* use a Dictionary to hold a set of paired data points,
* use common Cocoa design patterns including notifications and delegates, and
* follow the specific scene requirements and constraints below.


#### View Controller 1: ListViewController - Holding data with Arrays

![](../img/array1.png)
![](../img/array2.png)

**Part 1**: Create a Scene that shows a text field at the top and a table view below. Add constraints properly.

* Note: The provided project will already contain a `UIBarButtonItem` that segues to the next Scene.

**Part 2**: Enable the user to enter items in a text field and see them in a list (table view) below.

After the user taps on the text field, enters an item (e.g. pick up groceries), and taps Return, the app displays the item in the table view and clears the text field.

What's required?

* Declare that the `ListViewController` will conform to the `UITableViewDataSource` protocol (and optionally, to `UITableViewDelegate`).
* Add a property to the `ListViewController` of type Array of String. Use this to store the user's inputs.
* Implement `tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int`.
* Implement `tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell`.
* Remember to add a table cell prototype to your `UITableView` and give it a unique identifier.


#### View Controller 2: PairViewController - Holding data with Dictionaries

![](../img/key_value.png)
![](../img/key_value2.png)

**Part 3**: This Scene is similar to the last, but instead, it will prompt the user with _two_ text fields. The first will hold unique values (e.g. like a person's mobile phone number), and the second will hold something those values refer to (e.g. the person's name).

The desired behavior is for a user to enter a value in each text field, and after tapping Return, display both values in the list below the text fields. To complete this part, add 2 `UITextField`s and a `UITableView` to the `PairViewController`.

**Part 4**: In this section, you'll using a Dictionary instead of an Array to hold pairs of user input.

What's required?

* Like the previous problem, declare that the `PairViewController` will conform to `UITableViewDataSource` (and optionally, to `UITableViewDelegate`).
* Add a property to the `PairViewController` of type Dictionary from String to String. Use this to store the user's inputs.
* The first (left-hand) text field will be stored as a key of a new key-value pair in the Dictionary; store the second as the pair's value.
* Implement `tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int`.
* Implement `tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell`.
* Remember to add a table cell prototype to your `UITableView` and give it a unique identifier.


#### Behaviors with Notifications

**Part 5**: Make the background of all text boxes _blue_ when the keyboard shows and _red_ when it disappears.

* Use `UIKeyboardWillShowNotification` and `NSNotificationCenter`.


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
3. __Distribution__: Did you deploy your application to GitHub Pages? Can my instructor build and run my app?

Score | Expectations
----- | ------------
**0** | _Incomplete._
**1** | _Does not meet expectations._
**2** | _Meets expectations, good job!_
**3** | _Exceeds expectations, you wonderful creature, you!_

This will serve as a helpful overall gauge of whether you met the assignment goals, but __the more important scores are the individual ones__ above, which can help you identify where to focus your efforts for the next project!

---
### RESOURCES

* [Overview of data structures in Swift](https://developer.apple.com/library/prerelease/mac/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html#//apple_ref/doc/uid/TP40014097-CH8-XID_168)
* [Delegate patterns commonly seen in iOS](https://developer.apple.com/library/prerelease/mac/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html#//apple_ref/doc/uid/TP40014097-CH8-XID_168)
* [Notification patterns commonly seen in iOS](https://developer.apple.com/library/mac/documentation/General/Conceptual/DevPedia-CocoaCore/Notification.html#//apple_ref/doc/uid/TP40008195-CH35-SW1)
* [NSHipster (a fabulous reference about the power of notifications](http://nshipster.com/nsnotification-and-nsnotificationcenter/)
* [Bonus material: Advanced data structures](http://waynewbishop.com/swift)
