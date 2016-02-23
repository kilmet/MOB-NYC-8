# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) Assignment 5 : Views

### PROMPT

**Goal**: *Get familiar with various layout techniques by creating customized view layouts using Auto Layout.*

Create an app that contains a series of screens that employ various layout combinations and that respond to rotation. You'll be working with **Auto Layout** and get more experience with table views.

You'll want to have a good understanding of springs and struts before you get started. Read through the [Auto Layout documentation](https://developer.apple.com/library/prerelease/ios/documentation/UserExperience/Conceptual/AutolayoutPG/index.html), especially about how to create "constraints."

**You will be working individually for this project**, but we'll be guiding you along the process and helping as you go. Show us what you've got!

---

### DELIVERABLES

Your app must:

* lay out content using Auto Layout, not Springs-and-Struts,
* accommodate layouts in portrait and landscape orientations,
* create content in scroll views, and
* follow the specific requirements and constraints below.


#### View Controller 1 - Basics

![](../img/view1.png)
![](../img/view1_1.png)

A view controller using Auto Layout that contains:

* A red box (a UIView 10 points tall and spans the width of the screen) positioned just below the navigation bar.
* A black box (a UIView 10 points tall and spans the width of the screen) positioned just above the bottom toolbar.

*The boxes should stay in place and span the screen in portrait and landscape orientations.*


#### View Controller 2 - Corners

![](../img/view2.png)
![](../img/view2_1.png)

A view controller that contains:


#### View Controller 3
* **(Bonus Round!)** This is optional. Use Masonry to complete the same requirements as view controller 2.

* Four blue boxes (20 points by 20 points), one in each corner of the scene. When the device rotates, make sure the squares stay pinned to their respective corners.

#### View Controller 3 - UIScrollViews

![](../img/view4.png)
![](../img/view4_3.png)

A view controller that contains:

* A scroll view that takes up the entire scene.
* The content of the scroll view should be:
  * A single UIView called "Content View", which in turn contains:
    * A blue rectangle 20 points tall with 10 points margin on all 4 sides.
    * A label 1,000 points high with 10 points margin on the leading and trailing edges, which is also 10 points from the blue rectangle above. It should have a purple background and horizontally centered white text saying, well, whatever you want.
    * Then a red rectangle 20 points tall and 10 points margins on all sides at the bottom.
* Remember to set the proper constraints on "Content View" to make it


#### View Controller 4 - Centered Button

![](../img/view5.png)
![](../img/view5_1.png)

A view controller that contains:

* A green button (75 points by 75 points) with a 1-point-thick red border and white text placed in the center of the scene.
* The button should stay centered in portrait and landscape orientations.
* When the button is tapped, its background color should turn red. On the next tap, it should turn green.


#### View Controller 5 - Table Views and Cell Layouts

![](../img/view6.png)
![](../img/view6_1.png)

A view controller that contains:

* A table view with cells that each contain a centered label containing the text "Row {X}" (in which X is the row number of the cell).
* Do this by creating a custom cell and adding a label to it. Position the label within the cell using constraints.
* Remember to give the cell an identifier to refer to it in code.
* Give the label an integer "tag" attribute (e.g. 101), and is `viewWithTag` to get a reference to the label in your code when creating the `UITableViewCell` instance.


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

* [Apple’s official guide to Auto Layout](https://developer.apple.com/library/prerelease/ios/documentation/UserExperience/Conceptual/AutolayoutPG/index.html)
* [Yet another Auto Layout guide, with lots of code snippets!](http://www.raywenderlich.com/20881/beginning-auto-layout-part-1-of-2)
* [Big Nerd Ranch’s tips and tricks for Auto Layout:](http://www.bignerdranch.com/blog/ios-autolayout-fun-facts-and-tips/)
* [Auto Layout wrapper with pleasing syntax](https://github.com/Masonry/Snappy)
