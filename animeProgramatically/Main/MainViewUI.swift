//
//  MainViewUI.swift
//  animeProgramatically
//
//  Created by Mac on 27/01/22.
//

import Foundation
import UIKit

protocol MainViewUIDelegate {
    
}

class MainViewUI: UIView{
    var delegate: MainViewUIDelegate?
    var navigationController: UINavigationController?
    let optionArray: [Option] = [Option(title: "valor 1", endPoint: "endpoint1"),
                                 Option(title: "valor2", endPoint: "endpoint2"),
                                 Option(title: "valor3", endPoint: "endpoint3"),
                                 Option(title: "valor4", endPoint: "endpoint4"),
    ]
    
    
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to suffering ^-^"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    
    private lazy var asdasdas: OptionChoosed = {
        let button = OptionChoosed(options: optionArray, parent: self)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var animeImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "house")
        return image
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: MainViewUIDelegate){
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            
            setUI()
            setConstraints()
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUI(){
        self.backgroundColor = .gray
        self.addSubview(welcomeLabel)
        self.addSubview(animeImage)
        self.addSubview(asdasdas)
    }
    func setConstraints(){
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: self.topAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            welcomeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 80),
            
            
            asdasdas.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor),
            asdasdas.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            asdasdas.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            asdasdas.heightAnchor.constraint(equalToConstant: 40),
            
            animeImage.topAnchor.constraint(equalTo: asdasdas.bottomAnchor),
            animeImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            animeImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            animeImage.heightAnchor.constraint(equalToConstant: 400),
            
        ])
        asdasdas.setUi(reference: asdasdas)
    }
}
