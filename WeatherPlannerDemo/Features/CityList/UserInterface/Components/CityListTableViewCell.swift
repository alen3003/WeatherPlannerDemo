import UIKit

class CityListTableViewCell: UITableViewCell {

    static let reuseIdentifier = String(describing: CityListTableViewCell.self)

    var backgroundImageView: UIImageView!
    var descriptionLabel: UILabel!
    var cityNameLabel: UILabel!
    var temperatureLabel: UILabel!
    var innerStackView: UIStackView!
    var stackView: UIStackView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        buildViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        buildViews()
    }

    func set(viewModel: CityViewModel) {
        backgroundImageView.image = UIImage(named: "cityBackground")
        descriptionLabel.text = viewModel.weatherDescription
        cityNameLabel.text = viewModel.cityName
        temperatureLabel.text = viewModel.temperature
    }

}
