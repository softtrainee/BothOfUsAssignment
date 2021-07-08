//
//  ListViewController.swift
//  BothOfUsAssignment
//
//  Created by Mohit Gupta on 08/07/21.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    var loader =  UIAlertController()
    var selectedCategory: Int?
    private var viewModel : ViewModel!
    private var accommodationdataSource : TableViewDataSource<TableViewCell,Unterkuenfte>!
    private var childcaredataSource : TableViewDataSource<TableViewCell,Kinderbetreuungsangebote>!
    private var schoolsdataSource : TableViewDataSource<TableViewCell,Schulen>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleSetUp()
        NetworkManager.isReachable { _ in
            self.callToViewModelForUIUpdate()
        }
        NetworkManager.isUnreachable { _ in
            self.alert(title: "Information", msg: "No Internet Connection")
        }
    }
        
    func alert(title: String, msg: String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func titleSetUp(){
        switch self.selectedCategory {
        case 0: self.title = "Accommodation"
            break
        case 1: self.title = "Childcare"
            break
        default: self.title = "Schools"
            break
        }
    }
    
    func callToViewModelForUIUpdate(){
        
        self.viewModel = ViewModel()
        self.viewModel.selectedCategory = self.selectedCategory
        self.viewModel.callAPIMethod()
        switch self.selectedCategory {
        case 0: self.loader = self.loader()
            self.viewModel.bindAccommodationViewModelToController = {
                self.updateDataSource()
            }
            break
        case 1: self.loader = self.loader()
            self.viewModel.bindChildcareViewModelToController = {
                self.updateDataSource()
            }
            break
        default: 
            self.viewModel.bindSchoolViewModelToController = {
                self.updateDataSource()
            }
            break
        }
        
        
        
    }
    
    func updateDataSource(){
        
        switch selectedCategory {
        case 0:
            self.accommodationdataSource = TableViewDataSource(cellIdentifier: "TableViewCell", items: self.viewModel.AccommodationData.unterkuenfte, configureCell: { (cell, obj) in
                cell.IdLabel.text = "ID: \(obj.allgemein?[0].id ?? "")"
                cell.NameLabel.text = "Name: \(obj.allgemein?[0].titel ?? "")"
            })
            
            DispatchQueue.main.async {
                self.stopLoader(loader: self.loader)
                self.TableView.dataSource = self.accommodationdataSource
                self.TableView.delegate = self
                self.TableView.reloadData()
            }
            break
        case 1:
            self.childcaredataSource = TableViewDataSource(cellIdentifier: "TableViewCell", items: self.viewModel.ChildcareData.kinderbetreuungsangebote, configureCell: { (cell, obj) in
                cell.IdLabel.text = "ID: \(obj.allgemein?[0].id ?? "")"
                cell.NameLabel.text = "Name: \(obj.allgemein?[0].titel ?? "")"
            })
            
            DispatchQueue.main.async {
                self.stopLoader(loader: self.loader)
                self.TableView.dataSource = self.childcaredataSource
                self.TableView.delegate = self
                self.TableView.reloadData()
            }
            break
        default:
            self.schoolsdataSource = TableViewDataSource(cellIdentifier: "TableViewCell", items: self.viewModel.SchoolData.schulen, configureCell: { (cell, obj) in
                cell.IdLabel.text = "ID: \(obj.allgemein?[0].id ?? "")"
                cell.NameLabel.text = "Name: \(obj.allgemein?[0].titel ?? "")"
            })
            
            DispatchQueue.main.async {
                self.stopLoader(loader: self.loader)
                self.TableView.dataSource = self.schoolsdataSource
                self.TableView.delegate = self
                self.TableView.reloadData()
            }
            break
        }
        
        
        
    }
    
}

extension ListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let navigationObject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewControllerId") as? DetailViewController {
            navigationObject.selectedcategory = selectedCategory
            
            switch self.selectedCategory {
            case 0: navigationObject.accommodationselectedObj = viewModel.accommodationdidSelect(indexPath: indexPath.row)
                break
            case 1: navigationObject.childcareselectedObj = viewModel.childcaredidSelect(indexPath: indexPath.row)
                break
            default: navigationObject.schoolselectedObj = viewModel.schooldidSelect(indexPath: indexPath.row)
                break
            }
            
            
            navigationController?.pushViewController(navigationObject, animated: true)
        }
    }
}
