//
//  ProgressHeaderView.swift
//  JustThree
//
//  Created by Sanghun Park on 29.09.22.
//

import UIKit

class ProgressHeaderView: UICollectionReusableView {
    static var elementKind: String { UICollectionView.elementKindSectionHeader }
    
    var progress: CGFloat = 0
    
    private let containerView = UIView(frame: .zero)
    private var progressView: ProgressAnimationView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        progressView = ProgressAnimationView(frame: CGRect(origin: .zero, size: bounds.size))
        progressView = ProgressAnimationView(frame: CGRect(x: 0.0, y: 0.0, width: bounds.width, height: bounds.width))
        prepareSubviews()
        progressView.setupProgress(progressView.progress)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 0.5 * containerView.bounds.width
    }
    
    private func prepareSubviews() {
        containerView.addSubview(progressView)
        addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1),
            
            containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85),
            containerView.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            progressView.centerXAnchor.constraint(equalTo: centerXAnchor),
            progressView.centerYAnchor.constraint(equalTo: centerYAnchor),
            progressView.topAnchor.constraint(equalTo: topAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        backgroundColor = .clear
        containerView.backgroundColor = .clear
    }
}
