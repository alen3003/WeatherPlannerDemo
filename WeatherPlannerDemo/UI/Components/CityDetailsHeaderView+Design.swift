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
        tintColor = .white
        
        backgroundOverlay.backgroundColor = Colors.darkBlue
        backgroundOverlay.layer.masksToBounds = true
        backgroundOverlay.layer.cornerRadius = 15
        
        temperatureLabel.textColor = .white
        maxTempLabel.textColor = .white
        minTempLabel.textColor = .white
        windspeedLabel.textColor = .white
        
        temperatureLabel.font = Font.systemBold80
        maxTempLabel.font = Font.system15
        minTempLabel.font = Font.system15
        windspeedLabel.font = Font.system15
        
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
