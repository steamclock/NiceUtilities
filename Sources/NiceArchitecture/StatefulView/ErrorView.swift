//
//  ErrorView.swift
//  NiceArchitecture
//
//  Created by Brendan on 2022-09-13.
//  Copyright © 2023 Steamclock Software. All rights reserved.

import NiceComponents
import SwiftUI

public struct ErrorView: View {
    private let error: Error

    public init(error: Error) {
        self.error = error
    }

    public var body: some View {
        VStack(alignment: .center) {
            if let error = error as? DisplayableError {
                Text(error.title)
                Text(error.message)
            } else {
                BodyText("Error:")
                BodyText(error.localizedDescription)
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: CustomError())
    }
}

private struct CustomError: Error {
    var description: String {
        "Something's gone wrong. Try again later."
    }
}