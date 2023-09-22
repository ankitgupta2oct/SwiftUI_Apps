//
//  SettingView.swift
//  Hike
//
//  Created by apple on 21/09/23.
//

import SwiftUI

struct SettingView: View {
    private let alternateAppIcons: [String] = [
      "AppIcon-MagnifyingGlass",
      "AppIcon-Map",
      "AppIcon-Mushroom",
      "AppIcon-Camera",
      "AppIcon-Backpack",
      "AppIcon-Campfire"
    ]
    
    var body: some View {
        List {
            // MARK: - Top section
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 88))
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editor' Choice")
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 88))
                    Spacer()
                }
                .foregroundStyle (
                    LinearGradient(colors: [.theme.greenLight, .theme.greenMedium, .theme.greenDark], startPoint: .top, endPoint: .bottom)
                )
                
                VStack(spacing: 8) {
                    Text("Where you can find \nperfect track")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                      .fontWeight(.heavy)
                      .foregroundColor(.theme.greenMedium)
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom)
                .multilineTextAlignment(.center)
            }
                .listRowSeparator(.hidden)
            
            //MARK: - App Icons
            Section {
                VStack(spacing: 20){
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10){
                            ForEach(alternateAppIcons, id: \.self) { item in
                                Button(action: {
                                    UIApplication.shared.setAlternateIconName(item) { error in
                                        if let error = error {
                                            print("Error while setting App icon \(error.localizedDescription)")
                                        } else {
                                            print("App icon updated successfully")
                                        }
                                    }
                                }, label: {
                                    Image("\(item)-Preview")
                                        .resizable()
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .frame(width: 80, height: 80)
                                })
                            }
                        }
                    }
                    
                    Text("Choose your favourite app icon from the collection above.")
                      .frame(maxWidth: .infinity)
                      .multilineTextAlignment(.center)
                      .foregroundColor(.secondary)
                      .font(.footnote)
                }
            } header: {
                Text("Alternative Icons")
            }

            
            //MARK: - About the app
            Section(content: {
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Ankit Gupta", rowTintColor: .mint)
                
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink)
                
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Google", rowLinkDestination: "https://www.google.com")
            }, header: {
                Text("About the app")
            }, footer: {
                HStack{
                    Spacer()
                    Text("Copyright © All right reserved.")
                    Spacer()
                }
            })
        }
    }
}

#Preview {
    SettingView()
}
