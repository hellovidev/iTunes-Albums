//
//  FeedProtocols.swift
//  iTunes Albums
//
//  Created by Sergei Romanchuk on 08.08.2021.
//

import UIKit

// MARK: - Entity Protocol
protocol AlbumEntityProtocol: Identifiable, Codable {
    var id: String? { get }
    var title: String? { get set }
    var imageUrl: String? { get set }
}

// MARK: - View To Presenter Protocol
protocol ViewToPresenterFeedProtocol {
    var view: PresenterToViewFeedProtocol? { get set }
    var interactor: PresenterToInteractorFeedProtocol? { get set }
    var router: PresenterToRouterFeedProtocol? { get set }
    func fetchAlbumsFromServer()
    func pushAlbumsToLocalDatabase()
    func showAlbumDetailsController(for selected: AlbumEntity, navigationConroller: UINavigationController)
}

// MARK: - Presenter To View Protocol
protocol PresenterToViewFeedProtocol {
    func onPushAlbumsResponseSuccess(message: String)
    func onPushAlbumsResponseFailed(error: String)
    func onFetchAlbumsResponseSuccess(for albums: [AlbumEntity])
    func onFetchAlbumsResponseFailed(error: String)
}

// MARK: - Presenter To Router Protocol
protocol PresenterToRouterFeedProtocol {
    static func createModule() -> FeedViewController
    static var mainstoryboard: UIStoryboard { get }
    func pushToAlbumDetailsScreen(for selected: AlbumEntity, navigationConroller: UINavigationController)
}

// MARK: - Presenter To Interactor Protocol
protocol PresenterToInteractorFeedProtocol {
    var presenter: InteractorToPresenterFeedProtocol? { get set }
    func fetchAlbumsFromServer()
    func pushAlbumsToLocalDatabase()
}

// MARK: - Interactor To Presenter Protocol
protocol InteractorToPresenterFeedProtocol {
    func pushAlbumsRequestSuccess()
    func pushAlbumssRequestFailed()
    func fetchAlbumsRequestSuccess(for albums: [AlbumEntity])
    func fetchAlbumsRequestFailed()
}
