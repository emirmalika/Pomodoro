//
//  ViewController.swift
//  PomodoroTimer
//
//  Created by Malik Em on 27.02.2023.
//

import UIKit

class TimerViewController: UIViewController {
    
    let segmentedControl = UISegmentedControl(items: ["Work", "Short break", "Long break"])

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension TimerViewController {
    private func style() {
        view.backgroundColor = UIColor((#colorLiteral(red: 0.9607843137, green: 0.3137254902, blue: 0.3137254902, alpha: 1)))
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.cornerRadius = 9
        segmentedControl.layer.borderWidth = 1
        segmentedControl.layer.masksToBounds = true
        segmentedControl.layer.borderColor = UIColor.white.cgColor
        segmentedControl.tintColor = UIColor.white
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
    }
    
    private func layout() {
        view.addSubview(segmentedControl)

        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}

extension TimerViewController {
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            view.backgroundColor = UIColor((#colorLiteral(red: 0.9607843137, green: 0.3137254902, blue: 0.3137254902, alpha: 1)))
        case 1:
            view.backgroundColor = UIColor((#colorLiteral(red: 0.7137254902, green: 0.8862745098, blue: 0.631372549, alpha: 1)))
        default:
            view.backgroundColor = UIColor((#colorLiteral(red: 0.5254901961, green: 0.6392156863, blue: 0.7215686275, alpha: 1)))
        }
    }
}
