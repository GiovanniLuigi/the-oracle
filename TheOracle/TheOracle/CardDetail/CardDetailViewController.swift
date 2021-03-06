//
//  CardDetailViewController.swift
//  TheOracle
//
//  Created by Giovanni Luidi Bruno on 06/02/21.
//  Copyright © 2021 Giovanni Luigi Bruno. All rights reserved.
//

import UIKit

class CardDetailViewController: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var cardDescriptionLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var shareableView: UIView!
    
    var viewModel: CardDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        let saveBarButton = UIBarButtonItem(title: viewModel.saveBarButtonTitle, style: UIBarButtonItem.Style.plain, target: self, action: #selector(save))
        let shareBarButton = UIBarButtonItem(title: viewModel.shareBarButtonTitle, style: UIBarButtonItem.Style.plain, target: self, action: #selector(share))
        
        navigationItem.rightBarButtonItems = [shareBarButton, saveBarButton]
        
        self.saveButton.setTitle(viewModel.saveButtonTitle, for: .normal)
        self.backButton.setTitle(viewModel.backButtonTitle, for: .normal)
        
        if viewModel.isFavorite {
            navigationItem.rightBarButtonItems = []
            saveButton.removeFromSuperview()
            backButton.removeFromSuperview()
        }
        
        loadCard()
    }
    
    func loadCard() {
        view.activityStartAnimating()
        viewModel.loadCard()
    }
    
    @IBAction func back(_ sender: Any) {
        viewModel.back()
    }
    
    @objc
    @IBAction func save(_ sender: Any) {
        viewModel.save()
        presentAlert(title: "Success", message: "Addded to your favorites", okAction: { [weak self] in
            self?.viewModel.dismiss()
        })
    }
    
    @objc
    func share() {
        let image = shareableView.asImage()
        
        let imageToShare = [image]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    private func reloadCardData(card: OracleCard) {
        cardDescriptionLabel.text = card.description
        title = card.title
        cardImageView.setImage(from: card.imageURL)
    }
    
    private func showError(error: Error) {
        presentAlert(title: "Error", message: error.localizedDescription, okAction:  { [weak self] in
            self?.viewModel.dismiss()
            self?.viewModel.stop()
        })
    }
}

extension CardDetailViewController: CardDetailViewDelegate {
    func viewModelDidFetchCardWithSuccess(card: OracleCard) {
        reloadCardData(card: card)
        view.activityStopAnimating()
    }
    
    func viewModelDidFetchCardWithError(error: Error) {
        showError(error: error)
        view.activityStopAnimating()
    }
}
