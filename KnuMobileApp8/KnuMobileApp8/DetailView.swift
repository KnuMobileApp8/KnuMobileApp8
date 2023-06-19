//
//  DetailView.swift
//  KnuMobileApp8
//
//  Created by Dean on 2023/06/16.
//

import SwiftUI

struct DetailView: View {
    var Data : Display
    var body: some View {
        ScrollView{
            VStack (alignment: .leading){
                Text(Data.subject)
                    .font(.custom("DMSans-Bold", size: 27))
                    .foregroundColor(Color.black)
                    .kerning(-1)
                    .lineSpacing(-18)
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
            .navigationTitle("상세 정보") // 네비게이션 바의 타이틀 설정
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(Data: displaySamples[0])
    }
}
