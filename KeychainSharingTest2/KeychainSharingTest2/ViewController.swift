//
//  ViewController.swift
//  KeychainSharingTest2
//
//  Created by Akira Matsuda on 2017/05/28.
//  Copyright © 2017 Akira Matsuda. All rights reserved.
//

import UIKit
import UICKeyChainStore

class ViewController: UIViewController {

	@IBOutlet var textField: UITextField!
	@IBOutlet var textLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.readKeychainStore()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func save(_ sender: Any) {
		if let p = Bundle.main.infoDictionary?["AppIdentifierPrefix"] {
			let prefix = p as! String
			print(prefix)
			let accessGroup = prefix + "share"
			let store = UICKeyChainStore(service: "KeychainSharingTest")
			store.setString(self.textField.text, forKey: "Test2")
		}
	}
	
	
	@IBAction func read(_ sender: Any) {
		self.readKeychainStore()
	}
	
	func readKeychainStore() {
		if let p = Bundle.main.infoDictionary?["AppIdentifierPrefix"] {
			let prefix = p as! String
			print(prefix)
			let accessGroup = prefix + "share"
			let store = UICKeyChainStore(service: "KeychainSharingTest")
			if let value = store.string(forKey: "Test1") {
				print(value)
				self.textLabel.text = value
			}
			else {
				print("unknown")
				self.textLabel.text = "unknown"
			}
		}
		else {
			print("unknown")
			self.textLabel.text = "unknown"
		}
	}
	
}

