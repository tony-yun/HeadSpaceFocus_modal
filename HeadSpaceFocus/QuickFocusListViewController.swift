//
//  QuickFocusListViewController.swift
//  HeadSpaceFocus
//
//  Created by 윤태웅 on 10/14/23.
//

import UIKit

class QuickFocusListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let breathingList = QuickFocus.breathing
    let walkingList = QuickFocus.walking
    
    // CaseIterable로 하면, Section.allCases로 전부 가져올 수 있다.
    // let allItems: [Section] = [.breathe, .walking]
    enum Section: CaseIterable {
        case breathe
        case walking
        
        var title: String {
            switch self {
            case .breathe: return "Breathing exercises"
            case .walking: return "Mindful walks"
            }
        }
    }
    typealias Item = QuickFocus
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // presentation
        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuickFocusCell", for: indexPath) as? QuickFocusCell else {
                return nil
            }
            cell.configure(itemIdentifier)
            return cell
        })
        
        // data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.breathe, .walking]) // Section.allCases
        snapshot.appendItems(breathingList, toSection: .breathe)
        snapshot.appendItems(walkingList, toSection: .walking)
        datasource.apply(snapshot)
        
        // layout
        collectionView.collectionViewLayout = layout()
    }
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)) //글자수에 따라서 변경
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
