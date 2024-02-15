//
//  ChatBotView.swift
//  A20
//
//  Created by 드즈 on 2/13/24.
//

import SwiftUI

struct ChatBotView: View {
    
    // MARK: .linelimit 을 통해 요청을 최대 한 줄로
    @State private var answer: String = ""
    
    var array: [String] = ["1", "2", "3","4", "5", "6","7", "8", "9","10", "11", "12","13", "14", "15", "16", "17", "18", "19", "20", ]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
//                Text("2월 13일")
//                    .font(Font.custom("Pretendard Variable", size: 12))
//                    .multilineTextAlignment(.center)
//                    .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.17))
//                    .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 230, alignment: .bottom)
                LazyVStack {
                    ForEach(array, id: \.self) { content in
                        ZStack {
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width * 0.9 , height: UIScreen.main.bounds.height * 0.075)
                            Text(content)
                        }
                    }
                }
            }
            .padding(.top, UIScreen.main.bounds.width * 0.125) // .padding(.top, 50)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.75)
            .background(Color.background)
            VStack {
//                Spacer(minLength: 0)
                HStack(alignment: .center, spacing: 10) {
                    Image("Clip")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                    TextField("메시지를 입력해주세요.", text: $answer)
                        .font(
                            Font.custom("Pretendard Variable", size: 16))
                        .onSubmit {
                            // return
                        }
                    Button {
                        
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(.mainColor)
                                .frame(width: 36, height: 36, alignment: .center)
                            Image(systemName: "arrow.right")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .frame(width: UIScreen.main.bounds.width * 0.9 /*342*/, height: 52, alignment: .center)
                .background(Color.Gray) // MARK: Color?
                .cornerRadius(30)
            }
//            .toolbarBackground(Color.white, for: .navigationBar)
//            .navigationBarBackButtonHidden(true)
//            .navigationBarItems(leading: BackButton())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("챗봇")
                        .font(
                            Font.custom("Pretendard", size: 16)
                                .weight(.bold)
                        )
                }
            }
            .padding(.bottom, UIScreen.main.bounds.width * 0.1)
        }
    }
}

#Preview {
    ChatBotView()
}
