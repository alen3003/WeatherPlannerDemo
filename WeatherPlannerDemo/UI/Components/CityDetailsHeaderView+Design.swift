import Foundation
import UIKit

extension CityDetailsHeaderView: ConstructViewsProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        backgroundOverlay = UIView()
        backgroundOverlay.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(backgroundOverlay)
    }
    
    func styleViews() {
        tintColor = .white
        
        backgroundOverlay.backgroundColor = Colors.skyBlue
        backgroundOverlay.layer.masksToBounds = true
        backgroundOverlay.layer.cornerRadius = 15
    }
    
    func defineLayoutForViews() {
        NSLayoutConstraint.activate([
            backgroundOverlay.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            backgroundOverlay.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            backgroundOverlay.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            backgroundOverlay.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
}
