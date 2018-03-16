//
//  SearchViewController.swift
//  regular_den
//
//  Created by dengjiangzhou on 2018/3/14.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    
    struct Storyboard{
        struct Identifiers{
            static let SearchOptionsSegueIdentifier = "SearchOptionsSegue"
        }
        
    }
    
    
    
    @IBOutlet weak var textView: UITextView!
    var searchOptions: SearchOptions?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == Storyboard.Identifiers.SearchOptionsSegueIdentifier {
            if let options = self.searchOptions , let navigationController = segue.destination as? UINavigationController , let searchOptionsViewController = navigationController.topViewController as? SearchOptionsViewController{
                searchOptionsViewController.searchOptions = options
            }
        }
    }
 
    
    
    
    
    @IBAction func underlineInterestingData(_ sender: UIBarButtonItem) {
<<<<<<< HEAD
      
        underlineAllDates()
        underlineAllTimes()
        underlineAllLocations()
    }
    /*  let attributedText = textView.attributedText.mutableCopy() as! NSMutableAttributedString
     let attributedTextRange = NSRange(location: 0, length: attributedText.length)
     attributedText.addAttributes([NSAttributedStringKey.foregroundColor:  UIColor.black], range: attributedTextRange)
     
     textView.attributedText = attributedText.copy() as! NSAttributedString
     
     
     
     
     
     
     
     [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle, NSAttributedStringKey.foregroundColor:  UIColor.blue]
     
     
     */
    
    
=======
        
        underlineAllDates()
        underlineAllTimes()
        underlineAllLocations()
        
        
        
    }
>>>>>>> 2af15b36ed07041d166414a13d135cfe3e077cfc
    
    
    //MARK: Underline dates, times, and locations
    
<<<<<<< HEAD
    func underlineAllDates(){
        if let regex = NSRegularExpression.regularExpressionForDates(){
            let matches = matchesForRegularExpression(regex: regex, inTextView: textView)
            highlightMatches(matches: matches)
        }
    }
    
    func underlineAllTimes() {
        if let regex = NSRegularExpression.regularExpressionForTimes(){
            let matches = matchesForRegularExpression(regex: regex, inTextView: textView)
            highlightMatches(matches: matches)
        }
    }
    
    
    func underlineAllLocations() {
        if let regex = NSRegularExpression.regularExpressionForLocations(){
            let matches = matchesForRegularExpression(regex: regex, inTextView: textView)
            highlightMatches(matches: matches)
        }
=======
    func underlineAllDates() {
    }
    
    func underlineAllTimes() {
    }
    
    func underlineAllLocations() {
>>>>>>> 2af15b36ed07041d166414a13d135cfe3e077cfc
    }
    
    
    
    
    @IBAction func unwindToTextHighlightViewController(segue: UIStoryboardSegue) {
        if let searchOptionsViewController = segue.source as? SearchOptionsViewController, let options = searchOptionsViewController.searchOptions{
            performSearchWithOptions(searchOptions: options)
        }
    }
    
    func performSearchWithOptions(searchOptions: SearchOptions){
        self.searchOptions = searchOptions
<<<<<<< HEAD
        if searchOptions.replacementString != "", let replacementString = searchOptions.replacementString{
=======
        if let replacementString = searchOptions.replacementString{
>>>>>>> 2af15b36ed07041d166414a13d135cfe3e077cfc
            searchForText(searchText: searchOptions.searchString, replaceWith: replacementString, inTextView: textView)
        }
        else{
            highlightText(searchText: searchOptions.searchString, inTextView: textView)
        }

    }
    
    //MARK: - Search and HighLight
    func searchForText(searchText: String, replaceWith replacementText: String, inTextView textView: UITextView){
<<<<<<< HEAD
        let beforeText = textView.text
        let range = NSMakeRange(0, (beforeText?.count)!)
        if let regex = NSRegularExpression(options: self.searchOptions!){
            let afterText = regex.stringByReplacingMatches(in: beforeText!, options: .init(rawValue: 0), range: range, withTemplate: replacementText)
            textView.text = afterText
        }
        
    }
    

    
    func highlightText(searchText: String, inTextView textView: UITextView) {
        let attributedText = textView.attributedText.mutableCopy() as! NSMutableAttributedString
        let attributedTextRange = NSRange(location: 0, length: attributedText.length)
        attributedText.removeAttribute(NSAttributedStringKey.backgroundColor, range: attributedTextRange)
        if let regex = NSRegularExpression(options: self.searchOptions!){
            let range = NSRange(location: 0, length: textView.text.count)
            let matches = regex.matches(in: textView.text, options: .init(rawValue: 0), range: range)
            for match in matches{
                let matchRange = match.range
                attributedText.addAttribute(NSAttributedStringKey.backgroundColor, value: UIColor.yellow, range: matchRange)
            }
        }
        
        
        textView.attributedText = attributedText.copy() as! NSAttributedString
=======
        
        
    }
    
    func highlightText(searchText: String, inTextView textView: UITextView) {
        
        
>>>>>>> 2af15b36ed07041d166414a13d135cfe3e077cfc
    }
    
    
    //MARK: - Aid And Regex
    
    func rangeForAllTextInTextView() -> NSRange {
        return NSMakeRange(0, textView.text.count)
    }
    
    
    func matchesForRegularExpression(regex: NSRegularExpression, inTextView textView: UITextView) -> [NSTextCheckingResult] {
        if let string = textView.text{
            let range = rangeForAllTextInTextView()
<<<<<<< HEAD
            let textCheckingResults = regex.matches(in: string, options: NSRegularExpression.MatchingOptions.reportProgress, range: range)
            return textCheckingResults
=======
            return regex.matches(in: string, options: NSRegularExpression.MatchingOptions.reportProgress, range: range)
>>>>>>> 2af15b36ed07041d166414a13d135cfe3e077cfc
        }
        else{
            return []
        }
    }
    
    
    func highlightMatches(matches: [NSTextCheckingResult]){
        let attributedText = textView.attributedText.mutableCopy() as! NSMutableAttributedString
        let attributedTextRange = NSRange(location: 0, length: attributedText.length)
        attributedText.removeAttribute(NSAttributedStringKey.backgroundColor, range: attributedTextRange)
        for match in matches{
            let matchRange = match.range
<<<<<<< HEAD
            attributedText.addAttributes([NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue, NSAttributedStringKey.foregroundColor:  UIColor.blue], range: matchRange)
        }
        textView.attributedText = attributedText.copy() as! NSAttributedString
        
        
        
=======
            attributedText.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.blue, range: matchRange)
            attributedText.addAttributes([NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle], range: matchRange)
        }
        textView.attributedText = attributedText.copy() as! NSAttributedString
>>>>>>> 2af15b36ed07041d166414a13d135cfe3e077cfc
    }
}



