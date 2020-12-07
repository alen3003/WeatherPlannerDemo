public enum ApiError: Error {

    case general
    case noData
    case invalidContentType
    case encodingFailed
    case parseError
    case badRequest
    case notFound
    case unauthorized
    case serverError

}
