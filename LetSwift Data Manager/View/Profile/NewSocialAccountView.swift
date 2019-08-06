//
//  NewSocialAccountView.swift
//  LetSwift Data Manager
//
//  Created by BumMo Koo on 04/08/2019.
//  Copyright © 2019 Cleanios. All rights reserved.
//

import SwiftUI

struct NewSocialAccountView: View {
    @State private var socialAccount = ""
    @State private var url = ""
    
    @Binding var presentNew: Bool
    private var isFormValid: Bool {
        if socialAccount != "" && url != "" { return true }
        else { return false }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Service", selection: $socialAccount) {
                    List {
                        ForEach(SocialAccount.Service.allCases) { service in
                            Text(service.name)
                        }
                    }
                }
                TextField("URL", text: $url)
            }
            .navigationBarTitle("New Social Account")
            .navigationBarItems(leading:
                Button(action: save, label: {
                    Text("Cancel")
                })
                , trailing:
                Button(action: cancel, label: {
                    Text("Save")
                })
                .disabled(!isFormValid)
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    // MARK: - Action
    private func newSocialAccount() {
        
    }
    
    private func save() {
        presentNew.toggle()
    }
    
    private func cancel() {
        presentNew.toggle()
    }
}

#if DEBUG
struct NewSocialAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NewSocialAccountView(presentNew: .constant(true))
    }
}
#endif
