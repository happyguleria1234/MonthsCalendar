//
//  ViewController+Extension.swift
//  MonthsCalendar
//
//  Created by Happy Guleria on 12/06/24.
//

import Foundation

//------------------------------------------------------

//MARK: Set Month Data

extension ViewController {

    func setupMonths() {
        months.removeAll()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        
        let currentDate = Date()
        let calendar = Calendar.current
        
        let currentMonth = calendar.component(.month, from: currentDate)
        let currentYear = calendar.component(.year, from: currentDate)
        
        let startOfLast12Months = calendar.date(byAdding: .month, value: -11, to: currentDate)!
        let startMonth = calendar.component(.month, from: startOfLast12Months)
        let startYear = calendar.component(.year, from: startOfLast12Months)
        
        for month in 1...12 {
            let monthName = formatter.shortMonthSymbols[month - 1]
            let monthNameFull = formatter.monthSymbols[month - 1]
            
            var isDisabled = true
            var isSelected = false
            
            if selectedYear == currentYear {
                if month <= currentMonth {
                    isDisabled = false
                    if month == currentMonth {
                        isSelected = true
                    }
                }
            } else if selectedYear == startYear {
                if month >= startMonth {
                    isDisabled = false
                }
            } else if selectedYear > startYear && selectedYear < currentYear {
                isDisabled = false
            }
            
            let monthStruct = MonthName(monthName: monthName, isSelected: isSelected, isDisabled: isDisabled, fullMonthName: monthNameFull)
            months.append(monthStruct)
        }
    }
}
