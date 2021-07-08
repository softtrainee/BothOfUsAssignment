//
//  ViewController.swift
//  BothOfUsAssignment
//
//  Created by Mohit Gupta on 08/07/21.
//

import UIKit

let reuseIdentifier = "CellIdentifer";
class ViewController: UIViewController{
    
    
    @IBOutlet var collectionView: UICollectionView!
    fileprivate var items = ["Accommodation", "Childcare", "Schools"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
 
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as? CollectionViewCell
        cell?.name = items[indexPath.row]
        cell?.img = items[indexPath.row]
        return cell ?? CollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.frame.size.width/2) - 20, height: 200);
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let navigationObject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListViewControllerId") as? ListViewController {
            navigationObject.selectedCategory = indexPath.row
            navigationController?.pushViewController(navigationObject, animated: true)
        }
    }
}


