//
//  ViewController.swift
//  AutoLayoutHelper
//
//  Created by Shagun Madhikarmi on 16/06/2015.
//  Copyright (c) 2015 madhikarma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {

        super.viewDidLoad()

        self.createViewWithAddTopLeftRightBottomConstraints()
        self.createViewWithAddCenterXCenterYConstraint()
        self.createViewWithAddWidthHeightConstraints()
    }

    private func createViewWithAddTopLeftRightBottomConstraints() {
   
        let leftView: UIView = UIView(frame: CGRectZero)
        leftView.backgroundColor = UIColor.redColor()
        self.view.addSubview(leftView)
        
        if let superview = leftView.superview {

            leftView.translatesAutoresizingMaskIntoConstraints = false

            leftView.addTopConstraint(toView: superview, attribute: NSLayoutAttribute.Top, relation: NSLayoutRelation.Equal, constant: 10.0)
            leftView.addLeftConstraint(toView: superview, attribute: NSLayoutAttribute.Left, relation: NSLayoutRelation.Equal, constant: 10.0)
            leftView.addRightConstraint(toView: superview, attribute: NSLayoutAttribute.Right, relation: NSLayoutRelation.Equal, constant: -10.0)
            leftView.addBottomConstraint(toView: superview, attribute: NSLayoutAttribute.Bottom, relation: NSLayoutRelation.Equal, constant: -10.0)
        }
    }
    
    private func createViewWithAddCenterXCenterYConstraint() {

        let label: UILabel = UILabel(frame: CGRectZero)
        label.text = "Some centered text"
        label.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(label)
        
        if let superview = label.superview {

            label.translatesAutoresizingMaskIntoConstraints = false

            label.addCenterXConstraint(toView: superview, relation: NSLayoutRelation.Equal, constant: 0.0)
            label.addCenterYConstraint(toView: superview, relation: NSLayoutRelation.Equal, constant: 0.0)
        }
    }

    private func createViewWithAddWidthHeightConstraints() {
        
        let view: UIView = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.blueColor()
        self.view.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addWidthConstraint(toView: nil, relation: .Equal, constant: 60.0)
        view.addHeightConstraint(toView: nil, relation: .Equal, constant: 80.0)
    }
}
