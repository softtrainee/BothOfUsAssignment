//
//  Schools.swift
//  BothOfUsAssignment
//
//  Created by Mohit Gupta on 08/07/21.
//
 

import Foundation

// MARK: - Schools
struct Schools: Codable {
    let schulen: [Schulen]
    let bezeichnungDESBereitstellers, lizenz: String
    let quellURL: String

    enum CodingKeys: String, CodingKey {
        case schulen = "Schulen"
        case bezeichnungDESBereitstellers = "Bezeichnung des Bereitstellers"
        case lizenz = "Lizenz"
        case quellURL = "Quell-URL"
    }
}

// MARK: - Schulen
struct Schulen: Codable {
    let allgemein: [SchoolAllgemein]?
    let kategorien: [SchoolKategorien]?
    let standort: [SchoolStandort]?

    enum CodingKeys: String, CodingKey {
        case allgemein = "Allgemein"
        case kategorien = "Kategorien"
        case standort = "Standort"
    }
}

// MARK: - Allgemein
struct SchoolAllgemein: Codable {
    let id, titel, teaserRaw, beschreibung: String
    let urlReferenz: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case titel = "Titel"
        case teaserRaw = "Teaser-Raw"
        case beschreibung = "Beschreibung"
        case urlReferenz = "URL-Referenz"
    }
}

// MARK: - Kategorien
struct SchoolKategorien: Codable {
    let schultyp: String
    let ortsteil: Ort

    enum CodingKeys: String, CodingKey {
        case schultyp = "Schultyp"
        case ortsteil = "Ortsteil"
    }
}

enum SchoolOrt: String, Codable {
    case goch = "Goch"
    case kessel = "Kessel"
    case pfalzdorf = "Pfalzdorf"
}

// MARK: - Standort
struct SchoolStandort: Codable {
    let ansprechpartner, strasse, plz: String
    let ort: SchoolOrt
    let eMail, telefon, fax: String
    let homepage: String

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

