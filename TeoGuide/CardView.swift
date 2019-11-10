//
//  CardView.swift
//  TeoGuide
//
//  Created by Developer on 11/6/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var subtitle: String
    var title: String
    var backgroundImage: Image
    var briefSummary: String
    var description: String
    
    @State var isShowDetail = false
    
    var body: some View {
        VStack(spacing: 0) {
            TopBriefView(subtitle: self.subtitle, title: self.title, backgroundImage: self.backgroundImage, briefSummary: self.briefSummary, isShowDetail: $isShowDetail)
            
            ScrollView(.vertical, showsIndicators: true) {
                Text(self.description)
                    .font(.body)
                    .foregroundColor(.white)
                    .frame(idealHeight: .leastNonzeroMagnitude)
                    .padding()
                    .background(Color(.black))
            }
            .frame(height: isShowDetail ? nil : 0)
            .animation(.default)
        }.onTapGesture {
            self.isShowDetail.toggle()
        }
        .padding(isShowDetail ? .zero : 10)
        .frame(width: isShowDetail ? UIScreen.main.bounds.width : nil)
        .animation(.default)
        .edgesIgnoringSafeArea(.top)
    }
}

struct TopBriefView: View {
    var subtitle: String
    var title: String
    var backgroundImage: Image
    var briefSummary: String
    
    @Binding var isShowDetail: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                VStack(alignment: .leading) {
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .lineLimit(3)
                
                Spacer()
            }
            
            HStack(alignment: .center) {
                Text(briefSummary)
                    .foregroundColor(.white)
                    .font(.caption)
                    .lineLimit(3)
                Spacer()
            }
        }
        .padding()
        .frame(height: isShowDetail ? UIScreen.main.bounds.height * 0.25 : 420)
        .background(
                backgroundImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
        )
        .cornerRadius(isShowDetail ? 0 : 20)
        .animation(.default)
    }
}

