//
//  FeedRouter.swift
//  iTunes Albums
//
//  Created by Sergei Romanchuk on 08.08.2021.
//

import UIKit

// MARK: - Feed Router
class FeedsRouter: PresenterToRouterFeedProtocol {
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: K.Identifier.Storyboard.main.rawValue, bundle: Bundle.main)
    }
    
    static func createModule() -> FeedViewController {
        
        // VIPER Architecture Elements Creation
        let view = FeedsRouter.mainstoryboard.instantiateViewController(identifier: K.Identifier.Controller.feed.rawValue) as! FeedViewController
        var presenter: ViewToPresenterFeedProtocol & InteractorToPresenterFeedProtocol = FeedsPresenter()
        var interactor: PresenterToInteractorFeedProtocol = FeedInteractor()
        let router: PresenterToRouterFeedProtocol = FeedsRouter()
        
        // Module Initialization
        view.feedPresenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToAlbumDetailsScreen(for selected: AlbumEntity, navigationConroller: UINavigationController) {
        let albumDetailsModule = AlbumDetailsRouter.createModule(for: selected)
        navigationConroller.pushViewController(albumDetailsModule, animated: true)
    }
    
}
