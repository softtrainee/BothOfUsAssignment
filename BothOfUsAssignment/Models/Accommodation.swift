//
//  Accommodation.swift
//  BothOfUsAssignment
//
//  Created by Mohit Gupta on 08/07/21.
//
 
import Foundation

// MARK: - Accommodation
struct Accommodation: Codable {
    let unterkuenfte: [Unterkuenfte]
    let bezeichnungDESBereitstellers, lizenz: String
    let quellURL: String

    enum CodingKeys: String, CodingKey {
        case unterkuenfte = "Unterkuenfte"
        case bezeichnungDESBereitstellers = "Bezeichnung des Bereitstellers"
        case lizenz = "Lizenz"
        case quellURL = "Quell-URL"
    }
}

// MARK: - Unterkuenfte
struct Unterkuenfte: Codable {
    let allgemein: [Allgemein]?
    let kategorien: [Kategorien]?
    let weitereInformationen: [WeitereInformationen]?
    let informationenZuHotelsUndPensionen: [InformationenZuHotelsUndPensionen]?
    let informationenZuApartmentsUndFerienwohnungen: [InformationenZuApartmentsUndFerienwohnungen]?
    let standort: [Standort]?

    enum CodingKeys: String, CodingKey {
        case allgemein = "Allgemein"
        case kategorien = "Kategorien"
        case weitereInformationen = "Weitere Informationen"
        case informationenZuHotelsUndPensionen = "Informationen zu Hotels und Pensionen"
        case informationenZuApartmentsUndFerienwohnungen = "Informationen zu Apartments und Ferienwohnungen"
        case standort = "Standort"
    }
}

// MARK: - Allgemein
struct Allgemein: Codable {
    let id, titel, beschreibung: String
    let urlReferenz: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case titel = "Titel"
        case beschreibung = "Beschreibung"
        case urlReferenz = "URL-Referenz"
    }
}

// MARK: - InformationenZuApartmentsUndFerienwohnungen
struct InformationenZuApartmentsUndFerienwohnungen: Codable {
    let verpflegungsart, maximaleBelegung, wohnfläche, doppelbetten: String
    let einzelbetten, etagenbetten, zusatzbetten, übernachtungskosten1Person: String
    let übernachtungskosten2Person, übernachtungskosten3Person, übernachtungskosten4Person, übernachtungskosten5Person: String
    let übernachtungskosten6Person: String
    let zuschlägeFrühstückProPerson: ZuschlägeFrühstückProPerson
    let zuschlägeHPProPerson, zuschlägeVPProPerson, aufteilung, nebenkosten: String

    enum CodingKeys: String, CodingKey {
        case verpflegungsart = "Verpflegungsart"
        case maximaleBelegung = "Maximale Belegung"
        case wohnfläche = "Wohnfläche"
        case doppelbetten = "Doppelbetten"
        case einzelbetten = "Einzelbetten"
        case etagenbetten = "Etagenbetten"
        case zusatzbetten = "Zusatzbetten"
        case übernachtungskosten1Person = "Übernachtungskosten 1 Person"
        case übernachtungskosten2Person = "Übernachtungskosten 2 Person"
        case übernachtungskosten3Person = "Übernachtungskosten 3 Person"
        case übernachtungskosten4Person = "Übernachtungskosten 4 Person"
        case übernachtungskosten5Person = "Übernachtungskosten 5 Person"
        case übernachtungskosten6Person = "Übernachtungskosten 6 Person"
        case zuschlägeFrühstückProPerson = "Zuschläge Frühstück pro Person"
        case zuschlägeHPProPerson = "Zuschläge HP pro Person"
        case zuschlägeVPProPerson = "Zuschläge VP pro Person"
        case aufteilung = "Aufteilung"
        case nebenkosten = "Nebenkosten"
    }
}

enum ZuschlägeFrühstückProPerson: String, Codable {
    case empty = ""
    case the800Euro = "8,00 Euro"
}

// MARK: - InformationenZuHotelsUndPensionen
struct InformationenZuHotelsUndPensionen: Codable {
    let betten, einzelzimmer, doppelzimmer, the3BZimmer: String
    let the4BZimmer, suiten, apartments, preisEinzelzimmer: String
    let preisDoppelzimmer: String
    let preis3BZimmer: Preis3BZimmer
    let preis4BZimmer: Preis4BZimmer
    let zuschlägeHPProPerson: ZuschlägeHPProPerson
    let zuschlägeVPProPerson: ZuschlägeVPProPerson

    enum CodingKeys: String, CodingKey {
        case betten = "Betten"
        case einzelzimmer = "Einzelzimmer"
        case doppelzimmer = "Doppelzimmer"
        case the3BZimmer = "3B-Zimmer"
        case the4BZimmer = "4B-Zimmer"
        case suiten = "Suiten"
        case apartments = "Apartments"
        case preisEinzelzimmer = "Preis Einzelzimmer"
        case preisDoppelzimmer = "Preis Doppelzimmer"
        case preis3BZimmer = "Preis 3B-Zimmer"
        case preis4BZimmer = "Preis 4B-Zimmer"
        case zuschlägeHPProPerson = "Zuschläge HP pro Person"
        case zuschlägeVPProPerson = "Zuschläge VP pro Person"
    }
}

enum Preis3BZimmer: String, Codable {
    case empty = ""
    case the12000Euro14000EuroInklFrühstück = "120,00 Euro - 140,00 Euro inkl. Frühstück"
    case the13500Euro = "135,00 Euro"
    case the2000EuroPP = "20,00 Euro p. P."
    case the980011000EuroÜF = "98,00 - 110,00 Euro Ü/F"
}

enum Preis4BZimmer: String, Codable {
    case aufAnfrage = "auf Anfrage"
    case empty = ""
    case the13000Euro = "130,00 Euro"
    case the14000Euro16000EuroInklFrühstück = "140,00 Euro - 160,00 Euro inkl. Frühstück"
}

enum ZuschlägeHPProPerson: String, Codable {
    case empty = ""
    case the1500Euro = "15,00 Euro"
    case the1750Euro = "17,50 Euro"
    case the1990Euro = "19,90 Euro"
}

enum ZuschlägeVPProPerson: String, Codable {
    case empty = ""
    case the2650Euro = "26,50 Euro"
    case the3890Euro = "38,90 Euro"
}

// MARK: - Kategorien
struct Kategorien: Codable {
    let art: Art
    let ortsteil: String

    enum CodingKeys: String, CodingKey {
        case art = "Art"
        case ortsteil = "Ortsteil"
    }
}

enum Art: String, Codable {
    case ferienhaus = "Ferienhaus"
    case ferienwohnung = "Ferienwohnung"
    case hotel = "Hotel"
    case pension = "Pension"
}

// MARK: - Standort
struct Standort: Codable {
    let ansprechpartner, strasse, plz: String
    let ort: Ort
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

enum Ort: String, Codable {
    case goch = "Goch"
    case ortGoch = " Goch"
}

// MARK: - WeitereInformationen
struct WeitereInformationen: Codable {
    let lagebeschreibung: Lagebeschreibung
    let entfernungAirport, entfernungBahnhof: String
    let entfernungOEPNV: EntfernungOEPNV
    let entfernungZentrum, ausstattung, ausstattungsdetails: String

    enum CodingKeys: String, CodingKey {
        case lagebeschreibung = "Lagebeschreibung"
        case entfernungAirport = "Entfernung Airport"
        case entfernungBahnhof = "Entfernung Bahnhof"
        case entfernungOEPNV = "Entfernung OEPNV"
        case entfernungZentrum = "Entfernung Zentrum"
        case ausstattung = "Ausstattung"
        case ausstattungsdetails = "Ausstattungsdetails"
    }
}

enum EntfernungOEPNV: String, Codable {
    case empty = ""
    case the01KM = "0,1 km"
    case the02KM = "0,2 km"
    case the03 = "0.3"
    case the15KM = "1,5 km"
    case the300M = "300 m"
}

enum Lagebeschreibung: String, Codable {
    case empty = ""
    case ortsrand = "Ortsrand"
    case ortszentrum = "Ortszentrum"
    case ruhigGemTIN = "Ruhig (gem. TIN)"
}

