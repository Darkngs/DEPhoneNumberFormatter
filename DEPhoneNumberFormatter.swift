import Foundation

public enum DEPhoneNumberFormat {
   
   case custom
   
   case nanp
   
   case other
}

public class DEPhoneNumberFormatter {
   
   public var customFormat: String?
   
   public var formatType: DEPhoneNumberFormat {
      get {
         if customFormat != nil {
            return .custom
         }
         
         let countryCode = (Locale.current as NSLocale).object(forKey: NSLocale.Key.countryCode) as? String ?? "US"
         
         let arrayNANP = ["AS", "AI", "AG", "BS", "BB", "BM", "VG", "CA", "KY", "DM", "DO", "GD", "GU", "JM", "MS", "MP", "PR", "KN", "LC", "VC", "SX", "TT", "TC", "US", "VI"]
         if arrayNANP.contains(countryCode) {
            return .nanp
         }
         
         let arrayOther = ["RU", "UA"]
         if arrayOther.contains(countryCode) {
            return .other
         }
         
         return .custom
      }
   }
   
   // MARK: -
   
   private func clearPhoneNumber(_ phoneNumber: String) -> String {
      var clearPhoneNumber = phoneNumber.replacingOccurrences(of: " ", with: "")
      clearPhoneNumber = clearPhoneNumber.replacingOccurrences(of: "(", with: "")
      clearPhoneNumber = clearPhoneNumber.replacingOccurrences(of: ")", with: "")
      clearPhoneNumber = clearPhoneNumber.replacingOccurrences(of: "-", with: "")
      clearPhoneNumber = clearPhoneNumber.replacingOccurrences(of: "+", with: "")
      
      return clearPhoneNumber
   }
   
   private func numberNANP(from phoneNumber: String, length: Int) -> String {
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
   
   private func numberOther(from phoneNumber: String, length: Int) -> String {
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
   
   // MARK: -
   
   public func number(from phoneNumber: String) -> String {
      var formattedPhone = clearPhoneNumber(phoneNumber)
      let length = formattedPhone.count
      if length > 10 {
         return formattedPhone
      }
      
      switch formatType {
      case .custom:
         formattedPhone = phoneNumber
      case .nanp:
         formattedPhone = numberNANP(from: formattedPhone, length: length)
      case .other:
         formattedPhone = numberOther(from: formattedPhone, length: length)
      }
      
      return formattedPhone
   }
}

private extension String {
   
   func insert(_ string: String, index: Int) -> String {
      return String(prefix(index)) + string + String(suffix(count - index))
   }
}
