//
//  Childcare.swift
//  BothOfUsAssignment
//
//  Created by Mohit Gupta on 08/07/21.
//

 
import Foundation

// MARK: - Childcare
struct Childcare: Codable {
    let kinderbetreuungsangebote: [Kinderbetreuungsangebote]
    let bezeichnungDESBereitstellers, lizenz: String
    let quellURL: String

    enum CodingKeys: String, CodingKey {
        case kinderbetreuungsangebote = "Kinderbetreuungsangebote"
        case bezeichnungDESBereitstellers = "Bezeichnung des Bereitstellers"
        case lizenz = "Lizenz"
        case quellURL = "Quell-URL"
    }
}

// MARK: - Kinderbetreuungsangebote
struct Kinderbetreuungsangebote: Codable {
    let allgemein: [ChildcareAllgemein]?
    let kategorien: [ChildcareKategorien]?
    let standort: [ChildcareStandort]?

    enum CodingKeys: String, CodingKey {
        case allgemein = "Allgemein"
        case kategorien = "Kategorien"
        case standort = "Standort"
    }
}

// MARK: - Allgemein
struct ChildcareAllgemein: Codable {
    let id, titel, beschreibung: String
    let urlReferenz: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case titel = "Titel"
        case beschreibung = "Beschreibung"
        case urlReferenz = "URL-Referenz"
    }
}

// MARK: - Kategorien
struct ChildcareKategorien: Codable {
    let art: ChildcareArt
    let ortsteil: String

    enum CodingKeys: String, CodingKey {
        case art = "Art"
        case ortsteil = "Ortsteil"
    }
}

enum ChildcareArt: String, Codable {
    case kindergärten = "Kindergärten"
    case spielgruppen = "Spielgruppen"
}

// MARK: - Standort
struct ChildcareStandort: Codable {
    let ansprechpartner, strasse, plz: String
    let ort: ChildcareOrt
    let eMail, telefon, fax, homepage: String

    enum CodingKeys: String, CodingKey {
        case ansprechpartner = "Ansprechpartner"
        case strasse = "Strasse"
        case plz = "PLZ"
        case ort = "Ort"
        case eMail = "E-Mail"
        case telefon = "Telefon"
        case fax = "Fax"
        case homepage = "Homepage"
    }
}

enum ChildcareOrt: String, Codable {
    case goch = "Goch"
}

