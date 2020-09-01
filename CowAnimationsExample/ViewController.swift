//
//  ViewController.swift
//  CowAnimationsExample
//
//  Created by steven on 2020/9/1.
//  Copyright © 2020 steven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var doughnutImageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    func initUI(){
        doughnutImageView = UIImageView()
        doughnutImageView.frame = CGRect.init(x: 20, y: 100, width: 100, height: 100)
        doughnutImageView.image = UIImage.init(named: "doughnut")
        doughnutImageView.contentMode = .scaleAspectFit
        self.view.addSubview(doughnutImageView)
        
        let moveButton = UIButton()
        moveButton.setTitle("move", for: .normal)
        moveButton.backgroundColor = UIColor.color_MediumBlue
        moveButton.layer.cornerRadius = 10
        moveButton.setTitleColor(.white, for: .normal)
        moveButton.setTitleColor(.lightGray, for: .highlighted)
        moveButton.addTarget(self, action: #selector(moveButtonPress(sender:)), for: .touchUpInside)
        
        let sizeButton = UIButton()
        sizeButton.setTitle("size", for: .normal)
        sizeButton.backgroundColor = UIColor.color_MediumBlue
        sizeButton.layer.cornerRadius = 10
        sizeButton.setTitleColor(.white, for: .normal)
        sizeButton.setTitleColor(.lightGray, for: .highlighted)
        sizeButton.addTarget(self, action: #selector(sizeButtonPress(sender:)), for: .touchUpInside)

        let alphaButton = UIButton()
        alphaButton.setTitle("alpha", for: .normal)
        alphaButton.backgroundColor = UIColor.color_MediumBlue
        alphaButton.layer.cornerRadius = 10
        alphaButton.setTitleColor(.white, for: .normal)
        alphaButton.setTitleColor(.lightGray, for: .highlighted)
        alphaButton.addTarget(self, action: #selector(alphaButtonPress(sender:)), for: .touchUpInside)
        
        let backgroundColorButton = UIButton()
        backgroundColorButton.setTitle("backgroundColor", for: .normal)
        backgroundColorButton.backgroundColor = UIColor.color_MediumBlue
        backgroundColorButton.layer.cornerRadius = 10
        backgroundColorButton.setTitleColor(.white, for: .normal)
        backgroundColorButton.setTitleColor(.lightGray, for: .highlighted)
        backgroundColorButton.addTarget(self, action: #selector(backgroundColorButtonPress(sender:)), for: .touchUpInside)
        
        let transformButton = UIButton()
        transformButton.setTitle("transform", for: .normal)
        transformButton.backgroundColor = UIColor.color_MediumBlue
        transformButton.layer.cornerRadius = 10
        transformButton.setTitleColor(.white, for: .normal)
        transformButton.setTitleColor(.lightGray, for: .highlighted)
        transformButton.addTarget(self, action: #selector(transformButtonPress(sender:)), for: .touchUpInside)

        let rotationAngleButton = UIButton()
        rotationAngleButton.setTitle("transform", for: .normal)
        rotationAngleButton.backgroundColor = UIColor.color_MediumBlue
        rotationAngleButton.layer.cornerRadius = 10
        rotationAngleButton.setTitleColor(.white, for: .normal)
        rotationAngleButton.setTitleColor(.lightGray, for: .highlighted)
        rotationAngleButton.addTarget(self, action: #selector(rotationAngleButtonPress(sender:)), for: .touchUpInside)
        
        let buttonStaclView = UIStackView.init(arrangedSubviews: [moveButton,sizeButton,alphaButton,backgroundColorButton,transformButton,rotationAngleButton])
        buttonStaclView.axis = .vertical
        buttonStaclView.distribution = .fillEqually
        buttonStaclView.frame = CGRect.init(x: 20, y: 300, width: 150, height: 300)
        buttonStaclView.spacing = 10
        self.view.addSubview(buttonStaclView)
    }
    
/*** 平移 */
@objc func moveButtonPress(sender:UIButton){
    sender.isSelected = !sender.isSelected
    if sender.isSelected {
        UIView.animate(withDuration: 0.3, animations: {
            self.doughnutImageView.frame = CGRect.init(x: 220, y: 100, width: 100, height: 100)
        })
    }else{
        UIView.animate(withDuration: 0.3, animations: {
            self.doughnutImageView.frame = CGRect.init(x: 20, y: 100, width: 100, height: 100)
        })
    }
}

/*** 放大縮小 */
@objc func sizeButtonPress(sender:UIButton){
    sender.isSelected = !sender.isSelected
    if sender.isSelected {
        UIView.animate(withDuration: 0.3, animations: {
            self.doughnutImageView.frame = CGRect.init(x: 20, y: 100, width: 100*1.2, height: 100*1.2)
        })
    }else{
        UIView.animate(withDuration: 0.3, animations: {
            self.doughnutImageView.frame = CGRect.init(x: 20, y: 100, width: 100, height: 100)
        })
    }
}

/*** 隱藏淡入淡出 */
@objc func alphaButtonPress(sender:UIButton){
    sender.isSelected = !sender.isSelected
    var alpha:CGFloat = 0.0
    if sender.isSelected {
        alpha = 0.0
    }else{
        alpha = 1.0
    }
    
    UIView.animate(withDuration: 0.3,
                   delay: 0.2,
                   options: .curveEaseIn,
                   animations: {
                    self.doughnutImageView.alpha = alpha
    }, completion: { _ in
        print("Animation BackgroundColor Complete")
    })
}

/*** 背景顏色漸變 */
@objc func backgroundColorButtonPress(sender:UIButton){
    sender.isSelected = !sender.isSelected
    var bgColor = UIColor()
    if sender.isSelected {
        bgColor = UIColor.color_darkGreyBlue
    }else{
        bgColor = UIColor.color_MediumRed
    }
    
    UIView.animate(withDuration: 0.3,
                   delay: 0.2,
                   options: .curveEaseIn,
                   animations: {
                    self.doughnutImageView.backgroundColor = bgColor
    }, completion: { _ in
        print("Animation BackgroundColor Complete")
    })
}

/*** 水平翻轉 */
@objc func transformButtonPress(sender:UIButton){
    sender.isSelected = !sender.isSelected
    var transform = CGAffineTransform()
    if sender.isSelected {
        transform = CGAffineTransform(scaleX: -1, y: 1)
    }else{
        transform = CGAffineTransform(scaleX: 1, y: 1)
    }

    UIView.animate(withDuration: 0.3,
                   delay: 0.2,
                   options: .curveEaseIn,
                   animations: {
                    self.doughnutImageView.transform = transform
    }, completion: { _ in
        print("Animation BackgroundColor Complete")
    })
}

/*** 旋轉 */
@objc func rotationAngleButtonPress(sender:UIButton){
    sender.isSelected = !sender.isSelected
    var oneDegree: CGFloat = 0.0
    if sender.isSelected {
        oneDegree = CGFloat.pi / 180
    }else{
        oneDegree = CGFloat.pi / 30
    }
    
    UIView.animate(withDuration: 0.3,
                   delay: 0.2,
                   options: .curveEaseIn,
                   animations: {
                    self.doughnutImageView.transform = CGAffineTransform(rotationAngle: oneDegree * 45)
    }, completion: { _ in
        print("Animation BackgroundColor Complete")
    })
}
}

