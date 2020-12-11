import UIKit
import PureLayout

extension CityListTableViewCell: ConstructViewsProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        backgroundImageView = UIImageView()
        contentView.addSubview(backgroundImageView)
        
        descriptionLabel = UILabel()
        cityNameLabel = UILabel()
        temperatureLabel = UILabel()
        
        innerStackView = UIStackView(arrangedSubviews: [descriptionLabel, cityNameLabel])
        stackView = UIStackView(arrangedSubviews: [innerStackView, temperatureLabel])
        contentView.addSubview(stackView)
    }
    
    func styleViews() {
        selectionStyle = .none
        
        backgroundImageView.layer.masksToBounds = true
        backgroundImageView.layer.cornerRadius = 8
        
        descriptionLabel.textColor = .white
        cityNameLabel.textColor = .white
        temperatureLabel.textColor = .white
        
        descriptionLabel.font = Font.systemBold40
        cityNameLabel.font = Font.systemBold20
        temperatureLabel.font = Font.systemBold100
        
        innerStackView.alignment = .center
        innerStackView.axis = .vertical
        
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 8
    }
    
    func defineLayoutForViews() {
        backgroundImageView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
        
        stackView.autoCenterInSuperview()
    }
    
}
