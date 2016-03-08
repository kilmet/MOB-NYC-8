# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) MID-COURSE PROJECT

### PROMPT

**Goal**: *Build a clone of the iOS calculator app from scratch.*

Use the tools we’ve covered so far to build a template for a copy of the iOS calculator, flesh out its UI and build its data models. In order to get exposure to technical speaking, you will also have the option of giving a short technical presentation to the class on a number of preselected topics.

**You can work individually or in pairs for this assignment**.

---

### DELIVERABLES

  * Build an app from scratch, without an existing codebase.
  * Create a simple (no persistence, no networking) app with defined, familiar and expected behavior.
  * Build the end-to-end components required for a simple utility app including models, views and controllers.
  * Communicate an app idea/technical architecture to a technical audience.
  * Use a basic task tracking system to break up your project into granular tasks.


#### Requirements

**Your app must**:
  * Have a number display, which displays either the current input or the result of the desired calculation.
    * Format: App contains screen numerical display that adjusts to button taps.
  * Have a number keypad that supports input of 0-9 and decimal points.
    * Format: App contains screen with desired buttons that adjust calculator display accordingly.
  * Have an equals button that evaluates the desired calculation.
    * Format: App contains screen with equals button.
  * Add, multiply, subtract, divide both positive and negative integers and floats
    * Format: App contains screen with desired buttons that work accordingly for all integers, floats and signs.
  * Have a ‘percent’ button.
    * Format: App contains percent button which divides currently displayed number by 100.
  * Have ‘Clear’ and ‘All Clear’ buttons.
    * Format: App contains screen with clear and all clear buttons’. ‘Clear’ clears the current display, and ‘All Clear’ (clears the entire calculation).
  * Have a +/- button.
    * Format: App contains screen with +/- button that inverses displayed number’s sign.
  * Support portrait orientation.
    * Format: App works in portrait mode, but does not necessarily work in landscape mode.

#### Bonus

**Your app can:**

* Handle errors (e.g. divide by zero)
  * Format: App displays ‘Error’ when given an impossible calculation to compute
* Handle very large or small numbers (e.g. 1e+18)
  * Format: App displays extremely large and small numbers in order of magnitude format (e.g. 1e+20)/
* Have a UI that closely matches the Apple calculator UI or another similar, aesthetically pleasing calculator app
  * Format: App UI is aesthetically pleasing.
* Support memory functions (mc, m+, m-, mr)
  * Format: App contains memory function buttons that are functional.
* Support some or all of the additional mathematical features seen in the iOS calculator’s landscape mode (e.g. trig functions, parens, exponents, random numbers, etc).
  * Format: App contains some or all additional mathematical functions.

**You/your group can:**

  * Give a short presentation on a number of preselected topics from week 6. Topics include:
    * The various ways to lay out views: Springs & struts vs autolayout, code vs interface builder.
    * Keeping track of values in your calculator: Where is your data stored and how do you change it?
    * Mapping buttons to actions: Where does the action taken when you tap on a button live? How do you connect them?

  * Format: A less than 5 minute presentation on how your team approached one of the above topics. Include discussion of possible alternate implementations, how they might work, and why yours is preferable.



---
### SUBMISSION

* A final app project with **code, resources, project file, app description and screenshots** uploaded to your Github repo.
* Send your **Github page link** to the instructional team via email/Slack.
* A **README** on your repo with explanations of the approach taken.
* Optional presentation on technical topic.

---
### TIMELINE

| Deadline | Deliverable|
|:-:|---|---|
| Week 6 (end of day 1) | Project groups assembled & rough UX completed (though not functional) |
| Week 6 (end of day 2) | Basic buttons (numbers and arithmetic operators) working and hooked up |
| Week 7 (day 1) | Remaining buttons hooked up and functional, project due |

---

### EVALUATION

Your assignment will be evaluated by your instructor(s) in the following areas:

* __Stability & Performance__: Code does not have major bugs and correctly uses all APIs. No significant performance issues. Edge cases caught and errors handled and surfaced correctly. No obvious crashes on manual code.

* __Style & Readability__: Consistent style throughout codebase that aligns with other iOS APIs. Commented well. Variable and function names are clear and consistent.

* __OO and App Design__: No tightly coupled classes. All classes do one thing and do it well. Elegant use of iOS design patterns and extensive use of inheritance/OO concepts. Minimal code duplication.

* __App Readiness__: App is usable and has an easily understandable. No major bugs for common or 'error' use cases.

* __Execution & Scope__: Meets all required features plus some bonus features. Work items tracked on task tracker.

* __Presentation & Communication (Optional)__: Present team's implementation and alternative implementation. Efficiently communicate an elegant argument for chosen implementations. Answer questions and tradeoffs between chosen and alternate implementations.


Score | Expectations
----- | ------------
**0** | _Incomplete._
**1** | _Does not meet expectations._
**2** | _Meets expectations, good job!_
**3** | _Exceeds expectations, you wonderful creature, you!_

This will serve as a helpful overall gauge of whether you met the assignment goals, but __the more important scores are the individual ones__ above, which can help you identify where to focus your efforts for the next project!

#### Rubric: [Click here for the complete rubric](./midterm-rubric.md).

---
### RESOURCES

* Trello (optional task tracking)
* iOS frameworks (frameworks)

#### Suggestions for Getting Started

* Start simple when it comes to UX. This app does not need to be a complete UI clone of the iOS calculator app, just a near functional clone.
* Start with researching how you can translate strings to numbers, and numbers to strings. What APIs will you need to use to display the numbers you want to display?
* Brainstorm what your model classes will look like, and how they will change. What do you need to store in your models?
* Once you’ve thought about all three, do your best to put all associated tasks on Trello. Try to be as specific as possible when specifying deliverables, especially if working in a team.
