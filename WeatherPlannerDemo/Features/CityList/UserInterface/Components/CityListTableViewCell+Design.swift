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
        backgroundImageView.layer.cornerRadius = 15
        backgroundImageView.image = UIImage(named: BundleImage.backgroundImage.rawValue)

        descriptionLabel.textColor = Color.systemWhite
        cityNameLabel.textColor = Color.systemWhite
        temperatureLabel.textColor = Color.systemWhite

        descriptionLabel.font = Font.systemBold40
        cityNameLabel.font = Font.systemBold20
        temperatureLabel.font = Font.systemBold100

        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0

        innerStackView.alignment = .center
        innerStackView.axis = .vertical

        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 8
    }

    func defineLayoutForViews() {
        backgroundImageView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))

        stackView.autoAlignAxis(toSuperviewAxis: .horizontal)
        stackView.autoPinEdge(.leading, to: .leading, of: contentView, withOffset: 8)
        stackView.autoPinEdge(.trailing, to: .trailing, of: contentView, withOffset: 8)
    }

}
