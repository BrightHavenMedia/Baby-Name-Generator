//
//  BoyScreen.swift
//  babyNameGenerator
//
//  Created by James Jensen on 10/6/17.
//  Copyright © 2017 James Jensen. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class BoyScreen: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var currentElement = 0
    var itemArray = [Name]()
    var listOfYears = ["2018","2017","2016","2015","2014","2013","2012","2011","2010","2009","2008","2007","2006","2005","2004","2003","2002","2001","2000","1999","1998","1997","1996","1995","1994","1993","1992","1991","1990","1989","1988","1987","1986","1985","1984","1983","1982","1981","1980","1979","1978","1977","1976","1975","1974","1973","1972","1971","1970","1969","1968","1967","1966","1965","1964","1963","1962","1961","1960","1959","1958","1957","1956","1955","1954","1953","1952","1951","1950","1949","1948","1947","1946","1945","1944","1943","1942","1941","1940","1939","1938","1937","1936","1935","1934","1933","1932","1931","1930","1929","1928","1927","1926","1925","1924","1923","1922","1921","1920","1919","1918","1917","1916","1915","1914","1913","1912","1911","1910","1909","1908","1907","1906","1905","1904","1903","1902","1901","1900","1899","1898","1897","1896","1895","1894","1893","1892","1891","1890","1889","1888","1887","1886","1885","1884","1883","1882","1881","1880"]
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var boyYearPicker: UITextField!
    @IBOutlet weak var boyScreenLabel: UILabel!
    @IBOutlet weak var boyGenerate: UIButton!
    @IBOutlet weak var boyAddStyling: UIButton!
    
// MARK: - View Did Load and Label Formatting
    
   override func viewDidLoad() {
    
    
    super.viewDidLoad()
    boyScreenLabel.isEnabled = false
    boyAddStyling.isHidden = true

    let datePicker = UIPickerView()
    
    boyYearPicker.inputView = datePicker
    datePicker.delegate = self
    
    let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BoyScreen.dismissKeyboard))
    
    view.addGestureRecognizer(tapGestureRecognizer)

    addDoneButtonOnKeyboard()
    
    boyYearPicker.layer.cornerRadius = 10
    boyYearPicker.clipsToBounds = true

    boyScreenLabel.layer.cornerRadius = 10
    boyScreenLabel.clipsToBounds = true
    boyGenerate.layer.cornerRadius = 20
    boyGenerate.clipsToBounds = true
    
   }
// MARK: - Favorite Button and Favorite List
    
    @IBAction func boyAddFavorite(_ sender: UIButton) {
        
//        sender.isSelected.toggle()
        
       sender.isSelected = false
            sender.isEnabled = true
            let newName = Name(context: self.context)
            newName.babyName = boyScreenLabel.text!
            
            if sender.isSelected {
                
                self.itemArray.append(newName)
                
            }else {
                sender.isEnabled = false
            }
            saveItems()
        }
    
    @IBAction func showFavorites(_ sender: Any) {
    }
    
// MARK: - Generate Names
    
    @IBAction func boyGeneratePress(_ sender: Any) {
        
        boyScreenLabel.isEnabled = true
        boyAddStyling.isEnabled = true
        boyAddStyling.isSelected = false
        boyAddStyling.isHidden = false
        
        var boyNameArray = [""]
        
       if boyYearPicker.text == "1880" {
            boyNameArray = boy1880
        }else if boyYearPicker.text == "1881" {
            boyNameArray = boy1881
        }else if boyYearPicker.text == "1882" {
            boyNameArray = boy1882
        }else if boyYearPicker.text == "1883" {
            boyNameArray = boy1883
        }else if boyYearPicker.text == "1884" {
            boyNameArray = boy1884
        }else if boyYearPicker.text == "1885" {
            boyNameArray = boy1885
        }else if boyYearPicker.text == "1886" {
            boyNameArray = boy1886
        }else if boyYearPicker.text == "1887" {
            boyNameArray = boy1887
        }else if boyYearPicker.text == "1888" {
            boyNameArray = boy1888
        }else if boyYearPicker.text == "1889" {
            boyNameArray = boy1889
        }else if boyYearPicker.text == "1890" {
            boyNameArray = boy1890
        }else if boyYearPicker.text == "1891" {
            boyNameArray = boy1891
        }else if boyYearPicker.text == "1892" {
            boyNameArray = boy1892
        }else if boyYearPicker.text == "1893" {
            boyNameArray = boy1893
        }else if boyYearPicker.text == "1894" {
            boyNameArray = boy1894
        }else if boyYearPicker.text == "1895" {
            boyNameArray = boy1895
        }else if boyYearPicker.text == "1896" {
            boyNameArray = boy1896
        }else if boyYearPicker.text == "1897" {
            boyNameArray = boy1897
        }else if boyYearPicker.text == "1898" {
            boyNameArray = boy1898
        }else if boyYearPicker.text == "1899" {
            boyNameArray = boy1899
        }else if boyYearPicker.text == "1900" {
            boyNameArray = boy1900
        }else if boyYearPicker.text == "1901" {
            boyNameArray = boy1901
        }else if boyYearPicker.text == "1902" {
            boyNameArray = boy1902
        }else if boyYearPicker.text == "1903" {
            boyNameArray = boy1903
        }else if boyYearPicker.text == "1904" {
            boyNameArray = boy1904
        }else if boyYearPicker.text == "1905" {
            boyNameArray = boy1905
        }else if boyYearPicker.text == "1906" {
            boyNameArray = boy1906
        }else if boyYearPicker.text == "1907" {
            boyNameArray = boy1907
        }else if boyYearPicker.text == "1908" {
            boyNameArray = boy1908
        }else if boyYearPicker.text == "1909" {
            boyNameArray = boy1909
        }else if boyYearPicker.text == "1910" {
            boyNameArray = boy1910
        }else if boyYearPicker.text == "1911" {
            boyNameArray = boy1911
        }else if boyYearPicker.text == "1912" {
            boyNameArray = boy1912
        }else if boyYearPicker.text == "1913" {
            boyNameArray = boy1913
        }else if boyYearPicker.text == "1914" {
            boyNameArray = boy1914
        }else if boyYearPicker.text == "1915" {
            boyNameArray = boy1915
        }else if boyYearPicker.text == "1916" {
            boyNameArray = boy1916
        }else if boyYearPicker.text == "1917" {
            boyNameArray = boy1917
        }else if boyYearPicker.text == "1918" {
            boyNameArray = boy1918
        }else if boyYearPicker.text == "1919" {
            boyNameArray = boy1919
        }else if boyYearPicker.text == "1920" {
            boyNameArray = boy1920
        }else if boyYearPicker.text == "1921" {
            boyNameArray = boy1921
        }else if boyYearPicker.text == "1922" {
            boyNameArray = boy1922
        }else if boyYearPicker.text == "1923" {
            boyNameArray = boy1923
        }else if boyYearPicker.text == "1924" {
            boyNameArray = boy1924
        }else if boyYearPicker.text == "1925" {
            boyNameArray = boy1925
        }else if boyYearPicker.text == "1926" {
            boyNameArray = boy1926
        }else if boyYearPicker.text == "1927" {
            boyNameArray = boy1927
        }else if boyYearPicker.text == "1928" {
            boyNameArray = boy1928
        }else if boyYearPicker.text == "1929" {
            boyNameArray = boy1929
        }else if boyYearPicker.text == "1930" {
            boyNameArray = boy1930
        }else if boyYearPicker.text == "1931" {
            boyNameArray = boy1931
        }else if boyYearPicker.text == "1932" {
            boyNameArray = boy1932
        }else if boyYearPicker.text == "1933" {
            boyNameArray = boy1933
        }else if boyYearPicker.text == "1934" {
            boyNameArray = boy1934
        }else if boyYearPicker.text == "1935" {
            boyNameArray = boy1935
        }else if boyYearPicker.text == "1936" {
            boyNameArray = boy1936
        }else if boyYearPicker.text == "1937" {
            boyNameArray = boy1937
        }else if boyYearPicker.text == "1938" {
            boyNameArray = boy1938
        }else if boyYearPicker.text == "1939" {
            boyNameArray = boy1939
        }else if boyYearPicker.text == "1940" {
            boyNameArray = boy1940
        }else if boyYearPicker.text == "1941" {
            boyNameArray = boy1941
        }else if boyYearPicker.text == "1942" {
            boyNameArray = boy1942
        }else if boyYearPicker.text == "1943" {
            boyNameArray = boy1943
        }else if boyYearPicker.text == "1944" {
            boyNameArray = boy1944
        }else if boyYearPicker.text == "1945" {
            boyNameArray = boy1945
        }else if boyYearPicker.text == "1946" {
            boyNameArray = boy1946
        }else if boyYearPicker.text == "1947" {
            boyNameArray = boy1947
        }else if boyYearPicker.text == "1948" {
            boyNameArray = boy1948
        }else if boyYearPicker.text == "1949" {
            boyNameArray = boy1949
        }else if boyYearPicker.text == "1950" {
            boyNameArray = boy1950
        }else if boyYearPicker.text == "1951" {
            boyNameArray = boy1951
        }else if boyYearPicker.text == "1952" {
            boyNameArray = boy1952
        }else if boyYearPicker.text == "1953" {
            boyNameArray = boy1953
        }else if boyYearPicker.text == "1954" {
            boyNameArray = boy1954
        }else if boyYearPicker.text == "1955" {
            boyNameArray = boy1955
        }else if boyYearPicker.text == "1956" {
            boyNameArray = boy1956
        }else if boyYearPicker.text == "1957" {
            boyNameArray = boy1957
        }else if boyYearPicker.text == "1958" {
            boyNameArray = boy1958
        }else if boyYearPicker.text == "1959" {
            boyNameArray = boy1959
        }else if boyYearPicker.text == "1960" {
            boyNameArray = boy1960
        }else if boyYearPicker.text == "1961" {
            boyNameArray = boy1961
        }else if boyYearPicker.text == "1962" {
            boyNameArray = boy1962
        }else if boyYearPicker.text == "1963" {
            boyNameArray = boy1963
        }else if boyYearPicker.text == "1964" {
            boyNameArray = boy1964
        }else if boyYearPicker.text == "1965" {
            boyNameArray = boy1965
        }else if boyYearPicker.text == "1966" {
            boyNameArray = boy1966
        }else if boyYearPicker.text == "1967" {
            boyNameArray = boy1967
        }else if boyYearPicker.text == "1968" {
            boyNameArray = boy1968
        }else if boyYearPicker.text == "1969" {
            boyNameArray = boy1969
        }else if boyYearPicker.text == "1970" {
            boyNameArray = boy1970
        }else if boyYearPicker.text == "1971" {
            boyNameArray = boy1971
        }else if boyYearPicker.text == "1972" {
            boyNameArray = boy1972
        }else if boyYearPicker.text == "1973" {
            boyNameArray = boy1973
        }else if boyYearPicker.text == "1974" {
            boyNameArray = boy1974
        }else if boyYearPicker.text == "1975" {
            boyNameArray = boy1975
        }else if boyYearPicker.text == "1976" {
            boyNameArray = boy1976
        }else if boyYearPicker.text == "1977" {
            boyNameArray = boy1977
        }else if boyYearPicker.text == "1978" {
            boyNameArray = boy1978
        }else if boyYearPicker.text == "1979" {
            boyNameArray = boy1979
        }else if boyYearPicker.text == "1980" {
            boyNameArray = boy1980
        }else if boyYearPicker.text == "1981" {
            boyNameArray = boy1981
        }else if boyYearPicker.text == "1982" {
            boyNameArray = boy1982
        }else if boyYearPicker.text == "1983" {
            boyNameArray = boy1983
        }else if boyYearPicker.text == "1984" {
            boyNameArray = boy1984
        }else if boyYearPicker.text == "1985" {
            boyNameArray = boy1985
        }else if boyYearPicker.text == "1986" {
            boyNameArray = boy1986
        }else if boyYearPicker.text == "1987" {
            boyNameArray = boy1987
        }else if boyYearPicker.text == "1988" {
            boyNameArray = boy1988
        }else if boyYearPicker.text == "1989" {
            boyNameArray = boy1989
        }else if boyYearPicker.text == "1990" {
            boyNameArray = boy1990
        }else if boyYearPicker.text == "1991" {
            boyNameArray = boy1991
        }else if boyYearPicker.text == "1992" {
            boyNameArray = boy1992
        }else if boyYearPicker.text == "1993" {
            boyNameArray = boy1993
        }else if boyYearPicker.text == "1994" {
            boyNameArray = boy1994
        }else if boyYearPicker.text == "1995" {
            boyNameArray = boy1995
        }else if boyYearPicker.text == "1996" {
            boyNameArray = boy1996
        }else if boyYearPicker.text == "1997" {
            boyNameArray = boy1997
        }else if boyYearPicker.text == "1998" {
            boyNameArray = boy1998
        }else if boyYearPicker.text == "1999" {
            boyNameArray = boy1999
        }else if boyYearPicker.text == "2000" {
            boyNameArray = boy2000
        }else if boyYearPicker.text == "2001" {
            boyNameArray = boy2001
        }else if boyYearPicker.text == "2002" {
            boyNameArray = boy2002
        }else if boyYearPicker.text == "2003" {
            boyNameArray = boy2003
        }else if boyYearPicker.text == "2004" {
            boyNameArray = boy2004
        }else if boyYearPicker.text == "2005" {
            boyNameArray = boy2005
        }else if boyYearPicker.text == "2006" {
            boyNameArray = boy2006
        }else if boyYearPicker.text == "2007" {
            boyNameArray = boy2007
        }else if boyYearPicker.text == "2008" {
            boyNameArray = boy2008
        }else if boyYearPicker.text == "2009" {
            boyNameArray = boy2009
        }else if boyYearPicker.text == "2010" {
            boyNameArray = boy2010
        }else if boyYearPicker.text == "2011" {
            boyNameArray = boy2011
        }else if boyYearPicker.text == "2012" {
            boyNameArray = boy2012
        }else if boyYearPicker.text == "2013" {
            boyNameArray = boy2013
        }else if boyYearPicker.text == "2014" {
            boyNameArray = boy2014
        }else if boyYearPicker.text == "2015" {
            boyNameArray = boy2015
        }else if boyYearPicker.text == "2016" {
            boyNameArray = boy2016
        }else if boyYearPicker.text == "2017" {
            boyNameArray = boy2017
        }else if boyYearPicker.text == "2018" {
            boyNameArray = boy2018
        }

        
        nameListGenerator(fileName: boyNameArray)
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
        boyYearPicker.text = listOfYears[row]
        boyYearPicker.textColor = UIColor.black
        boyYearPicker.font = UIFont.boldSystemFont(ofSize: 18)
        boyScreenLabel.text = ""
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
        
        boyYearPicker.inputAccessoryView = doneToolbar
        
    }
    
    @objc func doneButtonAction(){
        boyYearPicker.resignFirstResponder()
    
    }
    
// MARK: - Core Data
    
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
        
        boyScreenLabel.text = fileName.randomElement()
        
        currentElement += 1
        
    }
    
}

}

