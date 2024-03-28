//
//  InvoiceDataModel.swift
//  Invoice
//
//  Created by 竹村はるうみ on 2024/03/28.
//

import CoreData
import SwiftUI

class InvoiceDataModel: ObservableObject {
    
    private var context: NSManagedObjectContext
    @Published var invoicesData: [Invoice] = []
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchInvoices()
    }
    
    func addInvoice() {
        let newInvoice = Invoice(context: context)
        let id = UUID().uuidString
        // ここでデータを追加
        newInvoice.id = id
        do {
            try context.save()
            fetchInvoices()
        } catch {
            print(error)
        }
    }
    
    func fetchInvoices() {
        let request: NSFetchRequest<Invoice> = Invoice.fetchRequest()
        do {
            invoicesData = try context.fetch(request)
        } catch {
            invoicesData = []
            print(error)
        }
    }
    
}
