// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable variable_name
// swiftlint:disable line_length

import RxSwift
@testable import WeatherPlannerDemo
class CityDetailsUseCaseProtocolMock: CityDetailsUseCaseProtocol {

    // MARK: - getPollutionInfo
    var getPollutionInfoCoordinationCityIDCallsCount = 0
    var getPollutionInfoCoordinationCityIDCalled: Bool {
        return getPollutionInfoCoordinationCityIDCallsCount > 0
    }
    var getPollutionInfoCoordinationCityIDReceivedArguments: (coordination: City.Coordination, cityID: Int)?
    var getPollutionInfoCoordinationCityIDReceivedInvocations: [(coordination: City.Coordination, cityID: Int)] = []
    var getPollutionInfoCoordinationCityIDReturnValue: Observable<CDAirPollution?>!
    var getPollutionInfoCoordinationCityIDClosure: ((City.Coordination, Int) -> Observable<CDAirPollution?>)?
    func getPollutionInfo(coordination: City.Coordination, cityID: Int) -> Observable<CDAirPollution?> {
        getPollutionInfoCoordinationCityIDCallsCount += 1
        getPollutionInfoCoordinationCityIDReceivedArguments = (coordination: coordination, cityID: cityID)
        getPollutionInfoCoordinationCityIDReceivedInvocations.append((coordination: coordination, cityID: cityID))
        return getPollutionInfoCoordinationCityIDClosure.map({ $0(coordination, cityID) }) ?? getPollutionInfoCoordinationCityIDReturnValue
    }
}
class CityListUseCaseProtocolMock: CityListUseCaseProtocol {

    // MARK: - getCitiesInCircle
    var getCitiesInCircleRangeCallsCount = 0
    var getCitiesInCircleRangeCalled: Bool {
        return getCitiesInCircleRangeCallsCount > 0
    }
    var getCitiesInCircleRangeReceivedArguments: (coordinate: City.Coordination, range: Int)?
    var getCitiesInCircleRangeReceivedInvocations: [(coordinate: City.Coordination, range: Int)] = []
    var getCitiesInCircleRangeReturnValue: Observable<[CDCity]>!
    var getCitiesInCircleRangeClosure: ((City.Coordination, Int) -> Observable<[CDCity]>)?
    func getCitiesInCircle(_ coordinate: City.Coordination, range: Int) -> Observable<[CDCity]> {
        getCitiesInCircleRangeCallsCount += 1
        getCitiesInCircleRangeReceivedArguments = (coordinate: coordinate, range: range)
        getCitiesInCircleRangeReceivedInvocations.append((coordinate: coordinate, range: range))
        return getCitiesInCircleRangeClosure.map({ $0(coordinate, range) }) ?? getCitiesInCircleRangeReturnValue
    }
}
class CoordinatorProtocolMock: CoordinatorProtocol {

    // MARK: - pushCityDetailsViewController
    var pushCityDetailsViewControllerViewModelCallsCount = 0
    var pushCityDetailsViewControllerViewModelCalled: Bool {
        return pushCityDetailsViewControllerViewModelCallsCount > 0
    }
    var pushCityDetailsViewControllerViewModelReceivedViewModel: CityViewModel?
    var pushCityDetailsViewControllerViewModelReceivedInvocations: [CityViewModel] = []
    var pushCityDetailsViewControllerViewModelClosure: ((CityViewModel) -> Void)?
    func pushCityDetailsViewController(viewModel: CityViewModel) {
        pushCityDetailsViewControllerViewModelCallsCount += 1
        pushCityDetailsViewControllerViewModelReceivedViewModel = viewModel
        pushCityDetailsViewControllerViewModelReceivedInvocations.append(viewModel)
        pushCityDetailsViewControllerViewModelClosure?(viewModel)
    }
}
