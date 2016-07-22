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
    private var filledView: UIView!
    private var centerLabel: UILabel!
    private var fixedWidthAndHeightView: UIView!


    // MARK: - View lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()

        // Examples

        self.createViewWithAddTopLeftRightBottomConstraints()
        self.createViewWithAddCenterXCenterYConstraint()
        self.createViewWithLeadingTrailingConstraints()
        self.createViewWithAddWidthHeightConstraints()
    }


    // MARK: - Examples

    private func createViewWithAddTopLeftRightBottomConstraints() {
   
        self.filledView = UIView(frame: CGRectZero)
        self.filledView.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.filledView)

        self.filledView.translatesAutoresizingMaskIntoConstraints = false
        self.filledView.fillSuperView(UIEdgeInsetsMake(20.0, 20.0, 20.0, 20.0))
    }
    
    private func createViewWithAddCenterXCenterYConstraint() {

        self.centerLabel = UILabel(frame: CGRectZero)
        self.centerLabel.backgroundColor = UIColor.yellowColor()
        self.centerLabel.text = "Some center label text"
        self.view.addSubview(self.centerLabel)

        self.centerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.centerLabel.addCenterXConstraint(toView: self.centerLabel.superview)
        self.centerLabel.addCenterYConstraint(toView: self.centerLabel.superview)
    }

    private func createViewWithLeadingTrailingConstraints() {

        let leadingTrailingLabel = UILabel(frame: CGRectZero)
        leadingTrailingLabel.backgroundColor = UIColor.purpleColor()
        leadingTrailingLabel.text = "Some leading / trailing label text"
        self.view.addSubview(leadingTrailingLabel)

        leadingTrailingLabel.translatesAutoresizingMaskIntoConstraints = false
        leadingTrailingLabel.addTopConstraint(toView: self.centerLabel, attribute: .Bottom, constant: 20.0)
        leadingTrailingLabel.addLeadingConstraint(toView: self.centerLabel, attribute: .Leading, constant: 0.0)
        leadingTrailingLabel.addTrailingConstraint(toView: self.centerLabel, attribute: .Trailing, constant: 0.0)
    }

    private func createViewWithAddWidthHeightConstraints() {

        self.fixedWidthAndHeightView = UIView(frame: CGRectZero)
        self.fixedWidthAndHeightView.backgroundColor = UIColor.blueColor()
        self.view.addSubview(self.fixedWidthAndHeightView)

        self.fixedWidthAndHeightView.translatesAutoresizingMaskIntoConstraints = false
        self.fixedWidthAndHeightView.addTopConstraint(toView: self.fixedWidthAndHeightView.superview, constant: 20.0)
        self.fixedWidthAndHeightView.addLeadingConstraint(toView: self.fixedWidthAndHeightView.superview, constant: 20.0)
        self.fixedWidthAndHeightView.addWidthConstraint(toView: nil, constant: 80.0)
        self.fixedWidthAndHeightView.addHeightConstraint(toView: nil, constant: 80.0)
    }
}
