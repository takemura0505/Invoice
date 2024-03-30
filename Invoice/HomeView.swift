//
//  HomeView.swift
//  Invoice
//
//  Created by 竹村はるうみ on 2024/03/28.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = InvoiceViewModel(context: PersistenceController.shared.container.viewContext)
    
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
        List {
            ForEach(viewModel.invoicesData.indices, id: \.self) { index in
                NavigationLink(destination: InvoiceView()) {
                let invoice = viewModel.invoicesData[index]
                    VStack(alignment: .leading) {
                        Text(invoice.partner ?? "")
                            .font(.title3.bold())
                        Text(invoice.subject ?? "")
                            .font(.body)
                        Text(invoice.paymentDue?.lowercased() ?? "")
                            .font(.body)
                    }
                }
            }
            .onDelete(perform: deleteItem)
        }
    }
    
    private var plusButton: some View {
        Button(action: {
            viewModel.addInvoice()
        }) {
            Image(systemName: "plus")
        }
    }
    
    private func deleteItem(at offsets: IndexSet) {
        viewModel.deleteInvoices(at: offsets)
    }
    
}
