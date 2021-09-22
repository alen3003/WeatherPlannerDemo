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
        
        temperatureLabel = UILabel()
        maxTempLabel = UILabel()
        minTempLabel = UILabel()
        windspeedLabel = UILabel()
        
        innerStackView = UIStackView(arrangedSubviews: [maxTempLabel, minTempLabel])
        stackView = UIStackView(arrangedSubviews: [temperatureLabel, innerStackView, windspeedLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundOverlay.addSubview(stackView)
    }
    
    func styleViews() {
        tintColor = Color.systemClear
        
        backgroundOverlay.backgroundColor = Color.darkBlue
        backgroundOverlay.layer.masksToBounds = true
        backgroundOverlay.layer.cornerRadius = 15
        
        temperatureLabel.textColor = Color.systemWhite
        maxTempLabel.textColor = Color.systemWhite
        minTempLabel.textColor = Color.systemWhite
        windspeedLabel.textColor = Color.systemWhite
        
        temperatureLabel.font = Font.systemBold80
        maxTempLabel.font = Font.systemSemibold17
        minTempLabel.font = Font.systemSemibold17
        windspeedLabel.font = Font.systemSemibold17
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 6
        
        innerStackView.spacing = 5
    }
    
    func defineLayoutForViews() {
        NSLayoutConstraint.activate([
            backgroundOverlay.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            backgroundOverlay.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            backgroundOverlay.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            backgroundOverlay.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: backgroundOverlay.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: backgroundOverlay.centerYAnchor)
        ])
    }
    
}
