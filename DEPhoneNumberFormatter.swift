import Foundation

enum FormatType {
   case Custom
   case Default
   case NANP
   case Other
}

class DEPhoneNumberFormatter {
   
   var customFormat: String?
   
   var formatType: FormatType {
      get {
         if customFormat != nil {
            return .Custom
         }
         
         let countryCode = (Locale.current as NSLocale).object(forKey: NSLocale.Key.countryCode) as? String ?? "US"
         
         let arrayNANP = ["AS", "AI", "AG", "BS", "BB", "BM", "VG", "CA", "KY", "DM", "DO", "GD", "GU", "JM", "MS", "MP", "PR", "KN", "LC", "VC", "SX", "TT", "TC", "US", "VI"]
         if arrayNANP.contains(countryCode) {
            return .NANP
         }
         
         let arrayOther = ["RU", "UA"]
         if arrayOther.contains(countryCode) {
            return .Other
         }
         
         return .Default
      }
   }
   
   func formattedPhoneNumber(_ phoneNumber: String) -> String {
      var formattedPhone = clearPhoneNumber(phoneNumber)
      let length = formattedPhone.count
      if length > 10 {
         return formattedPhone
      }
      
      switch formatType {
      case .Custom:
         formattedPhone = phoneNumber
      case .Default:
         formattedPhone = phoneNumber
      case .NANP:
         formattedPhone = formattedPhoneNumberNANP(formattedPhone, length: length)
      case .Other:
         formattedPhone = formattedPhoneNumberOther(formattedPhone, length: length)
      }
      
      return formattedPhone
   }
   
   fileprivate func clearPhoneNumber(_ phoneNumber: String) -> String {
      var clearPhoneNumber = phoneNumber.replacingOccurrences(of: " ", with: "")
      clearPhoneNumber = clearPhoneNumber.replacingOccurrences(of: "(", with: "")
      clearPhoneNumber = clearPhoneNumber.replacingOccurrences(of: ")", with: "")
      clearPhoneNumber = clearPhoneNumber.replacingOccurrences(of: "-", with: "")
      clearPhoneNumber = clearPhoneNumber.replacingOccurrences(of: "+", with: "")
      
      return clearPhoneNumber
   }
   
   fileprivate func formattedPhoneNumberNANP(_ phoneNumber: String, length: Int) -> String {
      var formattedPhone = phoneNumber
      
      if length > 0 {
         formattedPhone = formattedPhone.insert("(", index: 0)
      }
      if length > 3 {
         formattedPhone = formattedPhone.insert(") ", index: 4)
      }
      if length > 6 {
         formattedPhone = formattedPhone.insert("-", index: 9)
      }
      
      return formattedPhone
   }
   
   fileprivate func formattedPhoneNumberOther(_ phoneNumber: String, length: Int) -> String {
      var formattedPhone = phoneNumber
      
      if length > 0 {
         formattedPhone = formattedPhone.insert("(", index: 0)
      }
      if length > 3 {
         formattedPhone = formattedPhone.insert(") ", index: 4)
      }
      if length > 6 {
         formattedPhone = formattedPhone.insert(" ", index: 9)
      }
      if length > 8 {
         formattedPhone = formattedPhone.insert(" ", index: 12)
      }
      
      return formattedPhone
   }
}

extension String {
   
   func insert(_ string: String, index: Int) -> String {
      return String(prefix(index)) + string + String(suffix(count - index))
   }
   
   func isNumber() -> Bool {
      if Int(self) == nil {
         return false
      }
      
      return true
   }
   
   func isNumberOrEmpty() -> Bool {
      if self.isEmpty {
         return true
      }
      
      return self.isNumber()
   }
}
