AutoLayoutHelper
=======================

UIView helper to easily create common Auto Layout Constraints for iOS

### The Problem

Using Auto Layout programatically can either be quite verbose i.e. building NSLayoutConstraint objects for each rule or error prone e.g. (using Visual Format Language strings)

### A Solution

We can make creating common NSLayoutConstraint relations into some reusable methods we can call on any class that subclasses UIView. We also ensure the constraint created gets added to the view's superview for you. This means you can relate a UIView or subclass you have to another view fairly quickly with the NSLayoutAttribute or NSLayoutRelation you need and in a way that looks part of the view's setup routine and helps us keep the code DRY.

### Dependencies 

* [Xcode](https://itunes.apple.com/gb/app/xcode/id497799835?mt=12#)

### Installation

- Add the UIView+LayoutConstraints.swift file to your project.

### Usage

Examples:

Add NSLayoutConstraint relations for a UIView relating its left, top, bottom and right edges to it's superview 

    // Create view
    
    let leftView: UIView = UIView(frame: CGRectZero)
    leftView.backgroundColor = UIColor.redColor()
    self.view.addSubview(leftView)
    
    // Add constraints
    
    if let superview = leftView.superview {
        
        leftView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        leftView.addTopConstraint(toView: superview, attribute: NSLayoutAttribute.Top, relation: NSLayoutRelation.Equal, constant: 10.0)
        leftView.addLeftConstraint(toView: superview, attribute: NSLayoutAttribute.Left, relation: NSLayoutRelation.Equal, constant: 10.0)
        leftView.addRightConstraint(toView: superview, attribute: NSLayoutAttribute.Right, relation: NSLayoutRelation.Equal, constant: -10.0)
        leftView.addBottomConstraint(toView: superview, attribute: NSLayoutAttribute.Bottom, relation: NSLayoutRelation.Equal, constant: -10.0)
    }

or shorter assuming top to top, left to left, right to right and bottom to bottom you can omit the attribute: 
    
    leftView.addTopConstraint(toView: superview, relation: NSLayoutRelation.Equal, constant: 10.0)
    leftView.addLeftConstraint(toView: superview, relation: NSLayoutRelation.Equal, constant: 10.0)
    leftView.addRightConstraint(toView: superview, relation: NSLayoutRelation.Equal, constant: -10.0)
    leftView.addBottomConstraint(toView: superview, attribute: NSLayoutAttribute.Bottom, relation: NSLayoutRelation.Equal, constant: -10.0)

or even more succinctly:

    [leftView fillSuperview:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)];


Add constraints to center a UIView in its superview both vertically (Y) and horizontally (X): 

    [label addCenterXConstraintToView:label.superview relation:NSLayoutRelationEqual constant:0.0];
    [label addCenterYConstraintToView:label.superview relation:NSLayoutRelationEqual constant:0.0];
    
Add constraints for a fixed width and height amount:

    [view addWidthConstraintWithRelation:NSLayoutRelationEqual constant:100.0];
    [view addHeightConstraintWithRelation:NSLayoutRelationEqual constant:80.0];

Modify constraints (since the methods return them to you)

    // Store the height constraint when its created
        
    self.heightConstraint = view.addHeightConstraint(NSLayoutRelation.Equal, constant: 80.0)
    
    ...
    
    // Modify height amount
    
    self.heightConstraint.constant = 30.0;

    // Animate changes
    
    UIView.animateWithDuration(0.3, animations: { () -> Void in

        view.layoutIfNeeded()
    })

### Team
* Development: [Shagun Madhikarmi](mailto:shagun@ustwo.com), [Daniela Dias](mailto:daniela@ustwo.com)
