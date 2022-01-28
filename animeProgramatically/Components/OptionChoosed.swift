//
//  OptionChoosed.swift
//  animeProgramatically
//
//  Created by Mac on 28/01/22.
//

import Foundation
import UIKit

public protocol OptionChoosenProtocol {
    func didChoiceOption(_ gender: String)
}

public struct Option {
    public var title: String
    public var endPoint: String
    
    
    public init(title: String, endPoint: String){
        self.title = title
        self.endPoint = endPoint
    }
}

open class OptionChoosed: UIView {
    var delegate: OptionChoosenProtocol?
    public var heightSize = 0.0
    public var parent: UIView?
    private lazy var choosedButton: UIButton = {
    let button = UIButton()
        button.setTitle("aaa", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(selectAnOption), for: .touchUpInside)
        return button
    }()
    private lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.isHidden = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.bounces = false
        return scrollView
    }()
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 5.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        return stackView
    }()
    
    public convenience init(options: [Option], parent: UIView){
        self.init()
        self.parent = parent
        self.addSubview(choosedButton)
        self.parent?.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        if options.count > 3 {
            heightSize = (3.5 * 40)
        } else {
            heightSize = Double((options.count * 40))
        }
        
        setSecondsConstrains()
        
        
        for option in options {
            let titleForGender = OptionChoosedButton(option.endPoint, option.title)
            titleForGender.translatesAutoresizingMaskIntoConstraints = false
            titleForGender.backgroundColor = .blue
            titleForGender.addTarget(self, action: #selector(genderChoosedTapped(_:)), for: .touchUpInside)
            
            stackView.addArrangedSubview(titleForGender)
            
                NSLayoutConstraint.activate([
                    titleForGender.heightAnchor.constraint(equalToConstant: 40),
                    titleForGender.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
                    titleForGender.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
                    titleForGender.widthAnchor.constraint(equalTo: stackView.widthAnchor),
                ])
            
        }
        }
    
    @objc func selectAnOption(){
         scrollView.isHidden = false
    }
    // el guion bajo siempre se tiene que hacer al pasar referencia para pasar parametro
    @objc func genderChoosedTapped(_ sender: OptionChoosedButton){
//        print(sender.endPoint)
        let endPoin = sender.endPoint
//        print(endPoin)
        choosedButton.setTitle(sender.titleLabel?.text, for: .normal)
        scrollView.isHidden = true
        delegate?.didChoiceOption(endPoin)
        // llamar a la funcion del delegado
            //caera en el main
        //view controller de ahi al presenter de ahi al interactor
    }
    
    public func setUi(reference: UIView){
        NSLayoutConstraint.activate([
        scrollView.topAnchor.constraint(equalTo: reference.bottomAnchor),
        scrollView.leadingAnchor.constraint(equalTo: reference.leadingAnchor),
        scrollView.trailingAnchor.constraint(equalTo: reference.trailingAnchor),
        scrollView.heightAnchor.constraint(equalToConstant: heightSize),
        scrollView.widthAnchor.constraint(equalTo: reference.widthAnchor),
        
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        stackView.widthAnchor.constraint(equalTo: reference.widthAnchor),
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setSecondsConstrains(){
        
        NSLayoutConstraint.activate([
            choosedButton.topAnchor.constraint(equalTo: self.topAnchor),
            choosedButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            choosedButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            choosedButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

class OptionChoosedButton: UIButton {
    public var endPoint: String = ""
    
    public convenience init(_ endPoint: String, _ title: String){
        self.init()
        self.endPoint = endPoint
        self.setTitle(title, for: .normal)
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
