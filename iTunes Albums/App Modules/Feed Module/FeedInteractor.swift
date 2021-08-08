//
//  FeedInteractor.swift
//  iTunes Albums
//
//  Created by Sergei Romanchuk on 08.08.2021.
//

import Foundation

// MARK: - Feed Interactor
class FeedInteractor: PresenterToInteractorFeedProtocol {
    var presenter: InteractorToPresenterFeedProtocol?
    
    func fetchAlbumsFromServer() {
        // Action
    }
    
    func pushAlbumsToLocalDatabase() {
        // Action
    }

}

//    func pushBoardsToLocalDatabase(context: NSManagedObjectContext) {
//        do {
//            try context.save()
//            self.presenter?.pushTableBoardsRequestSuccess()
//        } catch {
//            self.presenter?.pushTableBoardsRequestFailed()
//        }
//    }
//
//    func fetchBoardsFromLocalDatabase(context: NSManagedObjectContext) {
//        let request: NSFetchRequest<BoardEntity> = BoardEntity.fetchRequest()
//
//        do {
//            let boards = try context.fetch(request)
//            self.presenter?.fetchTableBoardsRequestSuccess(for: boards)
//        } catch {
//            self.presenter?.fetchTableBoardsRequestFailed()
//        }
//    }
