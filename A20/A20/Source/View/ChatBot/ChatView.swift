//
//  ChatView.swift
//  A20
//
//  Created by 드즈 on 2/13/24.
//

import SwiftUI

struct ChatView: View {
    @StateObject var chatViewModel: ChatViewModel = ChatViewModel(chatDataString: ChatResponse(answer: ""))
    
    @State private var question: String = ""

    @State var chatList: [chatItem] = [
        // .linelimit / max 50자
        chatItem(question: "질문을 입력해주세요!.", answer: "제가 답변해드릴게요!"),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                Text("2월 16일")
                    .font(Font.custom("PretendardVariable", size: 12))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.17))
                    .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 230, alignment: .bottom)
                    .padding(.top, 25)
                LazyVStack {
                    ForEach(chatList.indices, id: \.self) { index in
                        HStack {
                            Spacer()
                            ZStack {
                                Text(chatList[index].question)
                                    .foregroundColor(.white)
                                    .font(Font.custom("PretendardVariable", size: 14))
                            }
                            .padding()
                            .background(Color.mainColor)
                            .cornerRadius(16)
//                            VStack(alignment: .trailing, spacing: 0) {
//                                Text(chatList[index].question)
//                                    .font(Font.custom("PretendardVariable", size: 14))
//                                    .foregroundColor(.white)
//                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center /*.trailing*/)
//                            }
//                            .padding(.horizontal, 16)
//                            .padding(.vertical, 12)
//                            .background(Color.mainColor)
//                            .cornerRadius(16)
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.9 , height: UIScreen.main.bounds.height * 0.075)
                        .padding(15)
                        
                        HStack {
                            ZStack {
                                Text(chatList[index].answer)
                                    .font(Font.custom("PretendardVariable", size: 14))
                                    .foregroundColor(.black)
                            }
                            .padding()
                            .background(Color.subColor)
                            .cornerRadius(16)
//                            VStack(alignment: .trailing, spacing: 0) {
//                                Text(chatList[index].answer)
//                                    .font(Font.custom("PretendardVariable", size: 14))
//                                    .foregroundColor(.white)
//                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center /*.trailing*/)
//                            }
//                            .padding(.horizontal, 16)
//                            .padding(.vertical, 12)
//                            .background(Color.subColor)
//                            .cornerRadius(16)
                            Spacer()
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.9 , height: UIScreen.main.bounds.height * 0.075)
                    }
                }
            }
            .padding(.top, UIScreen.main.bounds.width * 0.025)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.75)
            .background(Color.background)
            VStack {
//                Spacer(minLength: 0)
                HStack(alignment: .center, spacing: 10) {
                    Image("Clip")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                    TextField("메시지를 입력해주세요.", text: $question)
                        .font(
                            Font.custom("PretendardVariable", size: 16))
                        .onSubmit {
                            
                        }
                    Button {
                        Task {
                            do {
                                try await chatViewModel.ask()
                                chatList.append(chatItem(question: self.question, answer: chatViewModel.chat.answer))
                                self.question = ""
                            } catch {
                                print("Error fetching data: \(error)")
                            }
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(.mainColor)
                                .frame(width: 36, height: 36, alignment: .center)
                            Image(systemName: "arrow.right")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .frame(width: UIScreen.main.bounds.width * 0.9 /*342*/, height: 52, alignment: .center)
                .background(Color.Gray)
                .cornerRadius(30)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("챗봇")
                        .font(
                            Font.custom("PretendardVariable", size: 16)
                                .weight(.bold)
                        )
                }
            }
            .padding(.bottom, UIScreen.main.bounds.width * 0.1)
        }
    }
}

#Preview {
    ChatView()
}
