//
//  ViewController.swift
//  AutoLayoutHelper
//
//  Created by Shagun Madhikarmi on 16/06/2015.
//  Copyright (c) 2015 madhikarma. All rights reserved.
//

import UIKit

public enum AnimationDirection: Int {
    case up
    case down
    case left
    case right
}

class ViewController: UIViewController {

    fileprivate var heightConstraint: NSLayoutConstraint!

    fileprivate var filledView = UIView()
    fileprivate var centerLabel = UILabel()
    fileprivate var leadingTrailingLabel = UILabel()
    fileprivate var fixedWidthAndHeightView = UIView()


    // MARK: - View lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()

        // Examples

        setupViewWithAddTopLeftRightBottomConstraints()
        setupViewWithAddCenterXCenterYConstraint()
        setupViewWithLeadingTrailingConstraints()
        setupViewWithAddWidthHeightConstraints()
    }


    // MARK: - Examples

    fileprivate func setupViewWithAddTopLeftRightBottomConstraints() {

        filledView.backgroundColor = UIColor.red
        view.addSubview(filledView)

        let edgeInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
        filledView.fillSuperView(edgeInsets)
    }

    fileprivate func setupViewWithAddCenterXCenterYConstraint() {

        centerLabel.backgroundColor = UIColor.yellow
        centerLabel.text = "Some center label text"
        view.addSubview(centerLabel)

        centerLabel.addCenterXConstraint(toView: centerLabel.superview)
        centerLabel.addCenterYConstraint(toView: centerLabel.superview)
    }

    fileprivate func setupViewWithLeadingTrailingConstraints() {

        leadingTrailingLabel.backgroundColor = UIColor.purple
        leadingTrailingLabel.text = "Some leading / trailing label text"
        view.addSubview(leadingTrailingLabel)

        leadingTrailingLabel.addTopConstraint(toView: centerLabel, attribute: .bottom, constant: 20.0)
        leadingTrailingLabel.addLeadingConstraint(toView: centerLabel, attribute: .leading, constant: 0.0)
        leadingTrailingLabel.addTrailingConstraint(toView: centerLabel, attribute: .trailing, constant: 0.0)
    }

    fileprivate func setupViewWithAddWidthHeightConstraints() {

        fixedWidthAndHeightView.backgroundColor = UIColor.blue
        view.addSubview(fixedWidthAndHeightView)

        fixedWidthAndHeightView.addTopConstraint(toView: fixedWidthAndHeightView.superview, constant: 20.0)
        fixedWidthAndHeightView.addLeadingConstraint(toView: fixedWidthAndHeightView.superview, constant: 20.0)
        fixedWidthAndHeightView.addWidthConstraint(toView: nil, constant: 80.0)
        fixedWidthAndHeightView.addHeightConstraint(toView: nil, constant: 80.0)
    }
}
