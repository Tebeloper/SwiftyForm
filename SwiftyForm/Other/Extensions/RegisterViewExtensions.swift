//
//  TextFieldExtension.swift
//  SwiftyForm
//
//  Created by Dimitrios Gkarlemos on 31/05/2023.
//

import Foundation
import SwiftUI

extension TextField {
    func styleRegisterViewTextField() -> some View {
        self
            .padding()
            .frame(width: 300)
            .background(Color.white.opacity(0.1))
            .cornerRadius(10)
            .autocorrectionDisabled()
            .autocapitalization(.none)
    }
}

extension SecureField {
    func styleRegisterViewSecureField() -> some View {
        self
            .padding()
            .frame(width: 300)
            .background(Color.white.opacity(0.1))
            .cornerRadius(10)
            .autocorrectionDisabled()
            .autocapitalization(.none)
    }
}
