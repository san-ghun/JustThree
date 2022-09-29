//
//  ProgressAnimationView.swift
//  JustThree
//
//  Created by Sanghun Park on 29.09.22.
//

import UIKit

class ProgressAnimationView: UIView {

    //MARK: - Properties
    private let firstLayer = CAShapeLayer()
    private let secondLayer = CAShapeLayer()
    
    private var firstColor: UIColor = .clear
    private var secondColor: UIColor = .clear
    
    private let twoPi: CGFloat = .pi * 2
    private var offset: CGFloat = 0.0
    
//    private var width: CGFloat
//    private var height: CGFloat
//    private var xAxis: CGFloat
//    private var yAxis: CGFloat
    
    var showSingleWave = false
    private var start = false
    
    var progress: CGFloat = 0.0
    var waveHeight: CGFloat = 0.0
    
    //MARK: - Initializers
    override init(frame: CGRect) {
//        width = frame.width
//        height = frame.height
//        xAxis = 0.0
//        yAxis = 0.0
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    //MARK: - Methods
    func setupViews() {
//        bounds = CGRect(x: xAxis, y: yAxis, width: width, height: width)
        clipsToBounds = true
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.masksToBounds = true
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.lightGray.cgColor
        
        waveHeight = 15.0
        
//        firstColor = .cyan
//        secondColor = .cyan.withAlphaComponent(0.4)
//        firstColor = UIColor(red: 0.08, green: 0.42, blue: 0.81, alpha: 0.40)
//        secondColor = UIColor(red: 0.27, green: 0.74, blue: 1.00, alpha: 0.40)
        firstColor = .justThreeProgressUpperBackground
        secondColor = .justThreeProgressLowerBackground
        
        createFirstLayer()
        
        if !showSingleWave {
            createSecondLayer()
        }
        
    }
    
    private func createFirstLayer() {
        firstLayer.frame = bounds
        firstLayer.anchorPoint = .zero
        firstLayer.fillColor = firstColor.cgColor
        layer.addSublayer(firstLayer)
    }
    
    private func createSecondLayer() {
        secondLayer.frame = bounds
        secondLayer.anchorPoint = .zero
        secondLayer.fillColor = secondColor.cgColor
        layer.addSublayer(secondLayer)
    }
    
    func setupProgress(_ pr: CGFloat) {
        progress = pr
        
        let top: CGFloat = 1 * bounds.size.height / 2
//        let top: CGFloat = pr * bounds.size.height - (bounds.size.height * 0.12)
        firstLayer.setValue(bounds.width - top, forKeyPath: "position.y")
        secondLayer.setValue(bounds.width - top, forKeyPath: "position.y")
        
        if !start {
            DispatchQueue.main.async {
                self.startAnim()
            }
        }
    }
    
    private func startAnim() {
        start = true
        waterWaveAnim()
    }
    
    private func waterWaveAnim() {
        let w = bounds.size.width
        let h = bounds.size.height
        
        let bezier = UIBezierPath()
        let path = CGMutablePath()
        
        let startOffsetY = waveHeight * CGFloat(sinf(Float(offset * twoPi * w)))
        var originOffsetY: CGFloat = 0.0
        
        path.move(to: CGPoint(x: 0.0, y: startOffsetY), transform: .identity)
        bezier.move(to: CGPoint(x: 0.0, y: startOffsetY))
        
        for i in stride(from: 0.0, to: w * 300, by: 1) {
            originOffsetY = (waveHeight + 15) * CGFloat(sinf(Float(twoPi / w * i + offset * twoPi / w)))
            bezier.addLine(to: CGPoint(x: i, y: originOffsetY))
        }
        
        bezier.addLine(to: CGPoint(x: w * 300, y: originOffsetY))
        bezier.addLine(to: CGPoint(x: w * 300, y: h))
        bezier.addLine(to: CGPoint(x: 0.0, y: h))
        bezier.addLine(to: CGPoint(x: 0.0, y: originOffsetY))
        bezier.close()
        
        let anim = CABasicAnimation(keyPath: "transform.translation.x")
        anim.duration = 5.0
        anim.fromValue = -w * 0.5
        anim.toValue = -w - w * 0.5
        anim.repeatCount = .infinity
        anim.isRemovedOnCompletion = false
        
        firstLayer.fillColor = firstColor.cgColor
        firstLayer.path = bezier.cgPath
        firstLayer.add(anim, forKey: nil)
        
        if !showSingleWave {
            let bezier = UIBezierPath()
            
            let startOffsetY = waveHeight * CGFloat(sinf(Float(offset * twoPi * w)))
            var originOffsetY: CGFloat = 0.0
            
            bezier.move(to: CGPoint(x: 0.0, y: startOffsetY))
            
            for i in stride(from: 0.0, to: w * 300, by: 1) {
                originOffsetY = (waveHeight - 0) * CGFloat(cosf(Float(twoPi / w * i + offset * twoPi / w)))
                bezier.addLine(to: CGPoint(x: i, y: originOffsetY))
            }
            
            bezier.addLine(to: CGPoint(x: w * 300, y: originOffsetY))
            bezier.addLine(to: CGPoint(x: w * 300, y: h))
            bezier.addLine(to: CGPoint(x: 0.0, y: h))
            bezier.addLine(to: CGPoint(x: 0.0, y: originOffsetY))
            bezier.close()
            
            let anim2 = CABasicAnimation(keyPath: "transform.translation.x")
            anim2.duration = 3.0
            anim2.fromValue = -w * 0.5
            anim2.toValue = -w - w * 0.5
            anim2.repeatCount = .infinity
            anim2.isRemovedOnCompletion = false
            
            secondLayer.fillColor = secondColor.cgColor
            secondLayer.path = bezier.cgPath
            secondLayer.add(anim2, forKey: nil)
        }
    }
}
