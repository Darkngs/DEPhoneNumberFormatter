# **DEPhoneNumberFormatter**

## Example
```swift
 // NANP countries
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
```
##### Output
```
(1
(12
(123
(123) 4
(123) 45
(123) 456
(123) 456-7
(123) 456-78
(123) 456-789
(123) 456-7890
```