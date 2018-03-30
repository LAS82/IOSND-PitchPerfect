//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Leandro Alves Santos on 26/03/18.
//  Copyright © 2018 Leandro Alves Santos. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        stopRecordingButton.isEnabled = false
    }


    @IBAction func recordAudio(_ sender: Any) {
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(fileURLWithPath: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        recordingLabel.text = "Recording in Progress"
        recordButton.isEnabled = !recordButton.isEnabled
        stopRecordingButton.isEnabled = !stopRecordingButton.isEnabled
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
        recordingLabel.text = "Tap to Record"
        recordButton.isEnabled = !recordButton.isEnabled
        stopRecordingButton.isEnabled = !stopRecordingButton.isEnabled
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("A")
        if segue.identifier == "stopRecording" {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
    
    func configureScreen(initialState: Bool) {
        recordButton.isEnabled = forRecord
        stopRecordingButton.isEnabled = !forRecord
        
        recordingLabel.text = forRecord ? "Tap to Record" : "Recording in Progress"
    }
    
}

