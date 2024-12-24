//
//  TestDate.swift
//  Collection_
//
//  Created by Arnaud Hayon on 20/12/2024.
//

import SwiftUI

struct FormatStyle: View {
    let birthday = Date()
    let currentDate = Date()
    
    var body: some View {
        
        Text(birthday.formatted(date: .numeric, time: .omitted)) // Sunday, January 17, 2021
        Text(currentDate, format: Date.FormatStyle().year())
        
    }}

#Preview {
    FormatStyle()
}
