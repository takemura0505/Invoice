//
//  InvoiceApp.swift
//  Invoice
//
//  Created by 竹村はるうみ on 2024/03/27.
//

import SwiftUI

@main
struct InvoiceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
