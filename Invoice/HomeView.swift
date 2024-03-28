//
//  HomeView.swift
//  Invoice
//
//  Created by 竹村はるうみ on 2024/03/28.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = InvoiceViewModel(context: PersistenceController.shared.container.viewContext)
    @State var invoices: [Invoice] = []
    
    var body: some View {
        NavigationView {
            VStack {
                listView
            }
            .navigationBarItems(trailing: plusButton)
        }
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
    
    private var plusButton: some View {
        Button(action: {
            
        }) {
            Image(systemName: "plus")
        }
    }
    
}
