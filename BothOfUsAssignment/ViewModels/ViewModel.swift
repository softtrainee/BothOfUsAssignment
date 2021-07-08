//
//  EmployeesViewModel.swift
//  BothOfUsAssignment
//
//  Created by Mohit Gupta on 08/07/21.
//

import Foundation

class ViewModel : NSObject {
    
    private var apiService : APIService!
    var selectedCategory: Int?
    private(set) var AccommodationData : Accommodation! {
        didSet {
            self.bindAccommodationViewModelToController()
        }
    }
    private(set) var ChildcareData : Childcare! {
        didSet {
            self.bindChildcareViewModelToController()
        }
    }
    private(set) var SchoolData : Schools! {
        didSet {
            self.bindSchoolViewModelToController()
        }
    }
      
    var bindAccommodationViewModelToController : (() -> ()) = {}
    var bindChildcareViewModelToController : (() -> ()) = {}
    var bindSchoolViewModelToController : (() -> ()) = {}
 
    override init() {
        super.init()
        self.apiService =  APIService()
        self.selectedCategory = 0
        
    }
    
    
    func callAPIMethod(){
        switch selectedCategory {
        case 0: callFuncToGetAccommodationData()
            break
        case 1: callFuncToGetChildcareData()
            break
        default: callFuncToGetSchoolData()
            break
        }
    }
    
    func callFuncToGetAccommodationData() {
        self.apiService.apiToGetAccommodationData { (accommodationData) in
            self.AccommodationData = accommodationData
        }
    }
    func callFuncToGetChildcareData() {
        self.apiService.apiToGetChildcareData { (childcareData) in
            self.ChildcareData = childcareData
        }
    }
    func callFuncToGetSchoolData() {
        self.apiService.apiToGetSchoolData { (schoolData) in
            self.SchoolData = schoolData
        }
    }
      
    func accommodationdidSelect(indexPath: Int) -> Allgemein {
        return (self.AccommodationData.unterkuenfte[indexPath].allgemein?[0])!
    }
    
    
    func childcaredidSelect(indexPath: Int) -> ChildcareAllgemein {
        return (self.ChildcareData.kinderbetreuungsangebote[indexPath].allgemein?[0])!
    }
    
    func schooldidSelect(indexPath: Int) -> SchoolAllgemein {
        return (self.SchoolData.schulen[indexPath].allgemein?[0])!
    }
}
