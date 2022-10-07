<!-- #  JustThree -->

<h1 align="center">
    <!-- <img alt="Home Poker Table" title="Home Poker Table" src="https://github.com/san-ghun/JustThree/blob/main/docs/images/180.png" width="180"> -->
    <!-- <img alt="Home Poker Table" title="Home Poker Table" src="docs/images/180.png" width="180"> -->
    <a href="https://apps.apple.com/app/just-three-to-do/id6443702845?itscg=30200&amp;itsct=apps_box_appicon" style="width: 170px; height: 170px; border-radius: 22%; overflow: hidden; display: inline-block; vertical-align: middle;"><img src="docs/images/180.png" alt="Home Poker Table" style="width: 170px; height: 170px; border-radius: 22%; overflow: hidden; display: inline-block; vertical-align: middle;"></a>
    <br>
    Just Three - To Do
</h1>

<h4 align="center">
    Just Three, just focus on your essential, today!
</h4>

<p align="center">
    <img src="https://img.shields.io/badge/swift-5.7.0-blue.svg" />
    <img src="https://img.shields.io/badge/xcode-14.0.1-green.svg" />
    <img src="https://img.shields.io/badge/ios->15.0-yellow.svg" />
    <img src="https://img.shields.io/badge/licence-MIT-lightgrey.svg" />
    <br>
    <br>
    <a href="https://apps.apple.com/app/just-three-to-do/id6443702845" target="_blank">
        <img src = "https://devimages-cdn.apple.com/app-store/marketing/guidelines/images/badge-download-on-the-app-store.svg"> 
    </a>
    <a href="https://apps.apple.com/kr/app/just-three-to-do/id6443702845" target="_blank">
        <img src = "https://devimages-cdn.apple.com/app-store/marketing/guidelines/images/badge-download-on-the-app-store-kr.svg"> 
    </a>
</p>
<br>

> -. Second personal app development project.    
> -. One-person production, released on App Store.    
> -. A simple reminder & ToDo application to focus on the first three things for today.

<br>

\**Following contents are aimed for coders and developers, if you are not interested in those topics, please check more information on [Web Page for Just Three - To Do](https://san-ghun.github.io/JustThree/) or [App Store for Just Three - To Do](https://apps.apple.com/app/just-three-to-do/id6443702845). Thanks!* :)


## Table of contents
- [About JustThree](#about-JustThree)
- [Features](#features)
- [Folder Structure](#folder-structure)
- [Version History](#version-history)
- [What I Learned](#what-i-learned)
    - [From start to release](#from-start-to-release)
- [Future Work](#future-work)
- [License](#license)


## About JustThree

<p align="center">
<img src="docs/images/screenshots/0.png" width="130" />
<img src="docs/images/screenshots/1.png" width="130" />
<img src="docs/images/screenshots/2.png" width="130" />
<img src="docs/images/screenshots/3.png" width="130" />
<img src="docs/images/screenshots/4.png" width="130" />
<img src="docs/images/screenshots/5.png" width="130" />
</p>

- JustThree is a simple reminder & ToDo app built for people who are overwhelmed by too many Todos and reminders for their every day life, want to get out of the todo hell, and just focus on the essential.
- JustThree is aimed to let the user focus on their essential by displaying just three items on the main view, as simple as possible with satisfying animation.
- JustThree stores user's reminder or todo data only in user's device, using `UserDefaults` with coded saving key.
- With the goal of experiencing whole process from the start of the project to the launch, not only development, but also planning and design were carried out directly.
- Develop with `UIKit` using `Programmatic` way, in MVC pattern.

<details>
<summary>Captions for screenshots</summary>

> - **List view - Today section**    
    The main view of Just Three.    
    In Today section, the list view display just three items.    
    Letting user to focus on their top three objective for today.    

> - **List view - Dark Mode**    
    Just Three supports the Dark Mode.    
    With satisfying wave animation interact with ToDo items.    

> - **ToDo or Reminder view - View mode**    
    The item consist of the title, date, time, and note.    

> - **ToDo or Reminder view - Edit mode**    
    The title of itme is editable with text field.    
    The date and time of item is editable with date picker.    
    The note of item is editable with text view.    

> - **Add new ToDo or Reminder item**    
    Easy to add new item by tapping on the plus button on top-right of list view.    
    Present adding view modally, but similiar user interface with edit mode.    

> - **List view - All section**    
    Other sections than Today, like Future and All, do not limit the number of displaying items.   

</details>


## Features

- Simple interface with three types of view-controllers, built with UIKit, programmatically.
- Adopt the List Collection View using Diffable Data Source, Compositional Layout, and List Cell View Configuration.
- Satisfying wave animation built with `CABasicAnimation` and `CAShapeLayer`.
- Save user's data in `UserDefaults`.
- Support the accessiblity features for the iOS's VoiceOver.
- Support for Dark Mode.

## Folder Structure

```
.
├── JustThree.xcodeproj
├── JustThree
│   ├── Assets.xcassets
│   │   ├── AccentColor.colorset
│   │   ├── AppIcon.appiconset
│   │   └── icon.imageset
│   ├── Models
│   ├── ContentViews
│   ├── ViewController
│   │   ├── ReminderListViewController
│   │   ├── ReminderViewController
│   │   └── SettingListViewController
│   └── Base.lproj
└── docs
    ├── assets
    │   ├── css
    │   ├── js
    │   ├── sass
    │   └── webfonts
    └── images
        └── screenshots
```


## Version History

- Plan to update continuously.
- latest update: v1.0.0

> - v1.0.0: Release on App Store, 6 October 2022.
> - start: Initial commit, 23 September 2022.


<!-- ## App Analysis -->


## What I Learned

#### From start to release

> - **Period**: 18 September 2022 - 6 October 2022 (17 days)
> - **Time Taken**: 50 hours (Design + Development + Release)

- Planning
    - How to decide minimum requirements for app.
    - How to build and optimize the time table.
    - How to meet the deadline for progress.

- Design
    - How to make AppIcon.
    - How to choose a color palette.
    - How to design an app.

- Development
    - How to build UI with `UIKit` using `Programmatic` method.
    - Better understanding of `MVC` pattern and how to implement it.
    - Better understanding of `extentions` in project module.
    - Better understanding of `Data Source` and how to use `Diffable Data Source` in iOS project.
    - Better understanding of `UIView configuration` and how to implement it.
    - Better understanding of `UICollectionView` with `UICollectionViewCompositionalLayout`.
    - Better understanding of `accessibility` APIs that iOS support.
    - How to use `CAShapeLayer` and `CABasicAnimation` to make animations.
    - How to reduce CPU usage of the application and enhance the performance.
    - How to save and load data and store user data in `UserDefaults`.
    - How to find the memeory leaks in Xcode project.

<!-- - App Release & Marketing
    - How to make landing page for the app.
    - How to deal with the Privacy Policy.
    - How to upload app build to the App Store Connect.
    - How to fill the form of App Store Connect.
    - How to deal with App Review. -->

- etc.
    - `[weak self]` is essential to prevent the memory leak in app, keep in mind and understand.
    - Still, selecting the color is way much stressfull than I expected.
    - Being a regular user of the app has a big impact on the motivation for developing the app.
    
<!-- - During my production, the Google was like the Jesus who is there for me when I am in trouble, and the Apple Developer Documentation was like the Holy Spirit who enpower me to do more things than I could. Lol. Thanks LORD! -->


## Future Work
- [ ] keep on refactoring
    - [ ] add UIGestureRecognition support for edit mode.
- [ ] add documentation
- [ ] support widget for iOS
- [ ] better support for iPad
- [ ] add unit test
- [ ] add ui test
- [ ] add sound effect
- [ ] add visual effect
- [ ] add more setting options
- [ ] build with swiftui


## License

The MIT License (MIT)

Copyright (c) 2022 Sanghun Park

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
