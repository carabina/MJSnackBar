//
//  MJSnackBar.swift
//  MJSnackBarExample
//
//  Created by Maxime Junger on 01/04/16.
//  Copyright © 2016 Maxime Junger. All rights reserved.
//

import UIKit

class MJSnackBar: NSObject {
	
	/**
		All views used to build the SnackBar
	*/
	private var _snackBarView :UIView!
	private var _snackBarActionButton :UIButton?
	private var _snackBarLeftActionText :UILabel!
	
	/**
		Properties to build the main view frame
	*/
	private let _spaceOnSide :Double = 5.0
	private let _spaceOnBottom :Double = 5.0
	private let _snackViewHeight :Double = 50.0
	private let _backgroundColor :Int = 0x1D1D1D
	private let _backgroundAlpha :CGFloat = 0.8
	private let _corners :CGFloat = 3.0
	
	/**
		Set all times used for SnackBar
	*/
	private let _appearanceTime :Double = 4.0
	private let _animationTime :Double = 0.3
	
	/**
		∏roperties to build the LeftAction label
	*/
	private var _leftActionText :String!
	private var _leftActionTextSize :CGFloat = 14.0
	private var _leftActionTextColor :Int = 0xFFFFFF
	
	/**
		Properties to build the ActionButton button
	*/
	private var _actionButtonTextSize :CGFloat = 14.0
	private var _actionButtonText :NSString = "Undo"
	private var _actionButtonTextColorNormal :Int = 0xFFFFFF
	private var _actionButtonTextColorSelected :Int = 0xDDDDDD
	private var _snackBarItemsSideSize :CGFloat = 10.0
	
	/**
		Property to get the size of the current screen
	*/
	private var _screenSize :CGRect!
	
	/**
		∏roperty to get if the view is shown or is showing
	*/
	private var _shown :Bool!
	private var _animating :Bool!
	
	override init() {
		
		super.init()
		_screenSize = UIScreen.mainScreen().bounds
		_shown = false
		_animating = false
		createView()
	}
	
	/**
		Create the SnackBar main view with all properties
	*/
	private func createView() {

		_snackBarView = UIView(frame: CGRect(x: _spaceOnSide,
			y: Double(_screenSize.height),
			width: Double(_screenSize.width) - (_spaceOnSide * 2),
			height: _snackViewHeight))
		_snackBarView.backgroundColor = UIColor.init(netHex: _backgroundColor)
		_snackBarView.backgroundColor = _snackBarView.backgroundColor?.colorWithAlphaComponent(_backgroundAlpha)
		
		_snackBarView.layer.cornerRadius = _corners
		_snackBarView.layer.masksToBounds = true
		addActionButton()
	}
	
	/**
		Create and add the right action button
	*/
	private func addActionButton() {
		
		let textSize = _actionButtonText.sizeWithAttributes([NSFontAttributeName: UIFont.systemFontOfSize(_actionButtonTextSize)])
		
		_snackBarActionButton = UIButton(frame: CGRect(x: (_snackBarView.frame.width - textSize.width) - _snackBarItemsSideSize,
			y: (_snackBarView.frame.height / 2) - (textSize.height / 2),
			width: textSize.width + 3,
			height: textSize.height))
	
		_snackBarActionButton?.setTitle(_actionButtonText as String, forState: .Normal)
		
		_snackBarActionButton?.setTitleColor(UIColor.init(netHex:_actionButtonTextColorNormal), forState: .Normal)
		_snackBarActionButton?.setTitleColor(UIColor.init(netHex: _actionButtonTextColorSelected), forState: .Highlighted)
		_snackBarActionButton?.titleLabel!.font = UIFont.systemFontOfSize(_actionButtonTextSize)
		_snackBarActionButton?.contentHorizontalAlignment = .Right
		
		_snackBarActionButton?.addTarget(self, action: #selector(self.actionButtonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
		
		_snackBarView.addSubview(_snackBarActionButton!)
	}
	
	/**
		Create and add the left action text
	*/
	private func addActionText(message :String) {
		
		let textSize = (message as NSString).sizeWithAttributes([NSFontAttributeName: UIFont.systemFontOfSize(_leftActionTextSize)])
		
		var textWidth :CGFloat = textSize.width + 3
		
		if (_screenSize.width - textWidth - CGFloat(_snackBarItemsSideSize * 2) - (_snackBarActionButton?.frame.width)! < 0) {
			textWidth = _screenSize.width - (_snackBarActionButton?.frame.width)! - CGFloat(_snackBarItemsSideSize * 2) - 10
		}
		
		_snackBarLeftActionText = UILabel(frame: CGRect(x: _snackBarItemsSideSize,
			y: (_snackBarView.frame.height / 2) - (textSize.height / 2),
			width: textWidth,
			height: textSize.height))
		
		_snackBarLeftActionText.text = message
		_snackBarLeftActionText.textColor = UIColor.init(netHex: _leftActionTextColor)
		_snackBarLeftActionText.font = UIFont.systemFontOfSize(_leftActionTextSize)
		
		_snackBarView.addSubview(_snackBarLeftActionText!)
	}
	
	/**
		Show the SnackBar on view passed on parameter
	*/
	internal func show(onView :UIView, message :String) {
		
		if (_shown == true || _animating == true) {
			print("Je suis déjà là")
			return
		}
		_animating = true
		addActionText(message)
		onView.addSubview(_snackBarView)
		UIView.animateWithDuration(_animationTime, animations: { _ in
			self._snackBarView.frame = CGRect(x: self._spaceOnSide,
				y: Double(self._screenSize.height) - (self._spaceOnBottom + self._snackViewHeight),
				width: Double(self._screenSize.width) - (self._spaceOnSide * 2),
				height: self._snackViewHeight)
			}, completion: { _ in
				self._animating = false
				self._shown = true
		})
	}
	
	/**
		Dismiss the SnackbarView
	*/
	internal func dismiss() {
		
		if (_shown == false || _animating == true) {
			print("Je suis pas là")
			return
		}
		_animating = true
		UIView.animateWithDuration(_animationTime, animations: { _ in
			self._snackBarView.frame = CGRect(x: self._spaceOnSide,
				y: Double(self._screenSize.height),
				width: Double(self._screenSize.width) - (self._spaceOnSide * 2),
				height: self._snackViewHeight)
			
			}, completion: {_ in
				self._snackBarLeftActionText.removeFromSuperview()
				self._snackBarView.removeFromSuperview()
				self._animating = false
				self._shown = false
		})
		
	}
	
	/**
		Handler for the right action button
	*/
	func actionButtonPressed(sender :UIButton) {
		print("Undo button pressed")
	}
}
