//
//  LineItem.swift
//  budgeting
//
//  Created by Michael Williams on 11/30/16.
//  Copyright © 2016 Reality Church of Los Angeles. All rights reserved.
//

import Foundation

enum LineItemType:String {
    case income, fixed, variable
}

enum LineItemCategory:String {
    case housing, transportation, otherExpenses
}

struct LineItem {
    let label:String
    let dollarAmount:String
    let type:LineItemType
    let category:LineItemCategory?
}

