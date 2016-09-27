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
    
    fileprivate var mockView: UIView!
    fileprivate var mockSuperview: UIView!

    
    // MARK: - Setup / Teardown
    
    override func setUp() {

        super.setUp()
        
        // Given
        
        self.mockSuperview = UIView(frame: CGRect.zero)
        self.mockView = UIView(frame: CGRect.zero)
        self.mockView.translatesAutoresizingMaskIntoConstraints = false
        self.mockSuperview.addSubview(mockView)
    }
    
    override func tearDown() {
        
        super.tearDown()
        
        self.mockView.removeFromSuperview()
        self.mockView = nil
        self.mockSuperview = nil
    }

    
    // MARK: - Fill
    
    func testFillSuperview_ReturnsCorrectNumberOfConstraints() {
        
        // When
        let constraints: [NSLayoutConstraint] = self.mockView.fillSuperView(UIEdgeInsets.zero)
        
        // Then
        let actualResult = constraints.count
        let expectedResult = 4
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints count to be \(expectedResult) constraints but instead it is \(expectedResult)")
    }

    func testFillSuperview_AddsConstraints() {
        
        // When
        let constraints: [NSLayoutConstraint] = self.mockView.fillSuperView(UIEdgeInsets.zero)
        
        // Then
        let expectedResult = self.mockSuperview.constraints
        let actualResult: [NSLayoutConstraint] = constraints
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to be \(expectedResult) constraints but instead it is \(expectedResult)")
    }

    func testFillSuperview_CreatesTopConstraint() {
        
        // When

        let constraints: [NSLayoutConstraint] = self.mockView.fillSuperView(UIEdgeInsetsMake(10.0, 0.0, 0.0, 0.0))
        
        // Then

        let constraint = constraints[0]

        self.verify(constraint, firstView: self.mockView, firstAttribute: .top, secondView: self.mockSuperview, secondAttribute: .top, relation: .equal, constant: 10.0)
    }
    
    func testFillSuperview_CreatesLeadingConstraint() {
        
        // When

        let constraints: [NSLayoutConstraint] = self.mockView.fillSuperView(UIEdgeInsetsMake(0.0, 10.0, 0.0, 0.0))

        // Then

        let constraint = constraints[1]

        self.verify(constraint, firstView: self.mockView, firstAttribute: .leading, secondView: self.mockSuperview, secondAttribute: .leading, relation: .equal, constant: 10.0)
    }
    
    func testFillSuperview_CreatesBottomConstraint() {
        
        // When

        let constraints: [NSLayoutConstraint] = self.mockView.fillSuperView(UIEdgeInsetsMake(0.0, 0.0, 10.0, 0.0))
        
        // Then
        
        let constraint = constraints[2]

        self.verify(constraint, firstView: self.mockView, firstAttribute: .bottom, secondView: self.mockSuperview, secondAttribute: .bottom, relation: .equal, constant: -10.0)


    }

    func testFillSuperview_CreatesTrailingConstraint() {
        
        // When

        let constraints: [NSLayoutConstraint] = self.mockView.fillSuperView(UIEdgeInsetsMake(0.0, 0.0, 0.0, 10.0))

        // Then

        let constraint = constraints[3]

        self.verify(constraint, firstView: self.mockView, firstAttribute: .trailing, secondView: self.mockSuperview, secondAttribute: .trailing, relation: .equal, constant: -10.0)
    }


    // MARK: - Leading

    func testAddLeadingConstraint_AddsLeadingConstraint() {

        // When

        let leadingConstraint: NSLayoutConstraint = self.mockView.addLeadingConstraint(toView: self.mockSuperview, attribute: .trailing, relation: .lessThanOrEqual, constant: 0.0)

        // Then

        let expectedResult = self.mockSuperview.constraints
        let actualResult: [NSLayoutConstraint] = [leadingConstraint]

        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to contain just the leading constraint but instead it does not it contains \(expectedResult.count) constraints")
    }

    func testAddLeadingConstraint_CreatesLeadingConstraint() {

        // When

        let leadingConstraint = self.mockView.addLeadingConstraint(toView: self.mockSuperview, attribute: .trailing, relation: .lessThanOrEqual, constant: 10.0)

        // Then

        self.verify(leadingConstraint, firstView: self.mockView, firstAttribute: .leading, secondView: self.mockSuperview, secondAttribute: .trailing, relation: .lessThanOrEqual, constant: 10.0)
    }

    func testAddLeadingConstraint_CreatesLeadingConstraintWithDefaultValues() {

        // When

        let leadingConstraint = self.mockView.addLeadingConstraint(toView: self.mockSuperview)

        // Then

        self.verify(leadingConstraint, firstView: self.mockView, firstAttribute: .leading, secondView: self.mockSuperview, secondAttribute: .leading, relation: .equal, constant: 0.0)
    }


    // MARK: - Trailing

    func testAddTrailingConstraint_AddsConstraint() {

        // When

        let rightConstraint: NSLayoutConstraint = self.mockView.addTrailingConstraint(toView: self.mockSuperview, attribute: .leading, relation: .equal, constant: 0.0);

        // Then

        let expectedResult = self.mockSuperview.constraints
        let actualResult: [NSLayoutConstraint] = [rightConstraint]

        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to contain just the trailing constraint but instead it does not it contains \(expectedResult.count) constraints")
    }

    func testAddTrailingConstraint_CreatesTrailingConstraint() {

        // When

        let rightConstraint = self.mockView.addTrailingConstraint(toView: self.mockSuperview, attribute: .leading, relation: .lessThanOrEqual, constant: 10.0);

        // Then

        self.verify(rightConstraint, firstView: self.mockView, firstAttribute: .trailing, secondView: self.mockSuperview, secondAttribute: .leading, relation: .lessThanOrEqual, constant: 10.0)
    }

    func testAddTrailingConstraint_CreatesTrailingConstraintWithDefaultValues() {

        // When

        let rightConstraint = self.mockView.addTrailingConstraint(toView: self.mockSuperview)

        // Then

        self.verify(rightConstraint, firstView: self.mockView, firstAttribute: .trailing, secondView: self.mockSuperview, secondAttribute: .trailing, relation: .equal, constant: 0.0)
    }


    // MARK: - Left
    
    func testAddLeftConstraint_AddsLeftConstraint() {
        
        // When
        
        let leftConstraint: NSLayoutConstraint = self.mockView.addLeftConstraint(toView: self.mockSuperview, attribute: .right, relation: .equal, constant: 0.0)

        // Then

        let expectedResult = self.mockSuperview.constraints
        let actualResult: [NSLayoutConstraint] = [leftConstraint]

        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to contain just the left constraint but instead it does not it contains \(expectedResult.count) constraints")
    }

    func testAddLeftConstraint_CreatesLeftConstraint() {

        // When

        let leftConstraint: NSLayoutConstraint = self.mockView.addLeftConstraint(toView: self.mockSuperview, attribute: .right, relation: .lessThanOrEqual, constant: 10.0)

        // Then

        self.verify(leftConstraint, firstView: self.mockView, firstAttribute: .left, secondView: self.mockSuperview, secondAttribute: .right, relation: .lessThanOrEqual, constant: 10.0)
    }

    func testAddLeftConstraint_CreatesLeftConstraintWithDefaultValues() {

        // When

        let leftConstraint: NSLayoutConstraint = self.mockView.addLeftConstraint(toView: self.mockSuperview)

        // Then

        self.verify(leftConstraint, firstView: self.mockView, firstAttribute: .left, secondView: self.mockSuperview, secondAttribute: .left, relation: .equal, constant: 0.0)
    }


    // MARK: - Right
    
    func testAddRightConstraint_AddsConstraint() {
        
        // When
        
        let rightConstraint: NSLayoutConstraint = self.mockView.addRightConstraint(toView: self.mockSuperview, attribute: .left, relation: .equal, constant: 0.0);
        
        // Then
        
        let expectedResult = self.mockSuperview.constraints
        let actualResult: [NSLayoutConstraint] = [rightConstraint]
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to contain just the right constraint but instead it does not it contains \(expectedResult.count) constraints")
    }
    
    func testAddRightConstraint_CreatesRightConstraint() {
        
        // When
        
        let rightConstraint: NSLayoutConstraint = self.mockView.addRightConstraint(toView: self.mockSuperview, attribute: .left, relation: .lessThanOrEqual, constant: 10.0);

        // Then
        
        self.verify(rightConstraint, firstView: self.mockView, firstAttribute: .right, secondView: self.mockSuperview, secondAttribute: .left, relation: .lessThanOrEqual, constant: 10.0)
    }

    func testAddRightConstraint_CreatesRightConstraintWithDefaultValues() {

        // When

        let rightConstraint: NSLayoutConstraint = self.mockView.addRightConstraint(toView: self.mockSuperview)
        // Then

        self.verify(rightConstraint, firstView: self.mockView, firstAttribute: .right, secondView: self.mockSuperview, secondAttribute: .right, relation: .equal, constant: 0.0)
    }


    // MARK: - Top
    
    func testAddTopConstraint_AddsTopConstraint() {
        
        // When
        
        let topConstraint: NSLayoutConstraint = self.mockView.addTopConstraint(toView: self.mockSuperview, attribute: .bottom, relation: .equal, constant: 0.0);
        
        // Then
        
        let expectedResult = self.mockSuperview.constraints
        let actualResult: [NSLayoutConstraint] = [topConstraint]
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to contain just the top constraint but instead it does not it contains \(expectedResult.count) constraints")
    }
    
    func testAddTopConstraint_CreatesTopConstraint() {
        
        // When
        
        let topConstraint: NSLayoutConstraint = self.mockView.addTopConstraint(toView: self.mockSuperview, attribute: .bottom, relation: .lessThanOrEqual, constant: 10.0);

        // Then
        
        self.verify(topConstraint, firstView: self.mockView, firstAttribute: .top, secondView: self.mockSuperview, secondAttribute: .bottom, relation: .lessThanOrEqual, constant: 10.0)
    }

    func testAddTopConstraint_CreatesTopConstraintWithDefaultValues() {

        // When

        let topConstraint: NSLayoutConstraint = self.mockView.addTopConstraint(toView: self.mockSuperview)

        // Then

        self.verify(topConstraint, firstView: self.mockView, firstAttribute: .top, secondView: self.mockSuperview, secondAttribute: .top, relation: .equal, constant: 0.0)
    }

    
    // MARK: - Bottom
    
    func testAddBottomConstraint_AddsBottomConstraint() {
        
        // When
        
        let bottomConstraint: NSLayoutConstraint = self.mockView.addBottomConstraint(toView: self.mockSuperview, attribute: .bottom, relation: .equal, constant: 0.0);
        
        // Then
        
        let expectedResult = self.mockSuperview.constraints
        let actualResult: [NSLayoutConstraint] = [bottomConstraint]
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to contain just the bottom constraint but instead it does not it contains \(expectedResult.count) constraints")
    }
    
    func testAddBottomConstraint_CreatesBottomConstraint() {
        
        // When
        
        let bottomConstraint: NSLayoutConstraint = self.mockView.addBottomConstraint(toView: self.mockSuperview, attribute: .bottom, relation: .lessThanOrEqual, constant: 10.0);
        
        // Then
        
        self.verify(bottomConstraint, firstView: self.mockView, firstAttribute: .bottom, secondView: self.mockSuperview, secondAttribute: .bottom, relation: .lessThanOrEqual, constant: 10.0)
    }

    func testAddBottomConstraint_CreatesBottomConstraintWithDefaultValues() {

        // When

        let bottomConstraint: NSLayoutConstraint = self.mockView.addBottomConstraint(toView: self.mockSuperview, attribute: .bottom, relation: .equal, constant: 0.0);

        // Then

        self.verify(bottomConstraint, firstView: self.mockView, firstAttribute: .bottom, secondView: self.mockSuperview, secondAttribute: .bottom, relation: .equal, constant: 0.0)
    }


    // MARK: - Height

    func testAddHeightConstraint_AddsHeightConstraint() {

        // When

        let heightConstraint: NSLayoutConstraint = self.mockView.addHeightConstraint(toView: self.mockSuperview, relation: .equal, constant: 0.0)

        // Then

        let expectedResult = self.mockSuperview.constraints
        let actualResult: [NSLayoutConstraint] = [heightConstraint]

        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to contain just the bottom constraint but instead it does not it contains \(expectedResult.count) constraints")
    }

    func testAddHeightConstraint_CreatesHeightConstraint() {

        // When

        let heightConstraint: NSLayoutConstraint = self.mockView.addHeightConstraint(toView: self.mockSuperview, relation: .lessThanOrEqual, constant: 10.0);

        // Then

        self.verify(heightConstraint, firstView: self.mockView, firstAttribute: .height, secondView: self.mockSuperview, secondAttribute: .height, relation: .lessThanOrEqual, constant: 10.0)
    }

    func testAddHeightConstraint_CreatesHeightConstraintWithDefaultValues() {

        // When

        let heightConstraint: NSLayoutConstraint = self.mockView.addHeightConstraint(toView: self.mockSuperview)

        // Then

        self.verify(heightConstraint, firstView: self.mockView, firstAttribute: .height, secondView: self.mockSuperview, secondAttribute: .height, relation: .equal, constant: 0.0)
    }


    // MARK: - Width

    func testAddWidthConstraint_AddsWidthConstraint() {

        // When

        let widthConstraint: NSLayoutConstraint = self.mockView.addWidthConstraint(toView: self.mockSuperview, relation: .equal, constant: 0.0)

        // Then

        let expectedResult = self.mockSuperview.constraints
        let actualResult: [NSLayoutConstraint] = [widthConstraint]

        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to contain just the width constraint but instead it does not it contains \(expectedResult.count) constraints")
    }

    func testAddWidthConstraint_CreatesWidthConstraint() {

        // When

        let widthConstraint: NSLayoutConstraint = self.mockView.addWidthConstraint(toView: self.mockSuperview, relation: .lessThanOrEqual, constant: 10.0);

        // Then

        self.verify(widthConstraint, firstView: self.mockView, firstAttribute: .width, secondView: self.mockSuperview, secondAttribute: .width, relation: .lessThanOrEqual, constant: 10.0)
    }

    func testAddWidthConstraint_CreatesWidthConstraintWithDefaultValues() {

        // When

        let widthConstraint: NSLayoutConstraint = self.mockView.addWidthConstraint(toView: self.mockSuperview)

        // Then

        self.verify(widthConstraint, firstView: self.mockView, firstAttribute: .width, secondView: self.mockSuperview, secondAttribute: .width, relation: .equal, constant: 0.0)
    }


    // MARK: - Private
    
    fileprivate func verify(_ constraint: NSLayoutConstraint, firstView: UIView?, firstAttribute: NSLayoutAttribute, secondView: UIView?, secondAttribute: NSLayoutAttribute, relation: NSLayoutRelation?, constant: CGFloat?) {
        
        // First view
        
        if (firstView != nil) {
            
            XCTAssertEqual(constraint.firstItem as? UIView, firstView!, "Error: expected constraint's firstItem to be \(firstView!) but instead it is \(constraint.firstItem)")
            
        } else {
            
            XCTAssertNil(constraint.firstItem, "Error: expected constraint's firstItem to be nil but instead it is not \(constraint.firstItem)")
        }
        
        // Second view
        
        if (secondView != nil) {
            
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
