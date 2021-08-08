//
//  FeedPresenter.swift
//  iTunes Albums
//
//  Created by Sergei Romanchuk on 08.08.2021.
//

import UIKit

// MARK: - Feed Presenter
class FeedsPresenter: ViewToPresenterFeedProtocol {
    var view: PresenterToViewFeedProtocol?
    var interactor: PresenterToInteractorFeedProtocol?
    var router: PresenterToRouterFeedProtocol?
    
    func fetchAlbumsFromServer() {
        interactor?.fetchAlbumsFromServer()
    }
    
    func pushAlbumsToLocalDatabase() {
        interactor?.pushAlbumsToLocalDatabase()
    }
    
    func showAlbumDetailsController(for selected: AlbumEntity, navigationConroller: UINavigationController) {
        router?.pushToAlbumDetailsScreen(for: selected, navigationConroller: navigationConroller)
    }
    
}

// MARK: - Extension Feed Presenter For InteractorToPresenterProtocol
extension FeedsPresenter: InteractorToPresenterFeedProtocol {
    func pushAlbumsRequestSuccess() {
        view?.onPushAlbumsResponseSuccess(message: K.Feed.pushAlbumsToLocalDatabaseSuccess.rawValue)
    }
    
    func pushAlbumssRequestFailed() {
        view?.onPushAlbumsResponseFailed(error: K.Feed.pushAlbumsToLocalDatabaseFailed.rawValue)
    }
    
    func fetchAlbumsRequestSuccess(for albums: [AlbumEntity]) {
        view?.onFetchAlbumsResponseSuccess(for: albums)
    }
    
    func fetchAlbumsRequestFailed() {
        view?.onFetchAlbumsResponseFailed(error: K.Feed.fetchAlbumsFromServerErrorMessage.rawValue)
    }
    
}
