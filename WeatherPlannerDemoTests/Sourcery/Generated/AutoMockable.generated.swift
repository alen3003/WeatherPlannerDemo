// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable variable_name

import RxSwift
@testable import WeatherPlannerDemo
class CityListRepositoryProtocolMock: CityListRepositoryProtocol {

    // MARK: - fetchCities
    var fetchCitiesRangeCallsCount = 0
    var fetchCitiesRangeCalled: Bool {
        return fetchCitiesRangeCallsCount > 0
    }
    var fetchCitiesRangeReceivedArguments: (coordinate: City.Coordination, range: Int)?
    var fetchCitiesRangeReceivedInvocations: [(coordinate: City.Coordination, range: Int)] = []
    var fetchCitiesRangeReturnValue: Observable<[CDCity]>!
    var fetchCitiesRangeClosure: ((City.Coordination, Int) -> Observable<[CDCity]>)?
    func fetchCities(_ coordinate: City.Coordination, range: Int) -> Observable<[CDCity]> {
        fetchCitiesRangeCallsCount += 1
        fetchCitiesRangeReceivedArguments = (coordinate: coordinate, range: range)
        fetchCitiesRangeReceivedInvocations.append((coordinate: coordinate, range: range))
        return fetchCitiesRangeClosure.map({ $0(coordinate, range) }) ?? fetchCitiesRangeReturnValue
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
