import Foundation

protocol CityDependenciesProtocol {
    func buildCityListUseCase() -> CityListUseCase
    func buildCityDetilsUseCase() -> CityDetailsUseCase
}
