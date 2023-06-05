//
//  ContentView.swift
//  KnuMobileApp8
//
//  Created by Dean on 2023/05/03.
//

//
//  ContentView.swift
//  temproject
//
//  Created by seungunlee on 2023/05/08.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var info: DisplayModel
    var text = " 검색할  값"
    @State var searchKeyWord = ""
    @State var showingAlert = false
    @StateObject var mapController = MapController()

    var body: some View {
        
        VStack(alignment: .leading){
            
            
            TabView {
                NavigationView {
                    
                    VStack(alignment: .leading) {
                        //검색 창 시작
                        HStack {
                            
                            ZStack {
                                Rectangle()
                                    .frame(width: 364, height: 55)
                                    .foregroundColor(Color(UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)))
                                    .cornerRadius(14)
                                
                                
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .padding()
                                        .foregroundColor(.white)
                                        .frame(width: 40, height: 55)
                                    
                                    TextField("Search keyword", text: $searchKeyWord)
                                        .frame(width: 170, height: 55)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding()
                                    
                                    Button(action: {
                                        // 검색어를 저장하는 로직을 추가
                                        self.searchKeyWord = self.searchKeyWord.trimmingCharacters(in: .whitespacesAndNewlines)
                                        self.showingAlert = true
                                        
                                    }) {
                                        Text("검색")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(Color(UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)))
                                            .cornerRadius(15)
                                    }
                                    .padding()
                                    .alert(isPresented: $showingAlert) {
                                        Alert(
                                            title: Text("검색어 확인"),
                                            message: Text("당신이 검색한 키워드는 '\(searchKeyWord)'입니다."),
                                            dismissButton: .default(Text("확인"))
                                        )
                                    }
                                    Spacer()
                                    
                                    
                                }
                                
                            }
                            .padding(2)
                            Spacer()
                        }
                        .padding(.top, 64)
                        .padding(.leading, 18)
                        //검색창 끝
                        
                        
                        // 메인 메뉴 시작 검색 창은 고정.
                        ScrollView {
                            
                            // 메인 캐러우셀
                            
                            VStack (alignment: .leading){
                                Text("Near You")
                                    .font(.custom("Poppins-Bold", size: 30))
                                    .foregroundColor(Color(red: 0.05, green: 0.047, blue: 0.047))
                                    .kerning(-0.14)
                                
                                    .background(Color.white)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(info.displays) { display in
                                            NavigationLink(destination: SecondView(Data: display)) {
                                                MainCard1(data : display)
                                            }
                                            .buttonStyle(PlainButtonStyle())
                                        }
                                    }
                                }
                            }.padding(10)
                            
                            // 메인 캐러우셀 끝
                            
                            // 메인 캐러우셀
                            VStack (alignment: .leading){
                                Text("Matched Exhibition")
                                    .font(.custom("Poppins-Bold", size: 30))
                                    .foregroundColor(Color(red: 0.05, green: 0.047, blue: 0.047))
                                    .kerning(-0.14)
                                    .background(Color.white)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(info.displays) { display in
                                            NavigationLink(destination: ThirdView()) {
                                                MainCard1(data : display)
                                            }
                                            .buttonStyle(PlainButtonStyle())
                                        }
                                    }
                                }
                            }.padding(10)
                            // 메인 캐러우셀 끝
                            
                            
                            // 메인 기사 for문 시작
                            LazyVStack (alignment:.leading){
                                Text("Exhibition's in Daegu")
                                    .font(.custom("Poppins-Bold", size: 30))
                                    .foregroundColor(Color(red: 0.05, green: 0.047, blue: 0.047))
                                    .kerning(-0.14)
                                    .background(Color.white)
                                ForEach(info.displays) { display in
                                    DisplayRow(display: display)
                                }
                            }
                            .padding(10)
                            // 메인 기사 for문 끝
                            Spacer()
                            
                        }
                        
                        
                    }
                    .padding()
                    // 맨 아래 네비게이션 바 끝
                    
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Main")
                }
                
                MapView(mapController: mapController)
                    .tabItem {
                        Image(systemName: "map")
                        Text("Map")
                    }
                    .onSubmit(of: .search) {
                        mapController.search()
                    }
                
                DisplayListView()
                    .tabItem {
                        Image(systemName: "4.circle")
                        Text("Fourth")
                    }
                ThirdView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("User Info")
                    }
            }
            
            
            
            
        }
        
        
        
        
    }
    
    //상세 페이지
    struct SecondView: View {
        var Data : Display
        var body: some View {
            ScrollView{
                VStack (alignment: .leading){
                    Text(Data.subject)
                        .font(.custom("DMSans-Bold", size: 27))
                        .foregroundColor(Color.black)
                        .kerning(-1)
                        .lineSpacing(-18) // SwiftUI에서는 line spacing이 pt 단위로 이루어집니다. line height에 대한 설정은 없으므로 line spacing을 사용하여 유사한 효과를 얻을 수 있습니다.
                    
                        .background(Color.white)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .shadow(color: Color(red: 0.01, green: 0.125, blue: 0.174, opacity: 0.05), radius: 40, x: 0, y: 20)
                        .frame(height: 334)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round, dash: [10], dashPhase: 0))
                                .foregroundColor(.clear)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                    //                                Color(red: 0.01, green: 0.125, blue: 0.174, opacity: 0.05)
                                        .fill(Color.white)
                                        .shadow(color: Color(red: 0.01, green: 0.125, blue: 0.174, opacity: 0.05), radius: 40, x: 0, y: 20)
                                        .overlay(
                                            // Image
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width:  300, height: 300)
                                                .foregroundColor(.gray)
                                        )
                                )
                        )
                    
                    //                HStack {
                    //                    Image(systemName: "calendar")
                    //                        .frame(width: 15)
                    //                    Text(display.date)
                    //                }
                    VStack (alignment: .leading){
                        HStack{
                            VStack {
                                Image(systemName: "calendar") // 달력 이미지
                                    .resizable()
                                    .frame(width: 20, height: 20) // 크기를 적절하게 조절하세요.
                                VStack(alignment: .leading) {
                                    Text(Data.startDate + " ~")
                                    Text(Data.endDate)
                                }
                                .font(.system(size: 12))
                                
                            }
                            VStack {
                                Image(systemName: "location.circle") // 장소 이미지
                                    .resizable()
                                    .frame(width: 20, height: 20) // 크기를 적절하게 조절하세요.
                                Text("\(Data.place)")
                                    .font(.system(size: 12))
                                
                            }
                            VStack {
                                Image(systemName: "dollarsign.circle") // 가격 이미지
                                    .resizable()
                                    .frame(width: 20, height: 20) // 크기를 적절하게 조절하세요.
                                Text("\(Data.payGubunName)")
                                    .font(.system(size: 12))
                                
                            }
                            VStack {
                                Image(systemName: "tag.circle") // 카테고리를 나타내는 이미지 (예시)
                                    .resizable()
                                    .frame(width: 20, height: 20) // 크기를 적절하게 조절하세요.
                                Text("\(Data.eventGubunName)")
                                    .font(.system(size: 12))
                                
                            }
                            
                        }.padding(.bottom, 2)
                        HStack{
                            
                            Text("Category : \(Data.eventGubunName)")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                                .padding(.trailing, 10)
                            Text("Price : \(Data.payGubunName)")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                            
                        }.padding(.bottom, 2)
                        //                    Text("Description")
                        //                        .font(.custom("SFProDisplay-Bold", size: 20))
                        //                        .foregroundColor(Color(red: 0.075, green: 0.059, blue: 0.149, opacity: 1))
                        //                        .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                        //                        .frame(width: 106, height: 24)
                        //                        .background(Color.white)
                        Text("Description")
                            .font(.custom("SFProDisplay-Bold", size: 24)) // "Description"의 폰트 크기를 24로 변경
                            .foregroundColor(Color(red: 0.075, green: 0.059, blue: 0.149, opacity: 1))
                            .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                            .frame(width: 136, height: 24)
                            .background(Color.white)
                        
                        Text("\(Data.subject)입니다") // 상세 설명
                            .font(.system(size: 18)) // "Data.explanation"의 폰트 크기를 22로 변경
                        Spacer()
                        
                        
                    }
                }
                .padding()
                .navigationTitle("Second View") // 네비게이션 바의 타이틀 설정
            }
        }
    }
    
    
    
    
    
    
    
    
    //
    
    struct MainCard1: View {
        
        var data :Display
        var body: some View {
            
            VStack (alignment: .leading){
                // Add your views here
                
                Image(systemName: "photo")
                
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 190.28, height: 124.77)
                    .clipped()
                    .cornerRadius(14)
                    .padding(1)
                
                
                
                // Add your views here
                VStack (alignment: .leading){
                    
                    
                    
                    Text(data.subject)
                        .font(.custom("Poppins-Medium", size: 17))
                        .foregroundColor(Color(red: 0.06, green: 0.06, blue: 0.062))
                        .frame(width: 138, height: 26)
                    
                    
                    HStack{
                        
                        Image(systemName: "mappin").padding(1)
                        Text("7 km from you")
                            .font(.custom("Poppins-Medium", size: 10))
                            .foregroundColor(Color(red: 0.075, green: 0.059, blue: 0.149))
                        Spacer()
                        HStack {
                            Image(systemName: "chevron.right").foregroundColor(.gray)
                        }.padding(5)
                        
                        
                        
                        
                    }
                    Spacer()
                    
                }
                .frame(width: 190, height: 48.51)
                
                
            }   .frame(width: 202.28, height: 190.7)
                .background(Color(UIColor(red: 0.948, green: 0.948, blue: 0.948, alpha: 1))) // Using UIColor in SwiftUI
            
                .cornerRadius(20)
        }
    }
    
    
    
    
    
    
    
    
    
    struct ThirdView: View {
        var body: some View {
            VStack {
                Text("This is the Third View!")
            }
            .padding()
            .navigationTitle("Third View") // 네비게이션 바의 타이틀 설정
        }
    }
    
    // 메인 메뉴 Foreach문으로 출력되는 View페이지
    struct ExtractedView: View {
        
        
        var data : Display
        var body: some View {
            HStack {
                
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 125, height: 130)
                    .padding()
                VStack(alignment: .leading, spacing: 4) {
                    Text(data.subject)
                        .font(.system(size: 15, weight: .bold))
                    HStack {
                        Image(systemName: "tag.circle")
                            .frame(width: 13)
                        Text(data.eventGubunName)
                            .font(.system(size: 12))
                    }
                    HStack{
                        Image(systemName: "calendar")
                            .frame(width: 13)
                        VStack(alignment: .leading) {
                            Text(data.startDate + " ~")
                            Text(data.endDate)
                        }
                        .font(.system(size: 12))
                    }
                    HStack {
                        Image(systemName: "location.circle")
                            .frame(width: 13)
                        Text(data.place)
                            .font(.system(size: 12))
                    }
                    
                    
                    Spacer()
                    
                }.frame(height: 90)
                //                    .background(Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                // NavigationLink를 사용하여 다른 View로 이동할 수 있는 버튼 생성
                NavigationLink(destination: SecondView(Data:data )) {
                    HStack {
                        Image(systemName: "chevron.right").foregroundColor(.gray)
                    }.padding(5)
                }.buttonStyle(PlainButtonStyle())
            }
            .frame(width: 350, height: 152)
            .background(Color(UIColor(red: 0.948, green: 0.948, blue: 0.948, alpha: 1)))
            .cornerRadius(20)
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


