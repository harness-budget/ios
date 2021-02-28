//
//  PhoneTextView.swift
//  Harness
//
//  Created by Charlie Welsh on 2/27/21.
//

import Foundation
import SwiftUI
import PhoneNumberKit

struct PhoneTextView: UIViewRepresentable {
	typealias UIViewControllerType = PhoneNumberTextField
	
    var textView = PhoneNumberTextField()
    
	public func makeUIView(context: Context) -> PhoneNumberTextField {
		textView.withFlag = true
		textView.withPrefix = true
		textView.withExamplePlaceholder = true
		textView.textContentType = UITextContentType.telephoneNumber
		textView.font = UIFont.preferredFont(forTextStyle: .title1)
		textView.sizeToFit()
		return textView
	}
	
	public func updateUIView(_ uiView: PhoneNumberTextField, context: Context) {
		// Update the view
	}
}
