//
//  ViewController.swift
//  MonthsCalendar
//
//  Created by cqlios3 on 31/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    //------------------------------------------------------
    
    //MARK: Varible and Outlest

    var months = [MonthName]()
    var selectedMonthName = String()
    var selectedYear = Calendar.current.component(.year, from: Date())
    
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMonths()
    }
    
    //------------------------------------------------------
    
    //MARK: Custome Function
    
    func updateYearLabel() {
        lblYear.text = "\(selectedYear)"
    }
    
    //------------------------------------------------------
    
    //MARK: Actions
    
    @IBAction func btnNext(_ sender: Any) {
        selectedYear += 1
        updateYearLabel()
        setupMonths()
        collectionView.reloadData()
    }
    
    @IBAction func btnPrevious(_ sender: Any) {
        selectedYear -= 1
        updateYearLabel()
        setupMonths()
        collectionView.reloadData()
    }
}

//------------------------------------------------------

//MARK: Collection view delegate and datasource

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return months.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarViewCell", for: indexPath) as! CalendarViewCell
        cell.lblMonth.text = months[indexPath.item].monthName
        if months[indexPath.row].isSelected == true {
            cell.viewMonth.backgroundColor = #colorLiteral(red: 0.0006505683414, green: 0.4524626136, blue: 0.7062280774, alpha: 1)
            cell.lblMonth.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        } else {
            cell.viewMonth.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.lblMonth.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        if months[indexPath.row].isDisabled {
            cell.viewMonth.alpha = 0.3
        } else {
            cell.viewMonth.alpha = 1.0
        }
        cell.btnMonthClick.tag = indexPath.item
        cell.btnMonthClick.addTarget(self, action: #selector(clickMonth(sender:)), for: .touchUpInside)
        return cell
    }
    
    @objc func clickMonth(sender: UIButton) {
        let selectedMonth = sender.tag
        let selectedMonthStruct = months[selectedMonth]
        if selectedMonthStruct.isDisabled {
            return
        }
        for (index, var month) in months.enumerated() {
            if index == selectedMonth {
                month.isSelected.toggle()
                selectedMonthName = selectedMonthStruct.monthName
            } else {
                month.isSelected = false
            }
            months[index] = month
        }
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/4.0
        let yourHeight = yourWidth
        
        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
