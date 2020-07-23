//
//  GirlScreen.swift
//  babyNameGenerator
//
//  Created by James Jensen on 10/6/17.
//  Copyright © 2017 James Jensen. All rights reserved.
// when I press boy or girl it shuffles the array. When I click generate it ittereates through that array. Find a way to make each name display once. 

import Foundation
import UIKit
import CoreData

class GirlScreen: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var itemArray = [Name]()
    var listOfYears = ["2018","2017","2016","2015","2014","2013","2012","2011","2010","2009","2008","2007","2006","2005","2004","2003","2002","2001","2000","1999","1998","1997","1996","1995","1994","1993","1992","1991","1990","1989","1988","1987","1986","1985","1984","1983","1982","1981","1980","1979","1978","1977","1976","1975","1974","1973","1972","1971","1970","1969","1968","1967","1966","1965","1964","1963","1962","1961","1960","1959","1958","1957","1956","1955","1954","1953","1952","1951","1950","1949","1948","1947","1946","1945","1944","1943","1942","1941","1940","1939","1938","1937","1936","1935","1934","1933","1932","1931","1930","1929","1928","1927","1926","1925","1924","1923","1922","1921","1920","1919","1918","1917","1916","1915","1914","1913","1912","1911","1910","1909","1908","1907","1906","1905","1904","1903","1902","1901","1900","1899","1898","1897","1896","1895","1894","1893","1892","1891","1890","1889","1888","1887","1886","1885","1884","1883","1882","1881","1880"]
    
    var currentYearSelection = ""
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var girlFavoriteName : String = ""
    
    var currentElement = 0
    
    @IBOutlet weak var girlYearPicker: UITextField!
    
    @IBOutlet weak var girlNameLabel: UILabel!
    
    @IBOutlet weak var girlGenerate: UIButton!
    
    @IBOutlet weak var girlAddStyling: UIButton!
    
// MARK: - View Did Load and Label Formatting
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let datePicker = UIPickerView()
        
        girlYearPicker.inputView = datePicker
        datePicker.delegate = self
        
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GirlScreen.dismissKeyboard))
        
        view.addGestureRecognizer(tapGestureRecognizer)
        
        addDoneButtonOnKeyboard()
    
        girlNameLabel.isEnabled = false
        girlAddStyling.isHidden = true
        
        girlYearPicker.layer.cornerRadius = 10
        girlYearPicker.clipsToBounds = true
            
        girlNameLabel.layer.cornerRadius = 10
        girlNameLabel.clipsToBounds = true
        girlGenerate.layer.cornerRadius = 20
        girlGenerate.clipsToBounds = true
    
    }
    
// MARK: - Favorite Button and Favorite List
    
    @IBAction func girlAddFavorite(_ sender: UIButton) {

        sender.isSelected = false
        sender.isEnabled = true
        let newName = Name(context: self.context)
        newName.babyName = girlNameLabel.text!
        
        if sender.isSelected {
            
            self.itemArray.append(newName)
            
        }else {
            sender.isEnabled = false
        }
        saveItems()
    }
    
// MARK: - Generate Names
    

    @IBAction func girlGeneratePress(_ sender: Any) {
        
        girlNameLabel.isEnabled = true
        girlAddStyling.isEnabled = true
        girlAddStyling.isSelected = false
        girlAddStyling.isHidden = false
        
        var girlNameArray = [""]
        
        if girlYearPicker.text == "1880" {
            girlNameArray = girl1880
        }else if girlYearPicker.text == "1881" {
            girlNameArray = girl1881
        }else if girlYearPicker.text == "1882" {
            girlNameArray = girl1882
        }else if girlYearPicker.text == "1883" {
            girlNameArray = girl1883
        }else if girlYearPicker.text == "1884" {
            girlNameArray = girl1884
        }else if girlYearPicker.text == "1885" {
            girlNameArray = girl1885
        }else if girlYearPicker.text == "1886" {
            girlNameArray = girl1886
        }else if girlYearPicker.text == "1887" {
            girlNameArray = girl1887
        }else if girlYearPicker.text == "1888" {
            girlNameArray = girl1888
        }else if girlYearPicker.text == "1889" {
            girlNameArray = girl1889
        }else if girlYearPicker.text == "1890" {
            girlNameArray = girl1890
        }else if girlYearPicker.text == "1891" {
            girlNameArray = girl1891
        }else if girlYearPicker.text == "1892" {
            girlNameArray = girl1892
        }else if girlYearPicker.text == "1893" {
            girlNameArray = girl1893
        }else if girlYearPicker.text == "1894" {
            girlNameArray = girl1894
        }else if girlYearPicker.text == "1895" {
            girlNameArray = girl1896
        }else if girlYearPicker.text == "1896" {
            girlNameArray = girl1896
        }else if girlYearPicker.text == "1897" {
            girlNameArray = girl1897
        }else if girlYearPicker.text == "1898" {
            girlNameArray = girl1898
        }else if girlYearPicker.text == "1899" {
            girlNameArray = girl1899
        }else if girlYearPicker.text == "1900" {
            girlNameArray = girl1900
        }else if girlYearPicker.text == "1901" {
            girlNameArray = girl1901
        }else if girlYearPicker.text == "1902" {
            girlNameArray = girl1902
        }else if girlYearPicker.text == "1903" {
            girlNameArray = girl1903
        }else if girlYearPicker.text == "1904" {
            girlNameArray = girl1904
        }else if girlYearPicker.text == "1905" {
            girlNameArray = girl1905
        }else if girlYearPicker.text == "1906" {
            girlNameArray = girl1906
        }else if girlYearPicker.text == "1907" {
            girlNameArray = girl1907
        }else if girlYearPicker.text == "1908" {
            girlNameArray = girl1908
        }else if girlYearPicker.text == "1909" {
            girlNameArray = girl1909
        }else if girlYearPicker.text == "1910" {
            girlNameArray = girl1910
        }else if girlYearPicker.text == "1911" {
            girlNameArray = girl1911
        }else if girlYearPicker.text == "1912" {
            girlNameArray = girl1912
        }else if girlYearPicker.text == "1913" {
            girlNameArray = girl1913
        }else if girlYearPicker.text == "1914" {
            girlNameArray = girl1914
        }else if girlYearPicker.text == "1915" {
            girlNameArray = girl1915
        }else if girlYearPicker.text == "1916" {
            girlNameArray = girl1916
        }else if girlYearPicker.text == "1917" {
            girlNameArray = girl1917
        }else if girlYearPicker.text == "1918" {
            girlNameArray = girl1918
        }else if girlYearPicker.text == "1919" {
            girlNameArray = girl1919
        }else if girlYearPicker.text == "1920" {
            girlNameArray = girl1920
        }else if girlYearPicker.text == "1921" {
            girlNameArray = girl1921
        }else if girlYearPicker.text == "1922" {
            girlNameArray = girl1922
        }else if girlYearPicker.text == "1923" {
            girlNameArray = girl1923
        }else if girlYearPicker.text == "1924" {
            girlNameArray = girl1924
        }else if girlYearPicker.text == "1925" {
            girlNameArray = girl1925
        }else if girlYearPicker.text == "1926" {
            girlNameArray = girl1926
        }else if girlYearPicker.text == "1927" {
            girlNameArray = girl1927
        }else if girlYearPicker.text == "1928" {
            girlNameArray = girl1928
        }else if girlYearPicker.text == "1929" {
            girlNameArray = girl1929
        }else if girlYearPicker.text == "1930" {
            girlNameArray = girl1930
        }else if girlYearPicker.text == "1931" {
            girlNameArray = girl1931
        }else if girlYearPicker.text == "1932" {
            girlNameArray = girl1932
        }else if girlYearPicker.text == "1933" {
            girlNameArray = girl1933
        }else if girlYearPicker.text == "1934" {
            girlNameArray = girl1934
        }else if girlYearPicker.text == "1935" {
            girlNameArray = girl1935
        }else if girlYearPicker.text == "1936" {
            girlNameArray = girl1936
        }else if girlYearPicker.text == "1937" {
            girlNameArray = girl1937
        }else if girlYearPicker.text == "1938" {
            girlNameArray = girl1938
        }else if girlYearPicker.text == "1939" {
            girlNameArray = girl1939
        }else if girlYearPicker.text == "1940" {
            girlNameArray = girl1940
        }else if girlYearPicker.text == "1941" {
            girlNameArray = girl1942
        }else if girlYearPicker.text == "1943" {
            girlNameArray = girl1943
        }else if girlYearPicker.text == "1944" {
            girlNameArray = girl1944
        }else if girlYearPicker.text == "1945" {
            girlNameArray = girl1945
        }else if girlYearPicker.text == "1946" {
            girlNameArray = girl1946
        }else if girlYearPicker.text == "1947" {
            girlNameArray = girl1947
        }else if girlYearPicker.text == "1948" {
            girlNameArray = girl1948
        }else if girlYearPicker.text == "1949" {
            girlNameArray = girl1949
        }else if girlYearPicker.text == "1950" {
            girlNameArray = girl1950
        }else if girlYearPicker.text == "1951" {
            girlNameArray = girl1951
        }else if girlYearPicker.text == "1952" {
            girlNameArray = girl1952
        }else if girlYearPicker.text == "1953" {
            girlNameArray = girl1953
        }else if girlYearPicker.text == "1954" {
            girlNameArray = girl1954
        }else if girlYearPicker.text == "1955" {
            girlNameArray = girl1955
        }else if girlYearPicker.text == "1956" {
            girlNameArray = girl1956
        }else if girlYearPicker.text == "1957" {
            girlNameArray = girl1957
        }else if girlYearPicker.text == "1958" {
            girlNameArray = girl1958
        }else if girlYearPicker.text == "1959" {
            girlNameArray = girl1959
        }else if girlYearPicker.text == "1960" {
            girlNameArray = girl1960
        }else if girlYearPicker.text == "1961" {
            girlNameArray = girl1961
        }else if girlYearPicker.text == "1962" {
            girlNameArray = girl1962
        }else if girlYearPicker.text == "1963" {
            girlNameArray = girl1963
        }else if girlYearPicker.text == "1964" {
            girlNameArray = girl1964
        }else if girlYearPicker.text == "1965" {
            girlNameArray = girl1965
        }else if girlYearPicker.text == "1966" {
            girlNameArray = girl1966
        }else if girlYearPicker.text == "1967" {
            girlNameArray = girl1967
        }else if girlYearPicker.text == "1968" {
            girlNameArray = girl1968
        }else if girlYearPicker.text == "1969" {
            girlNameArray = girl1969
        }else if girlYearPicker.text == "1970" {
            girlNameArray = girl1970
        }else if girlYearPicker.text == "1971" {
            girlNameArray = girl1972
        }else if girlYearPicker.text == "1973" {
            girlNameArray = girl1973
        }else if girlYearPicker.text == "1974" {
            girlNameArray = girl1974
        }else if girlYearPicker.text == "1975" {
            girlNameArray = girl1975
        }else if girlYearPicker.text == "1976" {
            girlNameArray = girl1976
        }else if girlYearPicker.text == "1977" {
            girlNameArray = girl1977
        }else if girlYearPicker.text == "1978" {
            girlNameArray = girl1978
        }else if girlYearPicker.text == "1979" {
            girlNameArray = girl1979
        }else if girlYearPicker.text == "1980" {
            girlNameArray = girl1980
        }else if girlYearPicker.text == "1981" {
            girlNameArray = girl1981
        }else if girlYearPicker.text == "1982" {
            girlNameArray = girl1982
        }else if girlYearPicker.text == "1983" {
            girlNameArray = girl1983
        }else if girlYearPicker.text == "1984" {
            girlNameArray = girl1984
        }else if girlYearPicker.text == "1985" {
            girlNameArray = girl1985
        }else if girlYearPicker.text == "1986" {
            girlNameArray = girl1986
        }else if girlYearPicker.text == "1987" {
            girlNameArray = girl1987
        }else if girlYearPicker.text == "1988" {
            girlNameArray = girl1988
        }else if girlYearPicker.text == "1989" {
            girlNameArray = girl1989
        }else if girlYearPicker.text == "1990" {
            girlNameArray = girl1990
        }else if girlYearPicker.text == "1991" {
            girlNameArray = girl1991
        }else if girlYearPicker.text == "1992" {
            girlNameArray = girl1992
        }else if girlYearPicker.text == "1993" {
            girlNameArray = girl1993
        }else if girlYearPicker.text == "1994" {
            girlNameArray = girl1994
        }else if girlYearPicker.text == "1995" {
            girlNameArray = girl1995
        }else if girlYearPicker.text == "1996" {
            girlNameArray = girl1996
        }else if girlYearPicker.text == "1997" {
            girlNameArray = girl1997
        }else if girlYearPicker.text == "1998" {
            girlNameArray = girl1998
        }else if girlYearPicker.text == "1999" {
            girlNameArray = girl1999
        }else if girlYearPicker.text == "2000" {
            girlNameArray = girl2000
        }else if girlYearPicker.text == "2001" {
            girlNameArray = girl2001
        }else if girlYearPicker.text == "2002" {
            girlNameArray = girl2002
        }else if girlYearPicker.text == "2003" {
            girlNameArray = girl2003
        }else if girlYearPicker.text == "2004" {
            girlNameArray = girl2004
        }else if girlYearPicker.text == "2005" {
            girlNameArray = girl2005
        }else if girlYearPicker.text == "2006" {
            girlNameArray = girl2006
        }else if girlYearPicker.text == "2007" {
            girlNameArray = girl2007
        }else if girlYearPicker.text == "2008" {
            girlNameArray = girl2008
        }else if girlYearPicker.text == "2009" {
            girlNameArray = girl2009
        }else if girlYearPicker.text == "2010" {
            girlNameArray = girl2010
        }else if girlYearPicker.text == "2011" {
            girlNameArray = girl2011
        }else if girlYearPicker.text == "2012" {
            girlNameArray = girl2012
        }else if girlYearPicker.text == "2013" {
            girlNameArray = girl2013
        }else if girlYearPicker.text == "2014" {
            girlNameArray = girl2014
        }else if girlYearPicker.text == "2015" {
            girlNameArray = girl2015
        }else if girlYearPicker.text == "2016" {
            girlNameArray = girl2016
        }else if girlYearPicker.text == "2017" {
            girlNameArray = girl2017
        }else if girlYearPicker.text == "2018" {
            girlNameArray = girl2018
        }
        
        nameListGenerator(fileName: girlNameArray)

        
    }
//    MARK: - Date Picker
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listOfYears.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        girlYearPicker.text = listOfYears[row]
        girlYearPicker.textColor = UIColor.black
        girlYearPicker.font = UIFont.boldSystemFont(ofSize: 18)
        girlNameLabel.text = ""

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listOfYears[row]
    }
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        girlYearPicker.inputAccessoryView = doneToolbar

        
    }
    
    @objc func doneButtonAction(){
        girlYearPicker.resignFirstResponder()
    
    }

//    MARK: - Core Data
    
    func saveItems() {
            
        do {
            try context.save()
                
        } catch {
            print("Error saving context \(error)")
                
        }

    }
        
    func loadItems() {
        let request: NSFetchRequest<Name> = Name.fetchRequest()
        
        do {
        itemArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
            
        }

    }
    
    func nameListGenerator(fileName: [String]) {
        
        
        
        for _ in fileName {
            
            girlNameLabel.text = fileName.randomElement()
            
            currentElement += 1
            
        }
        
        

//        if currentElement < fileName.count {
//
//            girlNameLabel.text = fileName.randomElement()
//
//            currentElement += 1
//
//        }

//        } else {
//            girlNameLabel.text = "Sorry Out of Names"
//
//        }
        
    }
    
}

