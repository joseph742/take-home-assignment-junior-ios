//
//  Product+Extension.swift
//  EasyShopperTests
//
//  Created by Joseph Umoru on 15/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation
@testable import EasyShopper

/*
 Description: Conforms to the Stubbable protocol and adding functionality, so that all conforming types have access to the method
*/

extension Product: Stubbable {
    static func stub() -> Product {
        let product = Product(barcode: "64352", description: "Hvid t-shirt med røde, grønne og navy detaljer,\nBroderet logo\nRibkant i halsudskæringen\n100% bomuld, 150 gr. m2\nProduceret i Tyrkiet\n\nDenne H2O t-shirt er fremstillet i en blød bomuldskvalitet, som er helt ideel til sommerens arrangementer. T-shirten kan bruges igen og igen uden at kvaliteten og pasformen forringes. T-shirten har H2Os kendetegnende farver rød, grøn og navy på bryst og ærmer, hvilket giver t-shirten et unik udtryk. H2Os logo er broderet i hvid på brystet samt dobbeltsyninger på ærmerne og langs t-shirtens nederste kant.", id: "35423", imageUrl: "https://firebasestorage.googleapis.com/v0/b/ka-ching-base.appspot.com/o/-L9y_Is8egXrldlakwFZ%2Fpublic%2Fproducts%2F35423%2Fimages%2F-LSKAAJoBkbyXHTVjmFN?alt=media", name: "Blokhus T-shirt - Rød/Grøn/White", retailPrice: 400)
        
        return product
    }
}
