//
//  CalendarViewCell.swift
//  MonthsCalendar
//
//  Created by cqlios3 on 31/05/24.
//

import UIKit
import Foundation

class CalendarViewCell: UICollectionViewCell {
    
    @IBOutlet weak var btnMonthClick: UIButton!
    @IBOutlet weak var lblMonth: UILabel!
    @IBOutlet weak var viewMonth: CustomView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
