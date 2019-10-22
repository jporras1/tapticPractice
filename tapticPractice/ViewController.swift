//
//  ViewController.swift
//  tapticPractice
//
//  Created by Javier Porras jr on 10/21/19.
//  Copyright © 2019 Javier Porras jr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
 
    let notificationLabel: UILabel! = labelFor(title: "Notification Feedback")
    let impactLabel: UILabel! = labelFor(title: "Impact Feedback")
    let selectionLabel: UILabel! = labelFor(title: "Selection Feedback")
    
    var errorButton: UIButton = buttonFor("error", with: .red, tag: 0)
    var successButton: UIButton = buttonFor("Success", with: .green, tag: 1)
    var warningButton: UIButton = buttonFor("Warning", with: .orange, tag: 2)
    var lightButton: UIButton = buttonFor("Light", with: .lightGray, tag: 3)
    var mediumButton: UIButton = buttonFor("Medium", with: .gray, tag: 4)
    var heavyButton: UIButton = buttonFor("Heavy", with: .darkGray, tag: 5)
    var selectionButton: UIButton = buttonFor("Selection", with: .green, tag: 6)

    let rocker: UISwitch = {
        let rocker = UISwitch()
        rocker.translatesAutoresizingMaskIntoConstraints = false
        rocker.onTintColor = .green
        return rocker
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupViews()
    }
    static func labelFor(title: String)->UILabel{
        let label = UILabel()
        label.text = title
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    static func buttonFor(_ buttonName: String, with color: UIColor, tag: Int) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(buttonName, for: .normal)
        button.backgroundColor = color
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tag = tag
        return button
    }
    
    @objc func buttonTapped(_ sender: UIButton){
        let feedBackType: UINotificationFeedbackGenerator.FeedbackType
        let feedBackStyle: UIImpactFeedbackGenerator.FeedbackStyle
        
        switch sender.tag {
        case 0:
            feedBackType = .error
            print("hit error")
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(feedBackType)
        case 1:
            feedBackType = .success
            print("hit success")
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(feedBackType)
        case 2:
            feedBackType = .warning
            print("hit warning")
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(feedBackType)
        case 3:
            print("hit light")
            feedBackStyle = .light
            let generator = UIImpactFeedbackGenerator(style: feedBackStyle)
            generator.prepare()
            generator.impactOccurred()
        case 4:
            print("hit medium")
            feedBackStyle = .medium
            let generator = UIImpactFeedbackGenerator(style: feedBackStyle)
            generator.prepare()
            generator.impactOccurred()
            return
        case 5:
            print("hit heavy")
            feedBackStyle = .heavy
            let generator = UIImpactFeedbackGenerator(style: feedBackStyle)
            generator.prepare()
            generator.impactOccurred()
            return
        case 6:
            print("hit Selector")
            let generator = UISelectionFeedbackGenerator()
            generator.selectionChanged()
            return
        default:
            return
        }
    }
    
    func addTargetTo(_ buttons: UIButton...){
        buttons.forEach{
            $0.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        }
    }
    
    func setupViews(){
        view.addSubviews(notificationLabel, impactLabel, selectionLabel, errorButton, successButton, warningButton, lightButton, mediumButton, heavyButton, selectionButton, rocker)
        
        notificationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        notificationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        notificationLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        notificationLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        successButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        successButton.topAnchor.constraint(equalTo: notificationLabel.bottomAnchor, constant: 40).isActive = true
        successButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        successButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        errorButton.rightAnchor.constraint(equalTo: successButton.leftAnchor, constant: -20).isActive = true
        errorButton.topAnchor.constraint(equalTo: successButton.topAnchor).isActive = true
        errorButton.widthAnchor.constraint(equalTo: successButton.widthAnchor).isActive = true
        errorButton.heightAnchor.constraint(equalTo: successButton.heightAnchor).isActive = true
        
        warningButton.leftAnchor.constraint(equalTo: successButton.rightAnchor, constant: 20).isActive = true
        warningButton.topAnchor.constraint(equalTo: successButton.topAnchor).isActive = true
        warningButton.widthAnchor.constraint(equalTo: successButton.widthAnchor).isActive = true
        warningButton.heightAnchor.constraint(equalTo: successButton.heightAnchor).isActive = true
        
        impactLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        impactLabel.topAnchor.constraint(equalTo: successButton.bottomAnchor, constant: 50).isActive = true
        impactLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        impactLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        mediumButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mediumButton.topAnchor.constraint(equalTo: impactLabel.bottomAnchor, constant: 40).isActive = true
        mediumButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        mediumButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        lightButton.rightAnchor.constraint(equalTo: mediumButton.leftAnchor, constant: -20).isActive = true
        lightButton.topAnchor.constraint(equalTo: mediumButton.topAnchor).isActive = true
        lightButton.widthAnchor.constraint(equalTo: successButton.widthAnchor).isActive = true
        lightButton.heightAnchor.constraint(equalTo: successButton.heightAnchor).isActive = true
        
        heavyButton.leftAnchor.constraint(equalTo: mediumButton.rightAnchor, constant: 20).isActive = true
        heavyButton.topAnchor.constraint(equalTo: mediumButton.topAnchor).isActive = true
        heavyButton.widthAnchor.constraint(equalTo: successButton.widthAnchor).isActive = true
        heavyButton.heightAnchor.constraint(equalTo: successButton.heightAnchor).isActive = true
        
        selectionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        selectionLabel.topAnchor.constraint(equalTo: mediumButton.bottomAnchor, constant: 50).isActive = true
        selectionLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        selectionLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        selectionButton.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -20).isActive = true
        selectionButton.topAnchor.constraint(equalTo: selectionLabel.bottomAnchor, constant: 40).isActive = true
        selectionButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        selectionButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        rocker.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 20).isActive = true
        rocker.topAnchor.constraint(equalTo: selectionButton.topAnchor).isActive = true
        rocker.widthAnchor.constraint(equalTo: successButton.widthAnchor).isActive = true
        rocker.heightAnchor.constraint(equalTo: successButton.heightAnchor).isActive = true
        
        addTargetTo(errorButton, successButton, warningButton, lightButton, mediumButton, heavyButton, selectionButton)
    }
}
extension UIView{
    func addSubviews(_ views: UIView...){
        views.forEach{
            self.addSubview($0)
        }
    }
}

/////NICE code I found that gives me an idea to make the code better. Withe the below you can call a selecto like the way below this extension.
//
//extension Selector {
//    static let fireworks = #selector(Effects.fireworks)
//    static let onButtonTapped = #selector(ViewController.onButtonTapped(_:))
//}

//button.addTarget(self, selector: .onButtonTapped, for: .touchUpInside)
