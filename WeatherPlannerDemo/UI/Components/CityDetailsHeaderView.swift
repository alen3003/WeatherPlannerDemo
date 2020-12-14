import UIKit

class CityDetailsHeaderView: UITableViewHeaderFooterView {

    static let reuseIdentifier = String(describing: CityDetailsHeaderView.self)
    
    var backgroundOverlay: UIView!
    var temperatureLabel: UILabel!
    var maxTempLabel: UILabel!
    var minTempLabel: UILabel!
    var windspeedLabel: UILabel!
    var innerStackView: UIStackView!
    var stackView: UIStackView!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        buildViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        buildViews()
    }
    
    func set(viewModel: CityViewModel) {
        temperatureLabel.text = viewModel.temperature
        maxTempLabel.text = viewModel.maxTemperature
        minTempLabel.text = viewModel.minTemperature
        windspeedLabel.text = viewModel.windSpeed
    }

}
