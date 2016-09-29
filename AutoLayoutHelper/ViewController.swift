//
//  ViewController.swift
//  AutoLayoutHelper
//
//  Created by Shagun Madhikarmi on 16/06/2015.
//  Copyright (c) 2015 madhikarma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate var heightConstraint: NSLayoutConstraint!
    fileprivate var filledView: UIView!
    fileprivate var centerLabel: UILabel!
    fileprivate var fixedWidthAndHeightView: UIView!


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

    fileprivate func createViewWithAddTopLeftRightBottomConstraints() {
   
        self.filledView = UIView(frame: CGRect.zero)
        self.filledView.backgroundColor = UIColor.red
        self.view.addSubview(self.filledView)

        self.filledView.fillSuperView(UIEdgeInsetsMake(20.0, 20.0, 20.0, 20.0))
    }
    
    fileprivate func createViewWithAddCenterXCenterYConstraint() {

        self.centerLabel = UILabel(frame: CGRect.zero)
        self.centerLabel.backgroundColor = UIColor.yellow
        self.centerLabel.text = "Some center label text"
        self.view.addSubview(self.centerLabel)

        self.centerLabel.addCenterXConstraint(toView: self.centerLabel.superview)
        self.centerLabel.addCenterYConstraint(toView: self.centerLabel.superview)
    }

    fileprivate func createViewWithLeadingTrailingConstraints() {

        let leadingTrailingLabel = UILabel(frame: CGRect.zero)
        leadingTrailingLabel.backgroundColor = UIColor.purple
        leadingTrailingLabel.text = "Some leading / trailing label text"
        self.view.addSubview(leadingTrailingLabel)

        leadingTrailingLabel.addTopConstraint(toView: self.centerLabel, attribute: .bottom, constant: 20.0)
        leadingTrailingLabel.addLeadingConstraint(toView: self.centerLabel, attribute: .leading, constant: 0.0)
        leadingTrailingLabel.addTrailingConstraint(toView: self.centerLabel, attribute: .trailing, constant: 0.0)
    }

    fileprivate func createViewWithAddWidthHeightConstraints() {

        self.fixedWidthAndHeightView = UIView(frame: CGRect.zero)
        self.fixedWidthAndHeightView.backgroundColor = UIColor.blue
        self.view.addSubview(self.fixedWidthAndHeightView)

        self.fixedWidthAndHeightView.addTopConstraint(toView: self.fixedWidthAndHeightView.superview, constant: 20.0)
        self.fixedWidthAndHeightView.addLeadingConstraint(toView: self.fixedWidthAndHeightView.superview, constant: 20.0)
        self.fixedWidthAndHeightView.addWidthConstraint(toView: nil, constant: 80.0)
        self.fixedWidthAndHeightView.addHeightConstraint(toView: nil, constant: 80.0)
    }
}
