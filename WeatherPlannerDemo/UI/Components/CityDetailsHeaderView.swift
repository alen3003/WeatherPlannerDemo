import UIKit

class CityDetailsHeaderView: UITableViewHeaderFooterView {

    static let reuseIdentifier = String(describing: CityDetailsHeaderView.self)
    
    var backgroundOverlay: UIView!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        buildViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        buildViews()
    }
    
    func set(viewModel: CityViewModel) {
        
    }
}
