動畫的建立主要就是改變其屬性然後讓UIKit自動來產生動畫這樣而已。我們所變更的屬性是其中被標註為Animatable。

以下是Animatable屬性清單。
- frame：視圖的位置與尺寸。
- bounds：視圖的尺寸。
- center：視圖的位置。
- alpha：視圖的透明度。
- backgroundColor：視圖的背景顏色。
- transform：平移、縮放或旋轉視圖。
- contentStretch：拉伸一部分的視圖。

```Swift
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
```

![](https://i.imgur.com/aPOTV9U.gif)

```Swift
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
```

![](https://i.imgur.com/KvOlRfA.gif)

```Swift
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
```

![](https://i.imgur.com/4IJkpch.gif)

```Swift
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
```
 
![](https://i.imgur.com/zNmgcJg.gif)

```Swift
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
```
 
![](https://i.imgur.com/yBLbWzC.gif)

```Swift
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
```
 
![](https://i.imgur.com/9KyiJy5.gif)

