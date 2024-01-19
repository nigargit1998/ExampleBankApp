//
//  Card(v).swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 18.01.24.
//

import Foundation
import UIKit

class CardView: UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView?
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    var viewModel = CardViewModel()
    fileprivate var currentPage: Int = 0
    
    fileprivate var pageSize: CGSize {
        let layout = self.collectionView?.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
    
    fileprivate var orientation: UIDeviceOrientation {
        return UIDevice.current.orientation
    }
    
    private func setupCollectionView() {
        let floawLayout = UPCarouselFlowLayout()
        floawLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 60.0,
                                      height: collectionView?.frame.size.height ?? 0)
        floawLayout.scrollDirection = .horizontal
        floawLayout.sideItemScale = 0.8
        floawLayout.sideItemAlpha = 1.0
        floawLayout.spacingMode = .fixed(spacing: 5.0)
        collectionView?.collectionViewLayout = floawLayout
        collectionView?.register(ILLCC.nib, forCellWithReuseIdentifier: ILLCC.identifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Local.cards.rawValue
        label1.text = Local.transfer.rawValue
        label2.text = Local.delete.rawValue
        render(state: .loaded)
    }
    
    
    func render(state: CardsViewModelState){
        switch state {
        case .loaded:
            ProgressHUD.start()
            viewModel.request {
                ProgressHUD.stop()
                self.setupCollectionView()
                self.collectionView?.reloadData()
            }
        case .reload:
            ProgressHUD.stop()
            self.collectionView?.reloadData()
        case .loading:
            ProgressHUD.start()
        case _:
            break
        }
    }
    
    
    @IBAction func openTransfer(_ sender: Any) {
        if let transferViewController = self.storyboard?.instantiateViewController(withIdentifier: "TransferView") as? TransferView {
            transferViewController.viewModel.data.senderCardNumber = viewModel.data.cards[currentPage].cardNumber
            self.navigationController?.pushViewController(transferViewController, animated: true)
        }
    }
    
    @IBAction func deleteCard(_ sender: Any) {
        let alertController = UIAlertController(title: Local.delete.rawValue,
                                                message: Local.alertMessage.rawValue + "\(self.viewModel.data.cards[currentPage].cardNumber)",
                                                preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: Local.cancel.rawValue, style: .cancel, handler: nil)
        let confirmAction = UIAlertAction(title: Local.confirm.rawValue, style: .default) { _ in
            self.render(state: .loading)
            self.viewModel.requestDelete(cardNumber: self.viewModel.data.cards[self.currentPage].cardNumber) {
                self.render(state: .reload)
            }
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
}

extension  CardView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.data.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ILLCC", for: indexPath) as! ILLCC
        return cell.configure(viewModel.data.cards[indexPath.row])
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.collectionView?.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    }
    
}
