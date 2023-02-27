//
//  TimerView.swift
//  PomodoroTimer
//
//  Created by Malik Em on 28.02.2023.
//

import UIKit

class TimerView: UIView {
    
    let titleLabel = UILabel()
    let timerLabel = UILabel()
    let progressView = UIProgressView()
    let playButton = UIButton()
    let stopButton = UIButton()
    let restartButton = UIButton()
    let newTaskButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TimerView {
    private func style() {
        [
         titleLabel,
         timerLabel,
         progressView,
         playButton,
         stopButton,
         restartButton,
         newTaskButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func layout() {
       
    }
}
                                   
