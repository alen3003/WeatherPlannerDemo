import Foundation

protocol CityDependenciesProtocol {
    func buildCityListUseCase() -> CityListUseCaseProtocol
    func buildCityDetilsUseCase() -> CityDetailsUseCaseProtocol
}
