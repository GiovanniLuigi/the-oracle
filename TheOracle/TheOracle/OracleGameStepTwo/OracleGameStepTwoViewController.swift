//
//  OracleGameStepTwoViewController.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 02/02/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

class OracleGameStepTwoViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: OracleGameStepTwoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        let newBackButton = UIBarButtonItem(title: viewModel.backButtonTitle, style: UIBarButtonItem.Style.plain, target: self, action: #selector(didTapLeaveGame))
        navigationItem.leftBarButtonItem = newBackButton
        
        collectionView.register(OracleGameStepTwoCollectionViewCell.nib, forCellWithReuseIdentifier: OracleGameStepTwoCollectionViewCell.reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @objc func didTapLeaveGame() {
        presentAlert(title: viewModel.alertTitle, message: viewModel.alertMessage, okAction: { [weak self] in
            self?.viewModel.shouldBack()
        })
    }
    
}


extension OracleGameStepTwoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OracleGameStepTwoCollectionViewCell.reuseIdentifier, for: indexPath) as? OracleGameStepTwoCollectionViewCell {
            let cellViewModel = viewModel.cellViewModel(at: indexPath.row)
            cell.update(with: cellViewModel)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
}

extension OracleGameStepTwoViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.9, height: collectionView.frame.height * 0.8)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
                            collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    
}

extension OracleGameStepTwoViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectCard(at: indexPath.row)
    }
}
