//
//  FeedViewController.swift
//  Seminar03
//
//  Created by 이명진 on 10/27/25.
//

import UIKit
import SnapKit

public final class FeedViewController: UIViewController {
    
    // MARK: - Properties
    
    private let lineSpacing: CGFloat = 10
    private let itemSpacing: CGFloat = 21
    private let cellHeight: CGFloat = 198
    private let collectViewInset: UIEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 20)
    
    
    // MARK: - UI Components
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical // 디폴트가 버티컬
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = itemSpacing
        layout.sectionInset = collectViewInset
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    
    private var feeds: [FeedModel] = []
    
    // MARK: - Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        register()
        setDelegate()
        setLayout()
        loadMockData()
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        view.backgroundColor = .white
        title = "피드"
    }
    
    private func setLayout() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func register() {
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Data
    
    private func loadMockData() {
        feeds = FeedModel.mockData
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate

extension FeedViewController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(feeds[indexPath.item].name) 선택됨")
    }
}

// MARK: - UICollectionViewDataSource

extension FeedViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feeds.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath) as? FeedCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.delegate = self
        cell.configure(feed: feeds[indexPath.item])
        return cell
    }
}

    // MARK: - FeedCollectionViewCellDelegate

    extension FeedViewController: FeedCollectionViewCellDelegate {
            func didTapScrapButton(_ cell: FeedCollectionViewCell) {
            guard let indexPath = collectionView.indexPath(for: cell) else { return }
            
            feeds[indexPath.item].isScrap.toggle() // feed의 값을 변경
            cell.scrapButton.isSelected.toggle() // cell에 접근해서 해당 scrapbutton을 토글
        }
    }

// MARK: - UICollectionViewDelegateFlowLayout

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalInset: CGFloat = 20
        let width = (collectionView.frame.width - (itemSpacing + horizontalInset * 2)) / 2
        let height: CGFloat = cellHeight
        return CGSize(width: width, height: height)
    }
}


/// q. 1,2 중에 1은 viewDidLoad 절대 아니고 viewDidAppear? 에서 해야 한다는데 이유가 뭔지! 1101
/// 두 번 토글돼서 select가 안 될 수도 있음! 막 cell에도 있고 ~ 다른 곳에도 있고~
