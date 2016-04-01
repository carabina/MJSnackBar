//
//  ViewController.swift
//  MJSnackBarExample
//
//  Created by Maxime Junger on 01/04/16.
//  Copyright © 2016 Maxime Junger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let snackbar = MJSnackBar()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	
	@IBAction func showSnackBar(sender: AnyObject) {
		
		snackbar.show(self.view, message: "Deleted some element lol")
	}

	@IBAction func hideSnackBar(sender: AnyObject) {
		snackbar.dismiss()
	}
}

