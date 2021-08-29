// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable variable_name
// swiftlint:disable line_length

import RxSwift
@testable import WeatherPlannerDemo
class CityDetailsUseCaseProtocolMock: CityDetailsUseCaseProtocol {

    // MARK: - getPollutionInfo
    var getPollutionInfoLatitudeLongitudeCityIDCallsCount = 0
    var getPollutionInfoLatitudeLongitudeCityIDCalled: Bool {
        return getPollutionInfoLatitudeLongitudeCityIDCallsCount > 0
    }
    var getPollutionInfoLatitudeLongitudeCityIDReceivedArguments: (latitude: Double, longitude: Double, cityID: Int)?
    var getPollutionInfoLatitudeLongitudeCityIDReceivedInvocations: [(latitude: Double, longitude: Double, cityID: Int)] = []
    var getPollutionInfoLatitudeLongitudeCityIDReturnValue: Observable<AirPollution?>!
    var getPollutionInfoLatitudeLongitudeCityIDClosure: ((Double, Double, Int) -> Observable<AirPollution?>)?
    func getPollutionInfo(latitude: Double, longitude: Double, cityID: Int) -> Observable<AirPollution?> {
        getPollutionInfoLatitudeLongitudeCityIDCallsCount += 1
        getPollutionInfoLatitudeLongitudeCityIDReceivedArguments = (latitude: latitude, longitude: longitude, cityID: cityID)
        getPollutionInfoLatitudeLongitudeCityIDReceivedInvocations.append((latitude: latitude, longitude: longitude, cityID: cityID))
        return getPollutionInfoLatitudeLongitudeCityIDClosure.map({ $0(latitude, longitude, cityID) }) ?? getPollutionInfoLatitudeLongitudeCityIDReturnValue
    }
}
class CityListUseCaseProtocolMock: CityListUseCaseProtocol {

    // MARK: - getCitiesInCircle
    var getCitiesInCircleLatitudeLongitudeRangeCallsCount = 0
    var getCitiesInCircleLatitudeLongitudeRangeCalled: Bool {
        return getCitiesInCircleLatitudeLongitudeRangeCallsCount > 0
    }
    var getCitiesInCircleLatitudeLongitudeRangeReceivedArguments: (latitude: Double, longitude: Double, range: Int)?
    var getCitiesInCircleLatitudeLongitudeRangeReceivedInvocations: [(latitude: Double, longitude: Double, range: Int)] = []
    var getCitiesInCircleLatitudeLongitudeRangeReturnValue: Observable<[CityModel]>!
    var getCitiesInCircleLatitudeLongitudeRangeClosure: ((Double, Double, Int) -> Observable<[CityModel]>)?
    func getCitiesInCircle(latitude: Double, longitude: Double, range: Int) -> Observable<[CityModel]> {
        getCitiesInCircleLatitudeLongitudeRangeCallsCount += 1
        getCitiesInCircleLatitudeLongitudeRangeReceivedArguments = (latitude: latitude, longitude: longitude, range: range)
        getCitiesInCircleLatitudeLongitudeRangeReceivedInvocations.append((latitude: latitude, longitude: longitude, range: range))
        return getCitiesInCircleLatitudeLongitudeRangeClosure.map({ $0(latitude, longitude, range) }) ?? getCitiesInCircleLatitudeLongitudeRangeReturnValue
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
