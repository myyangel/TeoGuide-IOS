//
//  Source.swift
//  TeoGuide
//
//  Created by Developer on 11/6/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation
import SwiftUI

struct Card : Identifiable {
    var id = UUID()
    
    var subtitle = "Buscando"
    var title = "Centro"
    var backgroundImage =  "Huaca_Pucllana_Miraflores"
    var briefSummary = "Encuentrame"
    var description = desPlaceholer
}

let desPlaceholer = "Hola soy un centro historico"

let cardData: [Card] = [
    .init(),
    .init(),
    .init(),
    .init()
]
