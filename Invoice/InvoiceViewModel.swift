//
//  InvoiceViewModel.swift
//  Invoice
//
//  Created by 竹村はるうみ on 2024/03/28.
//

import CoreData
import SwiftUI

class InvoiceViewModel: ObservableObject {
    
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
        newInvoice.partner = "取引先未入力"
        newInvoice.subject = "件名"
        newInvoice.paymentDue = "入金期日未定"
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
