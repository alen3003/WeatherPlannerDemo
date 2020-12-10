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
        
        nameLabel.textColor = .black
        markLabel.textColor = .black
        valueLabel.textColor = .black
        
        nameLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        markLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        valueLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        
        nameLabel.textAlignment = .left
        markLabel.textAlignment = .center
        valueLabel.textAlignment = .right
        
        stackView.distribution = .fillEqually
        stackView.alignment = .center
    }
    
    func defineLayoutForViews() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
}
