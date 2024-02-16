//
//  CommunityView.swift
//  A20
//
//  Created by 드즈 on 2/13/24.
//

import SwiftUI

struct CommunityView: View {
    @State private var index = 0
    
    @State private var searchText: String = ""
    
    @StateObject var communityViewModel: CommunityViewModel = CommunityViewModel(postDataString: Posts(posts: [PostElement(id: "", title: "", content: "", district: "", area: "", imageUrl: "", tag: "", userId: "", userName: "")]), writeDataString: WritePost(newPost: PostElement(id: "", title: "", content: "", district: "", area: "", imageUrl: "", tag: "", userId: "", userName: "")))
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .frame(width: 331, height: 48)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                HStack(spacing: 10) {
                    Image("Search")
                        .resizable()
                        .frame(width: 24, height: 24)
                    TextField("구 단위로 검색해주세요!", text: $searchText)
                        .frame(width: 253, height: 24)
                        .onSubmit {
                            communityViewModel.communityDistrict = searchText
                            Task {
                                do {
                                    try await communityViewModel.districtPost()
                                } catch {
                                    print("Error fetching data: \(error)")
                                }
                            }
                        }
                }
            }
            .padding(.bottom, 42)
            
            if index == 1 {
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(0..<communityViewModel.posts.posts.count, id: \.self) { index in
                            VStack {
                                HStack {
                                    ZStack {
                                        Image("OnSubmit")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 50, height: 50)
                                            .clipped()
                                            .cornerRadius(113.94936)
//                                        VStack {
//                                            Spacer()
//                                            HStack {
//                                                Spacer()
//                                                ZStack {
//                                                    Circle()
//                                                        .frame(width: 20, height: 20)
//                                                        .foregroundColor(Color(red: 1, green: 0.77, blue: 0.16))
//                                                    Text("5.0")
//                                                        .font(
//                                                            Font.custom("PretendardVariable", size: 8.56)
//                                                                .weight(.semibold)
//                                                        )
//                                                        .multilineTextAlignment(.center)
//                                                        .foregroundColor(.white)
//                                                        .frame(width: 15, height: 15)
//                                                }
//                                            }
//                                        }
//                                        .frame(width: 50, height: 50)
                                    }
                                    .padding(.trailing, 20)
                                    VStack(alignment: .leading) {
                                        Text("\(communityViewModel.posts.posts[index].userName)")
                                            .font(Font.custom("PretendardVariable", size: 15))
                                    }
                                    Spacer()
                                }
                                HStack {
//                                    Text("제목")
                                    Text("\(communityViewModel.posts.posts[index].title)")
                                        .font(
                                            Font.custom("PretendardVariable", size: 15)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                .padding(.top, 25)
                                
                                HStack {
                                    Image("Location")
                                        .frame(width: 25, height: 25)
//                                    Text("대전시 중구")
                                    Text("대전시 \(communityViewModel.posts.posts[index].district) \(communityViewModel.posts.posts[index].area)")
                                        .font(Font.custom("PretendardVariable", size: 14))
                                        .foregroundColor(Color(red: 0.37, green: 0.37, blue: 0.37))
                                    Spacer()
                                }
                                .padding(.bottom, 15)
                                
                                HStack {
//                                    Text("content")
                                    Text("\(communityViewModel.posts.posts[index].content)")
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                }
                                .padding(.bottom, 15)
                            }
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.9 /* 325 */)
                .overlay {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            NavigationLink {
                                WriteView()
                            } label: {
                                ZStack {
                                    Circle()
                                        .frame(width: 44, height: 44)
                                        .foregroundColor(.white)
                                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    Image("write")
                                        .frame(width: 24, height: 24)
                                }
                            }
                            .padding(.vertical, 25)
                            .padding(.horizontal, 25)
                        }
                        HStack(spacing: 0) {
                            HStack{
                                Text("신고 내용")
                                    .font(
                                        Font.custom("PretendardVariable", size: 16)
                                            .weight(.semibold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(self.index == 0 ? .white : Color.mainColor)
                                
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                            .background((Color.mainColor).opacity(self.index == 0 ? 1 : 0))
                            .clipShape(Capsule())
                            .onTapGesture {
                                self.index = 0
                            }
                            
                            HStack {
                                Text("주차장 후기")
                                    .font(
                                        Font.custom("PretendardVariable", size: 16)
                                            .weight(.semibold)
                                    )
                                    .foregroundColor(self.index == 1 ? .white : Color.mainColor)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                            .background((Color.mainColor).opacity(self.index == 1 ? 1 : 0))
                            .clipShape(Capsule())
                            .onTapGesture {
                                self.index = 1
                            }
                        }
                        .padding(3)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    }
                    .padding(.bottom)
                }
                //            .toolbarBackground(Color.white, for: .navigationBar)
                //            .navigationBarBackButtonHidden(true)
                //            .navigationBarItems(leading: BackButton())
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("커뮤니티")
                            .font(
                                Font.custom("PretendardVariable", size: 16)
                                    .weight(.bold)
                            )
                    }
                }
            } else {
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(0..<communityViewModel.posts.posts.count, id: \.self) { index in
                            VStack {
                                HStack {
                                    ZStack {
                                       
    //                                    VStack {
    //                                        Spacer()
    //                                        HStack {
    //                                            Spacer()
    //                                            ZStack {
    //                                                Circle()
    //                                                    .frame(width: 20, height: 20)
    //                                                    .foregroundColor(Color(red: 1, green: 0.77, blue: 0.16))
    //                                                Text("5.0")
    //                                                    .font(
    //                                                        Font.custom("Pretendard Variable", size: 8.56)
    //                                                            .weight(.semibold)
    //                                                    )
    //                                                    .multilineTextAlignment(.center)
    //                                                    .foregroundColor(.white)
    //                                                    .frame(width: 15, height: 15)
    //                                            }
    //                                        }
    //                                    }
    //                                    .frame(width: 50, height: 50)
                                    }
                                    .padding(.trailing, 20)
                                    VStack(alignment: .leading) {
//                                        Text("홍길동")
                                        Text("\(communityViewModel.posts.posts[index].userName)")
                                            .font(Font.custom("PretendardVariable", size: 15))
                                    }
                                    Spacer()
                                }
                                .padding(.bottom, 20)
                                
                                HStack {
//                                    Text("Content")
                                    Text("\(communityViewModel.posts.posts[index].content)")
                                        .font(Font.custom("Pretendard Variable", size: 15))
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                }
                                .padding(.bottom, 30)
                            }
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.9 /* 325 */)
                .overlay {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            NavigationLink {
                                WriteView()
                            } label: {
                                ZStack {
                                    Circle()
                                        .frame(width: 44, height: 44)
                                        .foregroundColor(.white)
                                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    Image("write")
                                        .frame(width: 24, height: 24)
                                }
                            }
                            .padding(.vertical, 25)
                            .padding(.horizontal, 25)
                        }
                        HStack(spacing: 0) {
                            HStack{
                                Text("신고 내용")
                                    .font(
                                        Font.custom("PretendardVariable", size: 16)
                                            .weight(.semibold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(self.index == 0 ? .white : Color.mainColor)
                                
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                            .background((Color.mainColor).opacity(self.index == 0 ? 1 : 0))
                            .clipShape(Capsule())
                            .onTapGesture {
                                self.index = 0
                                communityViewModel.communityTag = "신고"
                                Task {
                                    do {
                                        try await communityViewModel.tagPost()
                                    } catch {
                                        print("Error fetching data: \(error)")
                                    }
                                }
                            }
                            
                            HStack {
                                Text("주차장 후기")
                                    .font(
                                        Font.custom("PretendardVariable", size: 16)
                                            .weight(.semibold)
                                    )
                                    .foregroundColor(self.index == 1 ? .white : Color.mainColor)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                            .background((Color.mainColor).opacity(self.index == 1 ? 1 : 0))
                            .clipShape(Capsule())
                            .onTapGesture {
                                self.index = 1
                                communityViewModel.communityTag = "피드백"
                                Task {
                                    do {
                                        try await communityViewModel.tagPost()
                                    } catch {
                                        print("Error fetching data: \(error)")
                                    }
                                }
                            }
                        }
                        .padding(3)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    }
                    .padding(.bottom)
                }
                //            .toolbarBackground(Color.white, for: .navigationBar)
                //            .navigationBarBackButtonHidden(true)
                //            .navigationBarItems(leading: BackButton())
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("커뮤니티")
                            .font(
                                Font.custom("PretendardVariable", size: 16)
                                    .weight(.bold)
                            )
                    }
                }
            }
        }
    }
}

#Preview {
    CommunityView()
}
