import UIKit

class CityDetailsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: CityListTableViewCell.self)
    
    var nameLabel: UILabel!
    var markLabel: UILabel!
    var valueLabel: UILabel!
    var stackView: UIStackView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        buildViews()
    }

    func set(_ viewModelDescription: (name: String, mark: String, value: String)) {
        nameLabel.text = viewModelDescription.name
        markLabel.text = viewModelDescription.mark
        valueLabel.text = viewModelDescription.value
    }
}
