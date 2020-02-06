import UIKit

class DEPhoneNumberTextField: UITextField {
   
   private var shouldFormatPhoneNumber: Bool = true
   
   private weak var hiddenDelegate: UITextFieldDelegate?
   
   var phoneNumberFormatter = DEPhoneNumberFormatter()
   
   override var delegate: UITextFieldDelegate? {
      didSet {
         if delegate?.isKind(of: DEPhoneNumberTextField.self) == false {
            hiddenDelegate = delegate
            delegate = self
         }
      }
   }
   
   // MARK: -
   
   @objc private func textFieldEditingChanged(_ textField: UITextField) {
      if shouldFormatPhoneNumber {
         let formattedText = phoneNumberFormatter.formattedPhoneNumber(textField.text ?? "")
         if !formattedText.isEmpty {
            textField.text = formattedText
         }
      } else if textField.text?.isEmpty == true {
         shouldFormatPhoneNumber = true
      }
   }
   
   // MARK: -
   
   func setup() {
      addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
   }
}

extension DEPhoneNumberTextField: UITextFieldDelegate {
   
   func textFieldDidBeginEditing(_ textField: UITextField) {
      shouldFormatPhoneNumber = false
      
      guard let text = textField.text else {
         return
      }
      
      if text.isNumberOrEmpty() {
         shouldFormatPhoneNumber = true
      }
   }
   
   func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      if shouldFormatPhoneNumber {
         if !string.isNumberOrEmpty() {
            shouldFormatPhoneNumber = false
         }
      }
      
      return true
   }
   
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      return hiddenDelegate?.textFieldShouldReturn?(textField) ?? false
   }
}
