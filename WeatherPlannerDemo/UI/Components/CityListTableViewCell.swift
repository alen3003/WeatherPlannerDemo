import UIKit

class CityListTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: self)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        buildViews()
    }

    func set(viewModel: CityViewModel) {
        
    }
}
