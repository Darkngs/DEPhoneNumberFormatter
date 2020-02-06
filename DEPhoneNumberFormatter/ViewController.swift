import UIKit

class ViewController: UIViewController {
   
   @IBOutlet weak var textField: DEPhoneNumberTextField?
   
   // MARK: -
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      textField?.setup()
      performPhoneNumberFormatterTest()
   }
   
   // MARK: -
   
   private func performPhoneNumberFormatterTest() {
      let phoneNumberFormatter = DEPhoneNumberFormatter()
      print(phoneNumberFormatter.formattedPhoneNumber("1"))
      print(phoneNumberFormatter.formattedPhoneNumber("12"))
      print(phoneNumberFormatter.formattedPhoneNumber("123"))
      print(phoneNumberFormatter.formattedPhoneNumber("1234"))
      print(phoneNumberFormatter.formattedPhoneNumber("12345"))
      print(phoneNumberFormatter.formattedPhoneNumber("123456"))
      print(phoneNumberFormatter.formattedPhoneNumber("1234567"))
      print(phoneNumberFormatter.formattedPhoneNumber("12345678"))
      print(phoneNumberFormatter.formattedPhoneNumber("123456789"))
      print(phoneNumberFormatter.formattedPhoneNumber("1234567890"))
   }
}
