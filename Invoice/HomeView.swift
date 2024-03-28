//
//  HomeView.swift
//  Invoice
//
//  Created by 竹村はるうみ on 2024/03/28.
//

import SwiftUI

struct HomeView: View {
    
    @State var invoices: [Invoice] = []
    
    var body: some View {
        listView
    }
    
}

#Preview {
    HomeView()
}

extension HomeView {
    
    private var listView: some View {
        List(invoices, id: \.self) { invoice in
            VStack {
                Text(invoice.partner ?? "")
                Text(invoice.subject ?? "")
                Text(invoice.paymentDue?.lowercased() ?? "")
            }
        }
    }
    
}
