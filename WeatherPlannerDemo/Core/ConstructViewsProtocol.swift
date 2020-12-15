/**
  Formalizes view construction into separate lifecycle steps:
  - creating views - creates and initializes all child views
  - styling views - sets style properties for each child view
  - define layout for views - sets layout constraints for each view
*/
public protocol ConstructViewsProtocol {

    func createViews()

    func styleViews()

    func defineLayoutForViews()

}
