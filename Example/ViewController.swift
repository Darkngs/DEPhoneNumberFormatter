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
      print(phoneNumberFormatter.number(from: "1"))
      print(phoneNumberFormatter.number(from: "12"))
      print(phoneNumberFormatter.number(from: "123"))
      print(phoneNumberFormatter.number(from: "1234"))
      print(phoneNumberFormatter.number(from: "12345"))
      print(phoneNumberFormatter.number(from: "123456"))
      print(phoneNumberFormatter.number(from: "1234567"))
      print(phoneNumberFormatter.number(from: "12345678"))
      print(phoneNumberFormatter.number(from: "123456789"))
      print(phoneNumberFormatter.number(from: "1234567890"))
   }
}
