//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Leandro Alves Santos on 26/03/18.
//  Copyright © 2018 Leandro Alves Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        stopRecordingButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(_ sender: Any) {
        print("recordAudio_Click")
        recordingLabel.text = "Recording in Progress"
        recordButton.isEnabled = !recordButton.isEnabled
        stopRecordingButton.isEnabled = !stopRecordingButton.isEnabled
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        print("stopAudio_Click")
        recordingLabel.text = "Tap to Record"
        recordButton.isEnabled = !recordButton.isEnabled
        stopRecordingButton.isEnabled = !stopRecordingButton.isEnabled
    }
    
}

