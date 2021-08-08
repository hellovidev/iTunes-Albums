//
//  ViewController.swift
//  iTunes Albums
//
//  Created by Sergei Romanchuk on 08.08.2021.
//

import UIKit

class FeedViewController: UICollectionViewController {
    var feedPresenter: ViewToPresenterFeedProtocol?
    var albums = [AlbumEntity]()
    lazy var searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Setup Navigation Bar
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "iTunes albums"
        
        // Setup Search Bar
        self.navigationItem.titleView = searchBar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

// MARK: - Extension Feed View Controller For PresenterToViewProtocol
extension FeedViewController: PresenterToViewFeedProtocol {
    func onPushAlbumsResponseSuccess(message: String) {
        print("Success: \(message)")
        //self.tableView.reloadData()
    }
    
    func onPushAlbumsResponseFailed(error: String) {
        print("Error: \(error)")
    }
    
    func onFetchAlbumsResponseSuccess(for albums: [AlbumEntity]) {
        self.albums = albums
        //self.tableView.reloadData()
    }
    
    func onFetchAlbumsResponseFailed(error: String) {
        print("Error: \(error)")
    }
    
}

// MARK: - UICollectionViewDataSource
extension FeedViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3//albums.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9//searches[section].searchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Configure the cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Identifier.ReuseElement.collectionCell.rawValue, for: indexPath)
        cell.backgroundColor = .black
        
        return cell
    }
    
}

private let itemsPerRow: CGFloat = 3
private let sectionInsets = UIEdgeInsets(
  top: 50.0,
  left: 20.0,
  bottom: 50.0,
  right: 20.0)

// MARK: - UICollectionViewDelegateFlowLayout
extension FeedViewController: UICollectionViewDelegateFlowLayout {
  // 1
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    // 2
    let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
    let availableWidth = view.frame.width - paddingSpace
    let widthPerItem = availableWidth / itemsPerRow
    
    return CGSize(width: widthPerItem, height: widthPerItem)
  }
  
  // 3
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAt section: Int
  ) -> UIEdgeInsets {
    return sectionInsets
  }
  
  // 4
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    return sectionInsets.left
  }
}
