//
//  InvoiceView.swift
//  Invoice
//
//  Created by 竹村はるうみ on 2024/03/30.
//

import SwiftUI

struct InvoiceView: View {
    
    @State var billingDateTextField: String = ""
    @State var branchNoTextField: String = ""
    @State var breakdownTextField: String = ""
    @State var companySealTextField: String = ""
    @State var detailsTextField: String = ""
    @State var invoiceNoTextField: String = ""
    @State var logoTextField: String = ""
    @State var memoTextField: String = ""
    @State var partnerTextField: String = ""
    @State var paymentDueTextField: String = ""
    @State var paymentMethodTextField: String = ""
    @State var remarksTextField: String = ""
    @State var subjectTextField: String = ""
    @State var titleTextField: String = ""
    @State var subtotalTextField: String = ""
    @State var summaryTextField: String = ""
    @State var quantityTextField: String = ""
    @State var unitPriceTextField: String = ""
    
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
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: width, height: height)
                    .shadow(radius: 2)
                    .border(Color.gray, width: 1)
                VStack {
                    Text("請求書")
                        .font(.headline)
                        .padding(.top, 20)
                    
                    HStack {
                        partnerInfoView
                        Spacer()
                        invoiceInfoView
                    }
                    .padding(.trailing)
                    myInfoView
                    titleView
                    HStack {
                        price
                        Spacer()
                    }
                    .padding(.leading)
                    infoView
                    detailView
                    Spacer()
                    otherInfoView
                        .padding(.top)
                }
                .padding(.horizontal, 10)
            }
            .background(Color.gray.opacity(0.2))
            .edgesIgnoringSafeArea(.all)
        }
        
    }
    
    private var partnerInfoView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("株式会社 example 御中")
                    .font(.caption)
                    .padding(.top, 5)
                Text("000-0000")
                    .font(.system(size: 8))
                Text("住所")
                    .font(.system(size: 8))
            }
        }
        .padding(.leading)
        .padding(.trailing)
    }
    
    private var invoiceInfoView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("請求日")
                    .font(.system(size: 8))
                Text("請求書番号")
                    .font(.system(size: 8))
                Text("登録番号")
                    .font(.system(size: 8))
            }
            VStack(alignment: .trailing, spacing: 0) {
                TextField("請求日を入力", text: $billingDateTextField)
                    .multilineTextAlignment(.trailing)
                    .font(.system(size: 8))
                TextField("請求書番号を入力", text: $invoiceNoTextField)
                    .multilineTextAlignment(.trailing)
                    .font(.system(size: 8))
                TextField("登録番号を入力", text: $branchNoTextField)
                    .multilineTextAlignment(.trailing)
                    .font(.system(size: 8))
            }
        }
    }
    
    private var myInfoView: some View {
        HStack {
            Spacer()
            Circle()
                .frame(width: 30, height: 30)
            VStack(alignment: .leading) {
                Text("株式会社hogehoge")
                    .font(.caption)
                Text("000-0000")
                    .font(.system(size: 8))
                Text("住所")
                    .font(.system(size: 8))
            }
            Image(systemName: "square.fill")
                .resizable()
                .frame(width: 40, height: 40)
        }
        .padding(.trailing)
        .padding(.top)
    }
    
    private var titleView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("いつもお世話になっております。下記の通りご請求申し上げます")
                    .font(.system(size: 8))
                HStack {
                    Text("件名")
                        .font(.caption2)
                    TextField("件名を入力", text: $titleTextField)
                        .font(.caption2)
                }
            }
            Spacer()
        }
        .padding(.leading)
    }
    
    private var price: some View {
        VStack(spacing: -1) {
            HStack(spacing: -1) {
                ZStack {
                    Rectangle()
                        .frame(width: 75, height: 10)
                        .foregroundColor(.white)
                        .border(.black, width: 1)
                    Text("小計")
                        .foregroundColor(.black)
                }
                ZStack {
                    Rectangle()
                        .frame(width: 75, height: 10)
                        .foregroundColor(.white)
                        .border(.black, width: 1)
                    Text("消費税")
                        .foregroundColor(.black)
                }
                ZStack {
                    Rectangle()
                        .frame(width: 75, height: 10)
                        .foregroundColor(.white)
                        .border(.black, width: 1)
                    Text("請求金額")
                        .foregroundColor(.black)
                }
            }
            HStack(spacing: -1) {
                ZStack {
                    Rectangle()
                        .frame(width: 75, height: 15)
                        .foregroundColor(.white)
                        .border(.black, width: 1)
                    Text("100円")
                        .foregroundColor(.black)
                }
                ZStack {
                    Rectangle()
                        .frame(width: 75, height: 15)
                        .foregroundColor(.white)
                        .border(.black, width: 1)
                    Text("10円")
                        .foregroundColor(.black)
                }
                ZStack {
                    Rectangle()
                        .frame(width: 75, height: 15)
                        .foregroundColor(.white)
                        .border(.black, width: 1)
                    Text("110円")
                        .foregroundColor(.black)
                }
            }
        }
        .font(.system(size: 8))
    }
    
    private var infoView: some View {
        HStack {
            VStack(spacing: -1) {
                HStack(spacing: -1) {
                    ZStack {
                        Rectangle()
                            .frame(width: 112, height: 10)
                            .foregroundColor(.white)
                            .border(.black, width: 1)
                        Text("入金期日")
                            .foregroundColor(.black)
                    }
                    ZStack {
                        Rectangle()
                            .frame(width: 112, height: 10)
                            .foregroundColor(.white)
                            .border(.black, width: 1)
                        Text("振込先")
                            .foregroundColor(.black)
                    }
                }
                HStack(spacing: -1) {
                    ZStack {
                        Rectangle()
                            .frame(width: 112, height: 30)
                            .foregroundColor(.white)
                            .border(.black, width: 1)
                        TextField("2024-01-01", text: $paymentDueTextField)
                            .font(.system(size: 8))
                            .frame(width: 50)
                            .multilineTextAlignment(.center)
                    }
                    ZStack {
                        Rectangle()
                            .frame(width: 112, height: 30)
                            .foregroundColor(.white)
                            .border(.black, width: 1)
                        Text("架空銀行　架空支店\n普通 口座番号 0000000\n株式会社hogehoge")
                            .foregroundColor(.black)
                    }
                }
            }
            .font(.system(size: 8))
            Spacer()
        }
        .padding(.leading)
    }
    
    private var detailView: some View {
        GeometryReader { geometry in
            let width = geometry.size.width - 20
            VStack(spacing: -1) {
                HStack(spacing: -1) {
                    ZStack {
                        Rectangle()
                            .frame(width: width/2, height: 15)
                            .foregroundColor(.white)
                            .border(.black, width: 1)
                        Text("摘要")
                            .foregroundColor(.black)
                    }
                    ZStack {
                        Rectangle()
                            .frame(width: width/8, height: 15)
                            .foregroundColor(.white)
                            .border(.black, width: 1)
                        Text("数量")
                            .foregroundColor(.black)
                    }
                    ZStack {
                        Rectangle()
                            .frame(width: width/8, height: 15)
                            .foregroundColor(.white)
                            .border(.black, width: 1)
                        Text("単価")
                            .foregroundColor(.black)
                    }
                    ZStack {
                        Rectangle()
                            .frame(width: width/4, height: 15)
                            .foregroundColor(.white)
                            .border(.black, width: 1)
                        Text("明細金額")
                            .foregroundColor(.black)
                    }
                }
                .font(.system(size: 8))
                ForEach(0..<10) { index in
                    HStack(spacing: -1) {
                        ZStack {
                            Rectangle()
                                .frame(width: width/2, height: 15)
                                .foregroundColor(.white)
                                .border(.black, width: 1)
                            TextField("example", text: $summaryTextField)
                                .font(.system(size: 8))
                                .frame(width: 50)
                                .multilineTextAlignment(.center)
                        }
                        ZStack {
                            Rectangle()
                                .frame(width: width/8, height: 15)
                                .foregroundColor(.white)
                                .border(.black, width: 1)
                            TextField("1", text: $quantityTextField)
                                .font(.system(size: 8))
                                .frame(width: 40)
                                .multilineTextAlignment(.center)
                        }
                        ZStack {
                            Rectangle()
                                .frame(width: width/8, height: 15)
                                .foregroundColor(.white)
                                .border(.black, width: 1)
                            TextField("10円", text: $unitPriceTextField)
                                .font(.system(size: 8))
                                .frame(width: 30)
                                .multilineTextAlignment(.center)
                        }
                        ZStack {
                            Rectangle()
                                .frame(width: width/4, height: 15)
                                .foregroundColor(.white)
                                .border(.black, width: 1)
                            Text("10円")
                                .foregroundColor(.black)
                        }
                    }
                }
                .font(.system(size: 8))
            }
            .foregroundColor(.black)
        }
        .padding(.leading)
    }
    
    private var otherInfoView: some View {
        GeometryReader { geometry in
            let width = geometry.size.width - 20
            let height = width * sqrt(2)
            ZStack(alignment: .topLeading) {
                Rectangle()
                    .frame(height: height/10)
                    .foregroundColor(.white)
                    .border(.black, width: 1)
                HStack {
                    Text("備考")
                        .foregroundColor(.black)
                        .font(.system(size: 8))
                    TextField("備考を入力", text: $remarksTextField)
                        .font(.system(size: 8))
                        .frame(width: 50)
                        .multilineTextAlignment(.center)
                    Spacer()
                    HStack {
                        Text("内訳")
                            .foregroundColor(.black)
                            .font(.system(size: 8))
                        VStack(alignment: .leading) {
                            Text("10%対象(税抜)")
                                .foregroundColor(.black)
                                .font(.system(size: 8))
                            Text("10%消費税")
                                .foregroundColor(.black)
                                .font(.system(size: 8))
                        }
                        VStack(alignment: .leading) {
                            Text("100円")
                                .foregroundColor(.black)
                                .font(.system(size: 8))
                            Text("10円")
                                .foregroundColor(.black)
                                .font(.system(size: 8))
                        }
                    }
                    .padding(3)
                }
                .padding(3)
            }
        }
        .padding()
    }
    
}
