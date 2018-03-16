//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func highlightMatches(pattern: String, inString string: String) -> NSAttributedString{
    
    let regex = try! NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
    
    let range = NSRange(location: 0, length: string.count)
    
    let matches = regex.matches(in: string, options: NSRegularExpression.MatchingOptions.reportProgress, range: range)
    
    
    let attributedText = NSMutableAttributedString(string: string)
    
    for match in matches{
        attributedText.addAttributes([NSAttributedStringKey.backgroundColor: UIColor.yellow], range: match.range)
        
    }
    return attributedText
}


func listMatches(pattern: String, inString string: String) -> [String]{
    let regex = try! NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
    
    let range = NSRange(location: 0, length: string.count)
    
    let matches = regex.matches(in: string, options: NSRegularExpression.MatchingOptions.reportProgress, range: range)
    
    return matches.map{
        let range = $0.range
        return (string as NSString).substring(with: range)
    }
    
}


func listGroups(pattern: String, inString string: String) -> [String]{
    let regex = try! NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
    let range = NSRange(location: 0, length: string.count)
    let matches = regex.matches(in: string, options: NSRegularExpression.MatchingOptions.reportProgress, range: range) 
    print("listGroups- matches \(matches)")
    var groupMatches = [String]()
    
    for match in matches{
        let rangeCount = match.numberOfRanges
        print("listGroups- rangeCount \(rangeCount)")
        for group in 0..<rangeCount{
            groupMatches.append((string as NSString ).substring(with: match.range(at: group)))
        }
    }
    return groupMatches
}

/*
 numberOfRanges
 
 
 Returns the number of ranges.
 
 
 
 Declaration
 @property(readonly) NSUInteger numberOfRanges;
 
 Discussion
 A result must have at least one range, but may optionally have more (for example, to represent regular expression capture groups).
 
 Passing rangeAtIndex: the value 0 always returns the value of the the range property. Additional ranges, if any, will have indexes from 1 to numberOfRanges-1.
 */




func containsMatch(pattern: String, inString string: String) -> Bool{
    let regex = try! NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
    let range = NSRange(location: 0, length: string.count)
    //return regex.firstMatchInString(s)
    return regex.firstMatch(in: string, options: NSRegularExpression.MatchingOptions.reportProgress, range: range) != nil
    
}


func replaceMatches(pattern: String, inString string: String, withString replacementString: String ) -> String?{
    
    let regex = try! NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
    
    let range = NSRange(location: 0, length: string.count)
    
    
    return regex.stringByReplacingMatches(in: string, options: NSRegularExpression.MatchingOptions.reportProgress, range: range, withTemplate: replacementString)
}


let quickFox = "The quick brown fox jumps over the lazy dog."


listMatches(pattern: "jump", inString: quickFox)


//:   ?       This next example uses some special characters that are available in regular expressions. The parenthesis create a group, and the question mark says "match the previous element (the group in this case) 0 or 1 times". It matches either 'jump' or 'jumps':


listMatches(pattern: "jump(s)?", inString: quickFox)



//: This one matches an HTML or XML tag:

let htmlString = "<p>This is an example <strong>html</strong> string.</p>"



listMatches(pattern: "<([a-z][a-z0-9]*)\\b[^>]*>(.*?)", inString: htmlString)



//: Wow, looks complicated, eh? :] Hopefully things will become a bit more clear as you look through the rest of the examples here!

//: ## Cheat Sheet
//:
//: **.** matches any character. `p.p` matches pop, pup, pmp, p@p, and so on.


let anyExample = "pip, pop, p%p, paap, piip, puup, pippin, pp"

listMatches(pattern: "p.p", inString: anyExample)



//:  **\w** matches any 'word-like' character which includes the set of numbers, letters, and underscore, but does not match punctuation or other symbols. `hello\w` will match "hello_9" and "helloo" but not "hello!"


let wordExample = "hello helloooooo hello_1114 hello, hello!"

listMatches(pattern: "hello\\w+" , inString: wordExample)


//: **\d** matches a numeric digit, which in most cases means `[0-9]`. `\d\d?:\d\d` will match strings in time format, such as "9:30" and "12:45".


let digitExample = "9:30 12:45 df:24 ag:gh"

listMatches(pattern: "\\d?\\d:\\d\\d", inString: digitExample)


//: **\b** matches word boundary characters such as spaces and punctuation. `to\b` will match the "to" in "to the moon" and "to!", but it will not match "tomorrow". `\b` is handy for "whole word" type matching.


let boundaryExample = "to the moon! when to go? tomorrow?"

listMatches(pattern: "to\\b", inString: boundaryExample)



//: **\s** matches whitespace characters such as spaces, tabs, and newlines. `hello\s` will match "hello " in "Well, hello there!".

let whitespaceExample = "Well, hello there!"

listMatches(pattern: "hello\\s", inString: whitespaceExample)



//: **^** matches at the beginning of a line. Note that this particular ^ is different from ^ inside of the square brackets! For example, `^Hello` will match against the string "Hello there", but not "He said Hello".

let beginningExample = "Hello there! He said hello."

highlightMatches(pattern: "^hello", inString: beginningExample)



//: **$** matches at the end of a line. For example, `the end$` will match against "It was the end" but not "the end was near"


let endExample = "The end was near. It was the end"

highlightMatches(pattern: "end$", inString: endExample)



//: **\*** matches the previous element 0 or more times. `12*3` will match 13, 123, 1223, 122223, and 1222222223.



let zeroOrMoreExample = "13, 123, 1223, 122223, 1222222223, 143222343"

highlightMatches(pattern: "12*3", inString: zeroOrMoreExample)

//: **+** matches the previous element 1 or more times. `12+3` will match 123, 1223, 122223, 1222222223, but not 13.

let oneOrMoreExample = "13, 123, 1223, 122223, 1222222223, 143222343"

highlightMatches(pattern: "12+3", inString: oneOrMoreExample)


//: `?` matches the previous element 0 or 1 times. `12?3` will match 13 or 123, but not 1223.
let possibleExample = "13, 123, 1223"

highlightMatches(pattern: "12?3", inString: possibleExample)


//: Curly braces **{ }** contain the minimum and maximum number of matches. For example, `10{1,2}1` will match both "101" and "1001" but not "10001" as the minimum number of matches is 1 and the maximum number of matches is 2. `He[Ll]{2,}o` will match "HeLLo" and "HellLLLllo" and any such silly variation of "hello" with lots of L’s, since the minimum number of matches is 2 but the maximum number of matches is not set — and therefore unlimited!

let numberExample1 = "11 101 1001 10001"
let numberExample2 = "HeLLo HellLLLllo"


highlightMatches(pattern: "10{1,2}1", inString: numberExample1)

highlightMatches(pattern: "He[Ll]{2,}", inString: numberExample2)

//: Capturing parentheses **( )** are used to group part of a pattern. For example, `3 (pm|am)` would match the text "3 pm" as well as the text "3 am". The pipe character here (|) acts like an OR operator.

let cinema = "Are we going to the cinema at 3 pm or 5 pm?"
listMatches(pattern: "\\d (am|pm)", inString: cinema)


// 这个是由两部分组成的，\ 转义符 加\d 是一个正字表达式，标识所有数字及0-9  之所以要加\是因为在JAVA中一些特殊的符号如[回车]是没有符号代表的，所以需要转义符这个概念，而像回车这类转义符都是由\开始的，那么就出现了第二个问题，如果我要输入的恰恰是\符号怎么办，那么这个问题就还用转义符来解决，所以\的转义符就是\\。   你刚才的\\d 是要给JAVA一个\d的字符串这时就需要给\符号转义，然后就有了\\d。

listGroups(pattern: "\\d (am|pm)", inString: cinema)




//: You can include as many pipe characters in your regular expression as you would like. As an example, `(Tom|Dick|Harry)` is a valid pattern.


let greeting = "Hello Tom, Dick, Harry!"

listMatches(pattern: "Tom|Dick|Harry", inString: greeting)



replaceMatches(pattern: "Tom|Dick|Harry", inString: greeting, withString: "James")




//: Character classes represent a set of possible single-character matches. Character classes appear between square brackets **[ ]**.
//: As an example, the regular expression `t[aeiou]` will match "ta", "te", "ti", "to", or "tu". You can have as many character possibilities inside the square brackets as you like, but remember that any single character in the set will match. `[aeiou]` _looks_ like five characters, but it actually means "a" or "e" or "i" or "o" or "u".




let theVowels = " te ti to tu ta th tj tk tm"
listMatches(pattern: "t[aeiou]", inString: theVowels)



//: You can also define a range in a character class if the characters appear consecutively. For example, to search for a number between 100 to 109, the pattern would be `10[0-9]`. This returns the same results as `10[0123456789]`, but using ranges makes your regular expressions much cleaner and easier to understand. Ranges can also be used for characters - for example, `[a-z]` matches all lowercase characters, or `[a-zA-Z]` matches all upper and lower case.

let theNumbers = "100 101 105 121 229 816"
listMatches(pattern: "10[1-9]", inString: theNumbers)


listMatches(pattern: "t[a-h]", inString: theVowels)





//: Character classes usually contain the characters you _want_ to match, but what if you want to explicitly _not match_ a character? You can also define negated character classes, which use the `^` character. For example, the pattern `t[^o]` will match any combination of "t" and one other character _except_ for the single instance of "to".

let notClasses = "tim tam tum tom tem"

listMatches(pattern: "t[^oa]m", inString: notClasses)



