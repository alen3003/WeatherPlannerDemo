import UIKit

extension CityDetailsTableViewCell: ConstructViewsProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        nameLabel = UILabel()
        markLabel = UILabel()
        valueLabel = UILabel()
        
        stackView = UIStackView(arrangedSubviews: [nameLabel, markLabel, valueLabel])
        
        contentView.addSubview(stackView)
    }
    
    func styleViews() {
        selectionStyle = .none
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.textColor = Color.systemLabel
        markLabel.textColor = Color.systemLabel
        valueLabel.textColor = Color.systemLabel
        
        nameLabel.font = Font.systemSemibold14
        markLabel.font = Font.systemSemibold14
        valueLabel.font = Font.systemSemibold14
        
        nameLabel.textAlignment = .left
        markLabel.textAlignment = .center
        valueLabel.textAlignment = .right
        
        nameLabel.numberOfLines = 0
        
        stackView.distribution = .fillEqually
        stackView.alignment = .center
    }
    
    func defineLayoutForViews() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
}
