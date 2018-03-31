//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Leandro Alves Santos on 29/03/18.
//  Copyright © 2018 Leandro Alves Santos. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    // MARK: - Outlet properties
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    // MARK: - Other properties
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    
    // MARK: - Enums
    
    //Indicates which button was pressed
    enum ButtonType: Int {
        case slow = 0,
        fast,
        chipmunk,
        vader,
        echo,
        reverb
    }

    
    // MARK: - Controller Overrides
    
    //Initial audio setup
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupAudio()
    }
    
    //Configure UI to it's initial state
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }

    
    // MARK: - Action functions
    
    //Plays audio file
    @IBAction func playSoundForButton(_ sender: UIButton) {
        
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    //Stops audio reproduction
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        
        stopAudio()
    }

}
