# Stars of Github

An iOS app built using the Clean Swift architecture. Stars of Github demonstrates show stared swift repositories in Github.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes

### Requirements

To run this project on your machine you'll need the latest version of:

#### Xcode
The default IDE for macOS and iOS, you can download it for free on the Mac [App Store](https://itunes.apple.com/br/app/xcode/id497799835).

#### CocoaPods

A dependency manager for Cocoa projects. You can [install](https://guides.cocoapods.org/using/getting-started.html) it with the following command:

```bash
$ [sudo] gem install cocoapods
```
#### Git

The versioning system used on the project, its latest version can be downloaded [here](https://git-scm.com/download/mac).

### Installation

1. Clone the project to your machine.
2. Inside the project folder, run  `$ pod install` on your terminal.
3. Open the `EmeraldComponents.xcworkspace` file with Xcode.

## Testing ✅

To be able to manually test the project and check for code coverage, execute the following steps:
1. Open the `StarsOfGithub.xcworkspace` file.
2. Press `⌘` + `U`.
3. Open the `Report navigator(⌘ + 9)` tab in the left Navigator.
4. Select the `{} Coverage` option on the list.
5. A coverage for the whole project and classes should be seen.

When opening a file the Editor Screen displays a green, red or stripped color on its left side of all executable code, showing which part of the code is being covered by tests. It doesn't mean that the method was indeed tested, it just indicates that a test method passed through that line of code while executing.

If you don't see that indication, enable it by going to `Editor > Show Code Coverage`.

## Code Quality

In order to always maintain the best quality of code and make sure of our code maintainability  we use a couple of premises in our development and distribution pipelines.

### SwiftLint

We use [SwifLint](https://github.com/realm/SwiftLint) as our linter to make sure we won't have structural problems or any bad practices on the code, you can find the rules applied to the project on our lint file [here](https://github.com/stone-payments/emerald-components-ios/blob/master/.swiftlint-ci.yml).
