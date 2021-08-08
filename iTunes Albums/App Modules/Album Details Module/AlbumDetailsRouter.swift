//
//  AlbumDetailsRouter.swift
//  iTunes Albums
//
//  Created by Sergei Romanchuk on 08.08.2021.
//

import UIKit

// MARK: - Feed Router
class AlbumDetailsRouter: PresenterToRouterAlbumDetailsProtocol {
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: K.Identifier.Storyboard.main.rawValue, bundle: Bundle.main)
    }
    
    static func createModule(for selectedItem: AlbumEntity) -> AlbumDetailsViewController {
        // VIPER Architecture Elements Creation
        let view = AlbumDetailsRouter.mainstoryboard.instantiateViewController(identifier: K.Identifier.Controller.albumDetails.rawValue) as! AlbumDetailsViewController
        var presenter: ViewToPresenterFeedProtocol & InteractorToPresenterFeedProtocol = FeedsPresenter()
        var interactor: PresenterToInteractorFeedProtocol = FeedInteractor()
        let router: PresenterToRouterFeedProtocol = FeedsRouter()
        
        // Module Initialization
        //view.selectedItem = selectedItem
        //view.tableBoardsPresenter = presenter
        //presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToAlbumDetailsScreen(for selected: AlbumEntity, navigationConroller: UINavigationController) {

    }
    
}
