//
//  ContentView.swift
//  Side menu inSwiftUi
//
//  Created by Mohamed Salman on 27/09/20.
//  Copyright © 2020 Smilepls. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    @State var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var width = UIScreen.main.bounds.width
    @State var show = false
    @State var selectedIndex = ""

    var body: some View {
        ZStack{
            VStack {
                ZStack {
                    HStack {
                        Button(action: {
                            withAnimation(.spring()){self.show.toggle()}
                        }, label: {
                            Image(systemName: "line.horizantal.3")
                                .font(.system(size: 22))
                                .foregroundColor(.black)
                        })
                        Spacer(minLength: 0)

                        Button(action: {
                            withAnimation(.spring()){self.show.toggle()}
                        }, label: {
                            Image("pic")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 35, height: 35)
                                .clipShape(Circle())
                        })
                    }
                    Text("Home")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .padding()
                .padding(.top,edges!.top)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)

                Spacer(minLength: 0)
                    Text(selectedIndex)
                Spacer(minLength: 0)
            }
    // side menu
            HStack(spacing: 0) {
                Spacer(minLength: 0)
                VStack {
                    HStack {
                        Spacer(minLength: 0)
                        Button(action: {
                            withAnimation(.spring()){self.show.toggle()}
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.white)
                        })
                    }

                    .padding()
                    .padding(.top,edges!.top)

                    HStack(spacing: 15) {
                        Image("pic")
                        .resizable()
                        .frame(width: 75, height: 75)
                        .clipShape(Circle())

                        VStack(alignment: .leading,spacing: 5, content: {
                            Text("Salman")
                                .font(.title)
                                .fontWeight(.semibold)
                            Text("mohamedsalman@sparkouttech.com")
                                .fontWeight(.semibold)
                        })
                            .foregroundColor(.white)
                            Spacer(minLength: 0)
                    }

                    .padding(.horizontal)
            // menu Buttons....
                    VStack(alignment: .leading, content: {
                        MenuButton(image: "cart", title: "My Orders",selected: $selectedIndex,show: $show)
                        MenuButton(image: "person", title: "My Profile",selected: $selectedIndex,show: $show)
                        MenuButton(image: "mappin", title: "Delivery Address",selected: $selectedIndex,show: $show)
                        MenuButton(image: "creditcard", title: "Payment Methods",selected: $selectedIndex,show: $show)
                        MenuButton(image: "envelope", title: "Contact Us",selected: $selectedIndex,show: $show)
                        MenuButton(image: "gear", title: "Settings",selected: $selectedIndex,show: $show)
                        MenuButton(image: "info.circle", title: "Help & FAQs",selected: $selectedIndex,show: $show)
                    })
                        .padding(.top)
                        .padding(.leading,45)

                    Spacer(minLength: 0)
                }

                .frame(width: width - 100)
                .background(Color("bg"))
                .offset(x: show ? 0: width - 100)
            }

            .background(Color.black.opacity(show ? 0.3 : 0))
        }

        .edgesIgnoringSafeArea(.all)
    }
}

struct MenuButton: View {
    var image: String
    var title: String
    @Binding var selected: String
    @Binding var show: Bool

    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                self.selected = self.title
                self.show.toggle()
            }
        }, label: {
            HStack(spacing: 15) {
                Image(systemName: image)
                    .font(.system(size: 22))
                    .frame(width: 25, height: 25)
                Text(title)
                    .font(.body)
                    .fontWeight(.semibold)
            }
            .padding(.vertical)
            .padding(.trailing)
        })
            .padding(.top,5)
            .foregroundColor(.white)
    }
}
