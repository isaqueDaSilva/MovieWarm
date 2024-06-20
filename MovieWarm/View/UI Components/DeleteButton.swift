//
//  DeleteButton.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 18/06/24.
//

import SwiftUI

struct DeleteButton: View {
    var titleHidden: Bool
    var action: () -> Void
    
    var body: some View {
        Button(role: .destructive) {
            withAnimation(.spring.delay(0.65)) {
                action()
            }
        } label: {
            Label(
                titleHidden ? "" : "Delete Book",
                systemImage: Icons.trash.rawValue
            )
        }
    }
}

#Preview {
    VStack {
        DeleteButton(titleHidden: false) { }
            .padding()
        
        DeleteButton(titleHidden: true) { }
    }
}
