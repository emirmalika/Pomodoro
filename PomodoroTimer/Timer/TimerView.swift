//
//  TimerView.swift
//  PomodoroTimer
//
//  Created by Malik Em on 28.02.2023.
//

import UIKit

class TimerView: UIView {
    
    let timerLabel = UILabel()
    let progressView = UIProgressView()

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
         timerLabel,
         progressView].forEach {
             $0.translatesAutoresizingMaskIntoConstraints = false
         }

        timerLabel.backgroundColor = .quaternaryLabel
        timerLabel.text = "25:00"
        timerLabel.textAlignment = .center
        timerLabel.textColor = .white
        timerLabel.font = UIFont.boldSystemFont(ofSize: 80)
        timerLabel.layer.masksToBounds = true
        timerLabel.layer.cornerRadius = 20
       
        progressView.progressViewStyle = .bar
        progressView.trackTintColor = .systemGray
        progressView.progressTintColor = .white
        progressView.progress = 0.5
    
    }
    
    private func layout() {
        addSubview(timerLabel)
        addSubview(progressView)
        
        NSLayoutConstraint.activate([
            timerLabel.topAnchor.constraint(equalTo: topAnchor),
            timerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            timerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            timerLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor),
            progressView.bottomAnchor.constraint(equalTo: timerLabel.topAnchor, constant: 200)
        ])
    }
}
                                   
