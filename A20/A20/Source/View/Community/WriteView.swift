//
//  WriteView.swift
//  A20
//
//  Created by 드즈 on 2/14/24.
//

import SwiftUI

struct WriteView: View {
    @State private var writeContent: String = ""
    @State private var writeTitle: String = ""
    @State private var tag: Bool = false
//    @State private var nine:
//    @State private var dong:
    
    @State private var showImageSheet: Bool = false
    @State private var image = UIImage()
    
    @State private var selectedImages: [UIImage] = []
    @State private var isImagePickerPresented: Bool = false
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    @EnvironmentObject var communityViewModel: CommunityViewModel
    
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HStack {
                    Text("신고 목적")
                      .font(
                        Font.custom("PretendardVariable", size: 16)
                          .weight(.medium)
                      )
                      .foregroundColor(.black)
                    Spacer()
                }
                
                HStack {
                    Text("사진")
                      .font(
                        Font.custom("PretendardVariable", size: 16)
                          .weight(.medium)
                      )
                      .foregroundColor(.black)
                    Spacer()
                }
                .frame(width: 331)
                
                ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 331, height: 80)
                            .background(Color(red: 0.92, green: 0.92, blue: 0.92))
                            .cornerRadius(8)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            Button {
                                isImagePickerPresented.toggle()
                            } label: {
                                ZStack {                  Rectangle()
                                        .frame(width: 58, height: 58)
                                        .foregroundColor(.text)
                                        .cornerRadius(12)
                                    Image("camera")
                                }
                                .padding(10)
                            }
                            .sheet(isPresented: $isImagePickerPresented) {
                                ImagePicker(selectedImages: $selectedImages, isImagePickerPresented: $isImagePickerPresented)
                            }
                            ForEach(selectedImages.indices, id: \.self) { index in
                                
                                ZStack {
                                    Image(uiImage: selectedImages[index])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 58, height: 58)
                                    VStack {
                                        HStack {
                                            Spacer()
                                            Button {
                                                selectedImages.remove(at: index)
                                            } label: {
                                                ZStack {
                                                    Circle()
                                                        .frame(width: 18, height: 18)
                                                        .foregroundColor(.white)
                                                    Image(systemName: "xmark")
                                                        .resizable()
                                                        .frame(width: 10, height: 10)
                                                        .foregroundColor(.black)
                                                }
                                            }
                                        }
                                        Spacer()
                                    }
                                    .frame(width: 58, height: 58)
                                        
                                }
                            }
                        }
                    }
                    
//                    Spacer()
                    
//                    HStack {
//                        Button {
//                            showImageSheet = true
//                        } label: {
//                            ZStack {
//                                Rectangle()
//                                    .frame(width: 58, height: 58)
//                                    .foregroundColor(.text)
//                                    .cornerRadius(12)
//                                Image("camera")
//                            }
//                            .padding(10)
//                        }
//                            VStack(alignment: .leading, spacing: 10) {
//                                Text("TIP")
//                                    .font(
//                                        Font.custom("Pretendard Variable", size: 14)
//                                            .weight(.medium)
//                                    )
//                                    .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
//                                Text("최대 10장까지 첨부가 가능해요!")
//                                    .font(
//                                        Font.custom("Pretendard Variable", size: 12)
//                                            .weight(.medium)
//                                    )
//                                    .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
//                            }
//                            Spacer()
//
//                    }
                }
                
                HStack {
                    Text("게시물 작성")
                      .font(
                        Font.custom("PretendardVariable", size: 16)
                          .weight(.medium)
                      )
                      .foregroundColor(.black)
                    Spacer()
                }
                .frame(width: 331)
                
                ZStack {
                    TextField("제목을 입력해주세요", text: $writeTitle)
                        .frame(width: 331, alignment: .topLeading)
                            .padding(18)
                            .background(
                                Color.textField
                                    .frame(width: 331, height: 56)
                                    .cornerRadius(8)
                            )
//                    TextField("제목을 입력해주세요", text: $writeTitle)
//                        .frame(width: 284, height: 18, alignment: .leading)
//                        .background(
//                            Color.textField
//                                .frame(width: 331, height: 56)
//                                .cornerRadius(8)
//                        )
                }
                .padding(.bottom, 25)
                
                ZStack {
                    TextField("게시판 내용을 입력해주세요", text: $writeContent)
                        .frame(width: 331, alignment: .topLeading)
                            .padding(18)
                            .background(
                                Color.textField
                                    .frame(width: 331, height: 241)
                                    .cornerRadius(8)
                            )
                }
                .padding(.top, 50)
                
            }
            .frame(width: 331)
//            .sheet(isPresented: $showImageSheet) {
//                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
//            }
            //            .toolbarBackground(Color.white, for: .navigationBar)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton(), trailing:
                                    Button {
                communityViewModel.token = loginViewModel.token
                communityViewModel.email = loginViewModel.email
                communityViewModel.title = self.writeTitle
                communityViewModel.content = self.writeContent
//                communityViewModel.nine = self.
//                communityViewModel.dong = self.
//                communityViewModel.tag = self.tag ? "신고" : "피드백"
                
                Task {
                    do {
                        try await communityViewModel.writePost()
                    } catch {
                        print("Error fetching data: \(error)")
                    }
                }
                                    } label: {
                                        Text("저장하기")
                                          .font(
                                            Font.custom("PretendardVariable", size: 16)
                                              .weight(.bold)
                                          )
                                          .foregroundColor(Color(red: 0.12, green: 0.14, blue: 0.17))
                                    })
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("글쓰기")
                        .font(
                            Font.custom("PretendardVariable", size: 16)
                                .weight(.bold)
                        )
                }
            }
        }
    }
        
}

#Preview {
    WriteView()
}
