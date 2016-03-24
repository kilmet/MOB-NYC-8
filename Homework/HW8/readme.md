# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) Assignment 7 : Networking

### PROMPT

**Goal**: *Create simple network connections from a Swift playground*

This assignment will give you experience with several ways to make and handle **network requests** and will give you a starting point for integrating networking in your final project. You'll also gain familiarity how to handle networking errors.

We've outlined the steps to help you to be able build what you need. Take a look at the examples provided below.

**You will be working individually for this project**, but we'll be guiding you along the process and helping as you go.

---

### DELIVERABLES

Your must:

* use a Swift playground to execute iOS network requests in various ways outlined below.

#### Part 1: Connect to Google

* Write a function that makes a network connection to http://google.com and uses NSURLSession networking APIs.
* Print out the results to the console.

![Example of Result](http://s18.postimg.org/u5qznultl/Screen_Shot_2015_09_27_at_2_42_00_PM.png)

#### Part 2: Failure to Connect

* Write a function that makes a network connection to http://generalassemb.ly/foobar.baz and uses NSURLSession networking APIs.
* Print out the status code and body of the response to the console.

![Example of Status Code](http://s17.postimg.org/w93cbqbe7/Screen_Shot_2015_09_27_at_2_45_16_PM.png)


#### Part 3: JSON

* Write a function that makes a network connection to [openweathermap](http://api.openweathermap.org/data/2.5/weather?q=New%20York,US) and uses NSURLSession networking APIs.
* Create a class that represents the JSON response, i.e. a model and populate this class with the JSON response from the GET use NSJSONSerialization.
* Print out the class to the console.

![Example of Model](http://s22.postimg.org/cxmabyv4x/Screen_Shot_2015_09_27_at_3_04_31_PM.png)


#### Part 4: JSON + SwiftyJSON

* Write a function that makes a network connection to [openweathermap](http://api.openweathermap.org/data/2.5/weather?q=New%20York,US) and uses NSURLSession networking APIs.
* Using the already created class from Part 3, populate a your model class, but this time, use SwiftyJSON.
* Download the SwiftyJSON.swift source file and drag it into the "Sources" folder in the Playground.
* Print out the model on the console.


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

* [The de-facto iOS networking library](http://afnetworking.com)
* [AFNetworking done the Swift way ](https://github.com/Alamofire/Alamofire)
* [Apple’s networking overview](https://developer.apple.com/library/ios/documentation/NetworkingInternetWeb/Conceptual/NetworkingOverview/Introduction/Introduction.html)
