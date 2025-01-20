//
//  StyledButton.swift
//  Collection_
//
//  Created by Arnaud Hayon on 17/12/2024.
//

import SwiftUI

struct StyledGenericButton: View {
    
    enum ButtonType {
        case plus
        case save
        case text(value: String)
    }
    
    let type: ButtonType
    let caption: String?
    
    internal init(type: StyledGenericButton.ButtonType, caption: String? = nil) {
        self.type = type
        self.caption = caption
    }
    
    var buttonLabel: String {
        switch type {
        case .plus: return "+"
        case .save: return "Sauvegarder"
        case .text(let value): return value
        }
    }
    
    struct BlueButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(width: 300, height: 50)
                .padding()
                .background(Color(red: 0, green: 0, blue: 0.6), in: RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(.white)
        }
    }
    
    struct RedButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(width: 300, height: 50)
                .padding()
                .background(Color(red: 0.6, green: 0, blue: 0), in: RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(.white)
        }
    }
    
    var body: some View {
        VStack {
            Button(buttonLabel) {
                print("Bouton")
            }
            .buttonStyle(BlueButton())
            
            if let caption {
                Text(caption)
            }
        }
        .padding()
        .font(.system(size: 26, weight: .medium, design: .default))
        .fontWeight(.heavy)
        
    }
}
#Preview {
    VStack {
        StyledGenericButton(type: .plus)
        StyledGenericButton(type: .save)
        StyledGenericButton(type: .plus, caption: "Ajouter une collection")
        StyledGenericButton(type: .text(value: "Ajouter une collection"))
    }
}
// - appropriation de l'env (orga, fichier, nommage...)
// - découpage composants (bouttons, collections cells, champs...)
// - écran coordinateur qui mene vers tous tes autres écrans de manière à pouvoir développer des écrans indépendants de leur logique => Focus UI
// - développer la navigation et la logique des écrans (view models, appels API, base de donnée) par écran

