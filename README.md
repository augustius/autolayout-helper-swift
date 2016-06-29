AutoLayoutHelper
=======================

`UIView` extension to easily create common Auto Layout Constraints for iOS.

### The Problem

Using Auto Layout programatically (before [iOS 9's Auto Layout API](http://bartjacobs.com/auto-layout-fundamentals-working-with-layout-anchors/)) can either be quite verbose i.e. building `NSLayoutConstraint` objects for each rule or error prone e.g. (using [Visual Format Language strings](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/AutolayoutPG/VisualFormatLanguage/VisualFormatLanguage.html))

### A Solution

We can make creating common `NSLayoutConstraint` relations into some reusable methods we can call on any class that subclasses `UIView`. We also ensure the constraint created gets added to the view's superview for you. 

This means you can relate a view to another view with the `NSLayoutAttribute` or `NSLayoutRelation` you need, as part of the view's setup and also helps us keep the code [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).

### Dependencies 

* [Xcode](https://itunes.apple.com/gb/app/xcode/id497799835?mt=12#)

### Requirements

* iOS 7+
* tvOS 9+

### Installation

- Add the `UIView+AutoLayoutHelper.swift` file to your Xcode project.
- **Note**. CocoaPods support and Dynamic Framework target both coming soon!

### Usage

#### Examples:

##### Fill superview

Add `NSLayoutConstraint` relations for a `UIView` relating its top, leading, trailing and bottom edges to it's superview 

    // Create view
    
    let leftView = UIView(frame: CGRectZero)
    leftView.backgroundColor = UIColor.redColor()
    self.view.addSubview(leftView)
    
    // Add constraints
        
    leftView.setTranslatesAutoresizingMaskIntoConstraints(false)
    
    leftView.addTopConstraint(toView: superview, attribute: NSLayoutAttribute.Top, relation: NSLayoutRelation.Equal, constant: 10.0)
    leftView.addLeadingConstraint(toView: superview, attribute: NSLayoutAttribute.Leading, relation: NSLayoutRelation.Equal, constant: 10.0)
    leftView.addTrailingConstraint(toView: superview, attribute: NSLayoutAttribute.Trailing, relation: NSLayoutRelation.Equal, constant: -10.0)
    leftView.addBottomConstraint(toView: superview, attribute: NSLayoutAttribute.Bottom, relation: NSLayoutRelation.Equal, constant: -10.0)

or shorter you can omit the attributes:
    
    leftView.addTopConstraint(toView: superview, constant: 10.0)
    leftView.addLeadingConstraint(toView: superview, constant: 10.0)
    leftView.addTrailingConstraint(toView: superview, constant: -10.0)
    leftView.addBottomConstraint(toView: superview, constant: -10.0)

or even shorter using `fillSuperview` (via [@danieladias](https://github.com/danieladias) )

    leftView.fillSuperview(UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0))

##### Centering

Add constraints to center a `UIView` within its superview both vertically (Y axis) and horizontally (X axis): 

    label.addCenterXConstraintToView(label.superview, relation: NSLayoutRelation.Equal, constant:0.0)
    label.addCenterYConstraintToView(label.superview, relation: NSLayoutRelation.Equal, constant:0.0)
    
Add constraints for a fixed width and height amount:

    view.addWidthConstraintWithRelation: NSLayoutRelation.Equal, constant:100.0)
    view.addHeightConstraintWithRelation: NSLayoutRelation.Equal, constant:80.0)

Modify constraints (since the methods return them to you)

    // Create a reference to the `NSLayoutConstraint` e.g. for height
        
    self.heightConstraint = view.addHeightConstraint(toView: nil, constant: 80.0)
    
    ...
    
    // Update the height constant
    
    self.heightConstraint.constant = 30.0;

    // Animate changes
    
    UIView.animateWithDuration(0.3, animations: { () -> Void in

        view.layoutIfNeeded()
    })

### Contributors

* Development: [Shagun Madhikarmi](mailto:shagun@ustwo.com), [Daniela Dias](mailto:daniela@ustwo.com)

