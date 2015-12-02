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


    // MARK: - View lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()

        self.createViewWithAddTopLeftRightBottomConstraints()
        self.createViewWithAddCenterXCenterYConstraint()
        self.createViewWithAddWidthHeightConstraints()
    }


    // MARK: - Constraints methods

    private func createViewWithAddTopLeftRightBottomConstraints() {
   
        let redView: UIView = UIView(frame: CGRectZero)
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = UIColor.redColor()
        self.view.addSubview(redView)

        redView.addTopConstraint(toView: redView.superview, constant: 10.0)
        redView.addLeftConstraint(toView: redView.superview, constant: 10.0)
        redView.addRightConstraint(toView: redView.superview, constant: -10.0)
        redView.addBottomConstraint(toView: redView.superview, constant: -10.0)
    }
    
    private func createViewWithAddCenterXCenterYConstraint() {

        let label: UILabel = UILabel(frame: CGRectZero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.yellowColor()
        label.text = "Some centered text"
        self.view.addSubview(label)

        label.addCenterXConstraint(toView: label.superview)
        label.addCenterYConstraint(toView: label.superview)
    }

    private func createViewWithAddWidthHeightConstraints() {
        
        let blueView: UIView = UIView(frame: CGRectZero)
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.backgroundColor = UIColor.blueColor()
        self.view.addSubview(blueView)

        blueView.addWidthConstraint(toView: nil, constant: 80.0)
        blueView.addHeightConstraint(toView: nil, constant: 80.0)
    }
}
