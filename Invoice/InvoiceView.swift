//
//  InvoiceView.swift
//  Invoice
//
//  Created by 竹村はるうみ on 2024/03/30.
//

import SwiftUI

struct InvoiceView: View {
    
    var body: some View {
        ScrollView {
            invoiceSheet
        }
    }
    
}

#Preview {
    InvoiceView()
}

extension InvoiceView {
    
    private var invoiceSheet: some View {
        GeometryReader { geometry in
            let width = geometry.size.width - 20
            let height = width * sqrt(2)
            
            Rectangle()
                .fill(Color.white)
                .frame(width: width, height: height)
                .shadow(radius: 2)
                .border(Color.gray, width: 1)
                .padding(.horizontal, 10)
        }
        .background(Color.gray.opacity(0.2))
        .edgesIgnoringSafeArea(.all)
    }
    
}
