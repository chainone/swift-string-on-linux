extension String{
   public func hasPrefix(str: String) -> Bool {
      if utf8.count < str.utf8.count {
           return false
      }
      for i in 0..<str.utf8.count {
           if utf8[utf8.startIndex.advancedBy(i)] != str.utf8[str.utf8.startIndex.advancedBy(i)] {
              return false
           }
      }
      return true
   }

   public func hasSuffix(str: String) -> Bool {
      let count = utf8.count
      let strCount = str.utf8.count
      if count < strCount {
         return false
      }
      for i in 0..<str.utf8.count {
         if utf8[utf8.startIndex.advancedBy(count-i-1)] != str.utf8[str.utf8.startIndex.advancedBy(strCount-i-1)] {
              return false
         }
      }
      return true
  }


   public func hasPrefix2(str: String) -> Bool{
      if utf8.count < str.utf8.count {
         return false
      }

      for index in zip((startIndex..<endIndex), (str.startIndex..<str.endIndex)) where self[index.0] != str[index.1]{
         return false
      }
      return true
   }



   public func hasSuffix2(str: String) -> Bool{
      if utf8.count < str.utf8.count {
         return false
      }

      for index in zip((startIndex..<endIndex).reverse(), (str.startIndex..<str.endIndex).reverse()) where self[index.0] != str[index.1]{
         return false
      }
      return true
    }
}

let targetStrings = ["The Swift Package Manager is a tool for managing the distribution of Swift code",
                     "It’s integrated with the Swift build system to automate the process of downloading",
                     "compiling, and linking dependencies.",
                     "This section describes the basic concepts that motivate the functionality of the Swift Package Manager",
                     "Modules",
                     "Swift organizes code into modules",
                     "A program may have all of its code in a single module,",
                     "Packages",
                     "A target may build either a library or an executable as its product",
                     "A target’s dependencies are modules that are required"
                     ]

let matchedPrefixStrings = ["The Swift Package Manager",
                           "It’s integrated with the Swift build system to automate the process of",
                           "compili",
                           "This section describes the basic concepts that motivate the functionality of the Swift Package Manager",
                           "M",
                           "Swift",
                           "A program ",
                           "Pac",
                           "A target may build either",
                           "A target’s",
                           ""
                           ]


let matchedSuffixStrings = ["managing the distribution of Swift code",
                            "uild system to automate the process of downloading",
                            "ling, and linking dependencies.",
                            "Swift Package Manager",
                            "es",
                            "modules",
                            "A program may have all of its code in a single module,",
                            "es",
                            "ts product",
                            "ules that are required",
                            ""
                           ]

let noMatchedStrings = ["AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
                        "Swift Stirng on Linux",
                        "compilix",
                        "xbuild system to automate the process of",
                        "A target’s dependencies are modules that are requiredx",
                        "xA target’s dependencies are modules that are required",
                        ]

print("Start to run version 1")
for i in (0..<10000){
   for stringTuple in zip(targetStrings, matchedPrefixStrings){
      stringTuple.0.hasPrefix(stringTuple.1)
   }

   for stringTuple in zip(targetStrings, matchedSuffixStrings){
      stringTuple.0.hasSuffix(stringTuple.1)
   }

   for stringTuple in zip(targetStrings, noMatchedStrings){
      stringTuple.0.hasPrefix(stringTuple.1)
      stringTuple.0.hasSuffix(stringTuple.1)
   }
}
print("End of run version 1")
print("Start to run version 2")
for i in (0..<10000){
   for stringTuple in zip(targetStrings, matchedPrefixStrings){
      stringTuple.0.hasPrefix2(stringTuple.1)
   }

   for stringTuple in zip(targetStrings, matchedSuffixStrings){
      stringTuple.0.hasSuffix2(stringTuple.1)
   }

   for stringTuple in zip(targetStrings, noMatchedStrings){
      stringTuple.0.hasPrefix2(stringTuple.1)
      stringTuple.0.hasSuffix2(stringTuple.1)
   }
}
print("End of run version 2")

print("Hello, job finished")
