//
//  Constants.swift
//  iTunes Albums
//
//  Created by Sergei Romanchuk on 08.08.2021.
//

import Foundation

// MARK: - App Constants
enum K {
    
    // MARK: - Static Identifiers
    enum Identifier {
        
        // MARK: - Storyboard Identifiers
        enum Storyboard: String {
            case main = "Main"
            case launchScreen = "LaunchScreen"
        }
        
        // MARK: - Controller Identifiers
        enum Controller: String {
            case feed = "FeedViewController"
            case albumDetails = "AlbumDetailsViewController"
        }
        
        // MARK: - Reuse Element Identifiers
        enum ReuseElement: String {
            case collectionCell = "collectionCell"
        }
        
    }
    
    // MARK: - Feed Module
    enum Feed: String {
        case fetchAlbumsFromServerErrorMessage = "Fetch albums from server failed."
        case pushAlbumsToLocalDatabaseFailed = "Sorry, albums does not save in local database."
        case pushAlbumsToLocalDatabaseSuccess = "Albums saved in local database succesful."
    }
    
}
