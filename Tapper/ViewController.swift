//
//  ViewController.swift
//  Tapper
//
//  Created by Lance Douglas on 2/5/16.
//  Copyright © 2016 Lance Douglas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	// Variables
	var maxTaps = 0
	var currentTaps = 0
	
	// Outlets
	@IBOutlet weak var logoImg: UIImageView!
	@IBOutlet weak var tapEntryTxt: UITextField!
	@IBOutlet weak var playBtn: UIButton!
	
	@IBOutlet weak var tapBtn: UIButton!
	@IBOutlet weak var tapsLbl: UILabel!
	@IBOutlet weak var winBtn: UIButton!
	
	// Actions
	@IBAction func onPlayBtnPressed(sender: UIButton!) {
		
		if tapEntryTxt.text  != nil && tapEntryTxt.text != "" {
			
			logoImg.hidden = true
			tapEntryTxt.hidden = true
			playBtn.hidden = true
			tapBtn.hidden = false
			tapsLbl.hidden = false
			
			maxTaps = Int(tapEntryTxt.text!)!
			currentTaps = 0
			
			updateTapsLabel()
		}
	}
	
	@IBAction func onCoinTapped(sender: UIButton!) {
		currentTaps++
		updateTapsLabel()
		if isGameOver() {
			logoImg.hidden = true
			tapEntryTxt.hidden = true
			playBtn.hidden = true
			tapBtn.hidden = true
			tapsLbl.hidden = true
			winBtn.hidden = false
		}
	}
	
	@IBAction func tapWinButton(sender: UIButton!) {
		restartGame()
	}
	
	// Functions
	func updateTapsLabel() {
			tapsLbl.text = "\(currentTaps) Taps"
	}
	
	func isGameOver() -> Bool {
		if currentTaps >= maxTaps {
			return true
		}
		return false
	}
	
	func restartGame() {
		maxTaps = 0
		tapEntryTxt.text = ""
		
		logoImg.hidden = false
		tapEntryTxt.hidden = false
		playBtn.hidden = false
		tapBtn.hidden = true
		tapsLbl.hidden = true
		winBtn.hidden = true
	}
	

}

