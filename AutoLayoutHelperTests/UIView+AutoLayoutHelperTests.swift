//
//  AutoLayoutHelperTests.swift
//  AutoLayoutHelperTests
//
//  Created by Shagun Madhikarmi on 26/10/2014.
//  Copyright (c) 2014 madhikarma. All rights reserved.
//

import UIKit
import XCTest


class UIViewAutoLayoutHelperTests: XCTestCase {

    fileprivate var mockView = UIView()
    fileprivate var mockSuperview = UIView()


    // MARK: - Setup / Teardown

    override func setUp() {

        super.setUp()

        // Given

        mockSuperview.addSubview(mockView)
    }

    override func tearDown() {

        super.tearDown()

        mockView.removeFromSuperview()
    }


    // MARK: - Fill

    func testFillSuperview_ReturnsCorrectNumberOfConstraints() {

        // When

        let constraints = mockView.fillSuperView()

        // Then

        let actualResult = constraints.count
        let expectedResult = 4

        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints count to be \(expectedResult) constraints but instead it is \(expectedResult)")
    }

    func testFillSuperview_AddsConstraints() {

        // When

        let constraints = mockView.fillSuperView()

        // Then

        let expectedResult = mockSuperview.constraints
        let actualResult = constraints

        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to be \(expectedResult) constraints but instead it is \(expectedResult)")
    }

    func testFillSuperview_CreatesTopConstraint() {

        // When

        let edgeInsets = UIEdgeInsets(top: 10.0, left: 0.0, bottom: 0.0, right: 0.0)
        let constraints = mockView.fillSuperView(edgeInsets)

        // Then

        let constraint = constraints[0]

        verify(constraint, firstView: mockView, firstAttribute: .top, secondView: mockSuperview, secondAttribute: .top, relation: .equal, constant: 10.0)
    }

    func testFillSuperview_CreatesLeadingConstraint() {

        // When

        let edgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 0.0)
        let constraints = mockView.fillSuperView(edgeInsets)

        // Then

        let constraint = constraints[1]

        verify(constraint, firstView: mockView, firstAttribute: .leading, secondView: mockSuperview, secondAttribute: .leading, relation: .equal, constant: 10.0)
    }

    func testFillSuperview_CreatesBottomConstraint() {

        // When

        let edgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 10.0, right: 0.0)
        let constraints = mockView.fillSuperView(edgeInsets)

        // Then

        let constraint = constraints[2]

        verify(constraint, firstView: mockView, firstAttribute: .bottom, secondView: mockSuperview, secondAttribute: .bottom, relation: .equal, constant: -10.0)
    }

    func testFillSuperview_CreatesTrailingConstraint() {

        // When

        let edgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 10.0)
        let constraints = mockView.fillSuperView(edgeInsets)

        // Then

        let constraint = constraints[3]

        verify(constraint, firstView: mockView, firstAttribute: .trailing, secondView: mockSuperview, secondAttribute: .trailing, relation: .equal, constant: -10.0)
    }


    // MARK: - Leading

    func testAddLeadingConstraint_AddsLeadingConstraint() {

        // When

        let leadingConstraint = mockView.addLeadingConstraint(toView: mockSuperview, attribute: .trailing, relation: .lessThanOrEqual, constant: 0.0)

        // Then

        let expectedResult = mockSuperview.constraints
        let actualResult = [leadingConstraint]

        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to contain just the leading constraint but instead it does not it contains \(expectedResult.count) constraints")
    }

    func testAddLeadingConstraint_CreatesLeadingConstraint() {

        // When

        let leadingConstraint = mockView.addLeadingConstraint(toView: mockSuperview, attribute: .trailing, relation: .lessThanOrEqual, constant: 10.0)

        // Then

        verify(leadingConstraint, firstView: mockView, firstAttribute: .leading, secondView: mockSuperview, secondAttribute: .trailing, relation: .lessThanOrEqual, constant: 10.0)
    }

    func testAddLeadingConstraint_CreatesLeadingConstraintWithDefaultValues() {

        // When

        let leadingConstraint = mockView.addLeadingConstraint(toView: mockSuperview)

        // Then

        verify(leadingConstraint, firstView: mockView, firstAttribute: .leading, secondView: mockSuperview, secondAttribute: .leading, relation: .equal, constant: 0.0)
    }


    // MARK: - Trailing

    func testAddTrailingConstraint_AddsConstraint() {

        // When

        let rightConstraint = mockView.addTrailingConstraint(toView: mockSuperview, attribute: .leading, relation: .equal, constant: 0.0)

        // Then

        let expectedResult = mockSuperview.constraints
        let actualResult = [rightConstraint]

        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to contain just the trailing constraint but instead it does not it contains \(expectedResult.count) constraints")
    }

    func testAddTrailingConstraint_CreatesTrailingConstraint() {

        // When

        let rightConstraint = mockView.addTrailingConstraint(toView: mockSuperview, attribute: .leading, relation: .lessThanOrEqual, constant: 10.0)

        // Then

        verify(rightConstraint, firstView: mockView, firstAttribute: .trailing, secondView: mockSuperview, secondAttribute: .leading, relation: .lessThanOrEqual, constant: 10.0)
    }

    func testAddTrailingConstraint_CreatesTrailingConstraintWithDefaultValues() {

        // When

        let rightConstraint = mockView.addTrailingConstraint(toView: mockSuperview)

        // Then

        verify(rightConstraint, firstView: mockView, firstAttribute: .trailing, secondView: mockSuperview, secondAttribute: .trailing, relation: .equal, constant: 0.0)
    }


    // MARK: - Left

    func testAddLeftConstraint_AddsLeftConstraint() {

        // When

        let leftConstraint = mockView.addLeftConstraint(toView: mockSuperview, attribute: .right, relation: .equal, constant: 0.0)

        // Then

        let expectedResult = mockSuperview.constraints
        let actualResult = [leftConstraint]

        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to contain just the left constraint but instead it does not it contains \(expectedResult.count) constraints")
    }

    func testAddLeftConstraint_CreatesLeftConstraint() {

        // When

        let leftConstraint = mockView.addLeftConstraint(toView: mockSuperview, attribute: .right, relation: .lessThanOrEqual, constant: 10.0)

        // Then

        verify(leftConstraint, firstView: mockView, firstAttribute: .left, secondView: mockSuperview, secondAttribute: .right, relation: .lessThanOrEqual, constant: 10.0)
    }

    func testAddLeftConstraint_CreatesLeftConstraintWithDefaultValues() {

        // When

        let leftConstraint = mockView.addLeftConstraint(toView: mockSuperview)

        // Then

        verify(leftConstraint, firstView: mockView, firstAttribute: .left, secondView: mockSuperview, secondAttribute: .left, relation: .equal, constant: 0.0)
    }


    // MARK: - Right

    func testAddRightConstraint_AddsConstraint() {

        // When

        let rightConstraint = mockView.addRightConstraint(toView: mockSuperview, attribute: .left, relation: .equal, constant: 0.0)

        // Then

        let expectedResult = mockSuperview.constraints
        let actualResult = [rightConstraint]

        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to contain just the right constraint but instead it does not it contains \(expectedResult.count) constraints")
    }

    func testAddRightConstraint_CreatesRightConstraint() {

        // When

        let rightConstraint = mockView.addRightConstraint(toView: mockSuperview, attribute: .left, relation: .lessThanOrEqual, constant: 10.0)

        // Then

        verify(rightConstraint, firstView: mockView, firstAttribute: .right, secondView: mockSuperview, secondAttribute: .left, relation: .lessThanOrEqual, constant: 10.0)
    }

    func testAddRightConstraint_CreatesRightConstraintWithDefaultValues() {

        // When

        let rightConstraint = mockView.addRightConstraint(toView: mockSuperview)

        // Then

        verify(rightConstraint, firstView: mockView, firstAttribute: .right, secondView: mockSuperview, secondAttribute: .right, relation: .equal, constant: 0.0)
    }


    // MARK: - Top

    func testAddTopConstraint_AddsTopConstraint() {

        // When

        let topConstraint = mockView.addTopConstraint(toView: mockSuperview, attribute: .bottom, relation: .equal, constant: 0.0)

        // Then

        let expectedResult = mockSuperview.constraints
        let actualResult = [topConstraint]

        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to contain just the top constraint but instead it does not it contains \(expectedResult.count) constraints")
    }

    func testAddTopConstraint_CreatesTopConstraint() {

        // When

        let topConstraint = mockView.addTopConstraint(toView: mockSuperview, attribute: .bottom, relation: .lessThanOrEqual, constant: 10.0)

        // Then

        verify(topConstraint, firstView: mockView, firstAttribute: .top, secondView: mockSuperview, secondAttribute: .bottom, relation: .lessThanOrEqual, constant: 10.0)
    }

    func testAddTopConstraint_CreatesTopConstraintWithDefaultValues() {

        // When

        let topConstraint = mockView.addTopConstraint(toView: mockSuperview)

        // Then

        self.verify(topConstraint, firstView: mockView, firstAttribute: .top, secondView: mockSuperview, secondAttribute: .top, relation: .equal, constant: 0.0)
    }


    // MARK: - Bottom

    func testAddBottomConstraint_AddsBottomConstraint() {

        // When

        let bottomConstraint = mockView.addBottomConstraint(toView: mockSuperview, attribute: .bottom, relation: .equal, constant: 0.0)

        // Then

        let expectedResult = mockSuperview.constraints
        let actualResult = [bottomConstraint]

        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to contain just the bottom constraint but instead it does not it contains \(expectedResult.count) constraints")
    }

    func testAddBottomConstraint_CreatesBottomConstraint() {

        // When

        let bottomConstraint = mockView.addBottomConstraint(toView: mockSuperview, attribute: .bottom, relation: .lessThanOrEqual, constant: 10.0)

        // Then

        verify(bottomConstraint, firstView: mockView, firstAttribute: .bottom, secondView: mockSuperview, secondAttribute: .bottom, relation: .lessThanOrEqual, constant: 10.0)
    }

    func testAddBottomConstraint_CreatesBottomConstraintWithDefaultValues() {

        // When

        let bottomConstraint = mockView.addBottomConstraint(toView: mockSuperview, attribute: .bottom, relation: .equal, constant: 0.0)

        // Then

        verify(bottomConstraint, firstView: mockView, firstAttribute: .bottom, secondView: mockSuperview, secondAttribute: .bottom, relation: .equal, constant: 0.0)
    }


    // MARK: - Height

    func testAddHeightConstraint_AddsHeightConstraint() {

        // When

        let heightConstraint = mockView.addHeightConstraint(toView: mockSuperview, relation: .equal, constant: 0.0)

        // Then

        let expectedResult = mockSuperview.constraints
        let actualResult = [heightConstraint]

        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to contain just the bottom constraint but instead it does not it contains \(expectedResult.count) constraints")
    }

    func testAddHeightConstraint_CreatesHeightConstraint() {

        // When

        let heightConstraint = mockView.addHeightConstraint(toView: mockSuperview, relation: .lessThanOrEqual, constant: 10.0)

        // Then

        verify(heightConstraint, firstView: mockView, firstAttribute: .height, secondView: mockSuperview, secondAttribute: .height, relation: .lessThanOrEqual, constant: 10.0)
    }

    func testAddHeightConstraint_CreatesHeightConstraintWithDefaultValues() {

        // When

        let heightConstraint = mockView.addHeightConstraint(toView: mockSuperview)

        // Then

        verify(heightConstraint, firstView: mockView, firstAttribute: .height, secondView: mockSuperview, secondAttribute: .height, relation: .equal, constant: 0.0)
    }


    // MARK: - Width

    func testAddWidthConstraint_AddsWidthConstraint() {

        // When

        let widthConstraint = mockView.addWidthConstraint(toView: mockSuperview, relation: .equal, constant: 0.0)

        // Then

        let expectedResult = mockSuperview.constraints
        let actualResult = [widthConstraint]

        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to contain just the width constraint but instead it does not it contains \(expectedResult.count) constraints")
    }

    func testAddWidthConstraint_CreatesWidthConstraint() {

        // When

        let widthConstraint = mockView.addWidthConstraint(toView: mockSuperview, relation: .lessThanOrEqual, constant: 10.0)

        // Then

        verify(widthConstraint, firstView: mockView, firstAttribute: .width, secondView: mockSuperview, secondAttribute: .width, relation: .lessThanOrEqual, constant: 10.0)
    }

    func testAddWidthConstraint_CreatesWidthConstraintWithDefaultValues() {

        // When

        let widthConstraint = mockView.addWidthConstraint(toView: mockSuperview)

        // Then

        verify(widthConstraint, firstView: mockView, firstAttribute: .width, secondView: mockSuperview, secondAttribute: .width, relation: .equal, constant: 0.0)
    }


    // MARK: - Private

    fileprivate func verify(_ constraint: NSLayoutConstraint,
                            firstView: UIView?,
                            firstAttribute: NSLayoutAttribute,
                            secondView: UIView?,
                            secondAttribute: NSLayoutAttribute,
                            relation: NSLayoutRelation?,
                            constant: CGFloat?) {

        // First view

        if firstView != nil {

            XCTAssertEqual(constraint.firstItem as? UIView, firstView!, "Error: expected constraint's firstItem to be \(firstView!) but instead it is \(constraint.firstItem)")

        } else {

            XCTAssertNil(constraint.firstItem, "Error: expected constraint's firstItem to be nil but instead it is not \(constraint.firstItem)")
        }

        // Second view

        if secondView != nil {

            XCTAssertEqual(constraint.secondItem as? UIView, secondView!, "Error: expected constraint's secondItem to be \(secondView!) but instead it is \(constraint.secondItem)")

        } else {

            XCTAssertNil(constraint.secondItem, "Error: expected constraint's secondItem to be nil but instead it is not \(constraint.secondItem)")
        }

        // First attribute

        XCTAssertEqual(constraint.firstAttribute, firstAttribute, "Error: expected constraint's firstAttribute to be \(firstAttribute) but instead it is \(constraint.firstAttribute)")

        // Second attribute

        XCTAssertEqual(constraint.secondAttribute, secondAttribute, "Error: expected constraint's firstAttribute to be \(secondAttribute) but instead it is \(constraint.firstAttribute.rawValue)")

        // Relation

        if let constraintRelation = relation {

            XCTAssertEqual(constraint.relation, constraintRelation, "Error: expected constraint's relation to be \(constraintRelation) but instead it is \(constraint.relation.rawValue)")
        }

        // Constant

        if let constraintConstant = constant {

            XCTAssertEqual(constraint.constant, constraintConstant, "Error: expected constraint's constant to be \(constraintConstant) but instead it is \(constraint.constant)")
        }
    }
}
