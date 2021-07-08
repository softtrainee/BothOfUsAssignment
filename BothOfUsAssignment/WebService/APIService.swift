//
//  APIService.swift
//  BothOfUsAssignment
//
//  Created by Mohit Gupta on 08/07/21.
//

import Foundation

class APIService :  NSObject {
     
    private let schoolsURL = URL(string: "https://www.goch.de/de/sys/schulen.json/")!
    private let childcareURL = URL(string: "https://www.goch.de/de/sys/kinderbetreuung.json/")!
    private let accommodationURL = URL(string: "https://www.goch.de/de/sys/unterkuenfte.json/")!
     
    func apiToGetAccommodationData(completion : @escaping (Accommodation) -> ()){

        URLSession.shared.dataTask(with: accommodationURL) { (data, urlResponse, error) in
            if let data = data {
                do {

                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)

                    let jsonDecoder = JSONDecoder()

                    let accomodationData = try jsonDecoder.decode(Accommodation.self, from: data)

                    completion(accomodationData)
                }
                catch {
                    print(error)
                }
            }

        }.resume()
    }
    
    
    func apiToGetChildcareData(completion : @escaping (Childcare) -> ()){

        URLSession.shared.dataTask(with: childcareURL) { (data, urlResponse, error) in
            if let data = data {
                do {

                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)

                    let jsonDecoder = JSONDecoder()

                    let childcareData = try jsonDecoder.decode(Childcare.self, from: data)

                    completion(childcareData)
                }
                catch {
                    print(error)
                }
            }

        }.resume()
    }
    
    
    func apiToGetSchoolData(completion : @escaping (Schools) -> ()){

        URLSession.shared.dataTask(with: childcareURL) { (data, urlResponse, error) in
            if let data = data {
                do {

                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)

                    let jsonDecoder = JSONDecoder()

                    let schoolData = try jsonDecoder.decode(Schools.self, from: data)

                    completion(schoolData)
                }
                catch {
                    print(error)
                }
            }

        }.resume()
    } 
}
