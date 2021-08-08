//
//  AlbumDetailsProtocols.swift
//  iTunes Albums
//
//  Created by Sergei Romanchuk on 08.08.2021.
//

import UIKit

// MARK: - View To Presenter Protocol
protocol ViewToPresenterAlbumDetailsProtocol {
    var view: PresenterToViewAlbumDetailsProtocol? { get set }
    var interactor: PresenterToInteractorAlbumDetailsProtocol? { get set }
    var router: PresenterToRouterAlbumDetailsProtocol? { get set }
    func fetchAlbumsFromServer()
    func showAlbumDetailsController(for selected: AlbumEntity, navigationConroller: UINavigationController)
}

// MARK: - Presenter To View Protocol
protocol PresenterToViewAlbumDetailsProtocol {
    func onPushAlbumsResponseSuccess(message: String)
    func onPushAlbumsResponseFailed(error: String)
    func onFetchAlbumsResponseSuccess(for albums: [AlbumEntity])
    func onFetchAlbumsResponseFailed(error: String)
}

// MARK: - Presenter To Router Protocol
protocol PresenterToRouterAlbumDetailsProtocol {
    static func createModule(for selectedItem: AlbumEntity) -> AlbumDetailsViewController
    static var mainstoryboard: UIStoryboard { get }
    func pushToAlbumDetailsScreen(for selected: AlbumEntity, navigationConroller: UINavigationController)
}

// MARK: - Presenter To Interactor Protocol
protocol PresenterToInteractorAlbumDetailsProtocol {
    var presenter: InteractorToPresenterAlbumDetailsProtocol? { get set }
    func fetchAlbumsFromServer()
    func pushAlbumsToLocalDatabase()
}

// MARK: - Interactor To Presenter Protocol
protocol InteractorToPresenterAlbumDetailsProtocol {
    func pushAlbumsRequestSuccess()
    func pushAlbumssRequestFailed()
    func fetchAlbumsRequestSuccess(for albums: [AlbumEntity])
    func fetchAlbumsRequestFailed()
}
