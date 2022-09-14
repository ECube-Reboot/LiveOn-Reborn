//
//  CoupleInformationView.swift
//  liveOnReboot
//
//  Created by Keum MinSeok on 2022/07/09.
//

import SwiftUI

struct CoupleInformationView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showChangeNickNameAlert = false
    @State private var showChangeOfficialDayAlert = false
    @State private var officialDate = Date.now
    var body: some View {
                List {
                    NavigationLink(destination: ChangeNickNameView()){
                        HStack {
                        Text("내 이름")
                                .font(.TextStyles.handWrittenBody)
                        Spacer()
                            Text(MemberConfigService.singleton.profile.currentUserName)
                                .font(.TextStyles.handWrittenCallout)
                                .opacity(0.8)
                        }
                        .padding(.vertical, 12)
                    }
                    .foregroundColor(.textBodyColor)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    
                    HStack {
                        Text("상대")
                                .font(.TextStyles.handWrittenBody)
                        Spacer()
                        Text(MemberConfigService.singleton.profile.partnerName)
                                .font(.TextStyles.handWrittenCallout)
                                .opacity(0.8)
                    }
                    .padding(.vertical, 12)
                    .foregroundColor(.textBodyColor)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
//                    NavigationLink(destination: ChangeOfficialDateView(officialDay: $officialDate)){
                        HStack {
                        Text("우리의 1일")
                                .font(.TextStyles.handWrittenBody)
                        Spacer()
                            Text(MemberConfigService.singleton.profile.officialDate)
                                .font(.TextStyles.handWrittenCallout)
                                .opacity(0.8)
                        }
                        .padding(.vertical, 12)
//                    }
                    .listRowBackground(Color.clear)
                    .foregroundColor(.textBodyColor)
                    .listRowSeparator(.hidden)
                }
        .listRowBackground(Color.clear)
        .navigationTitle("커플정보")
        .navigationToBack(dismiss)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            MemberConfigService.fetchMemberProfile {
                    
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: SettingView()) {
                    Image(systemName: "gearshape")
                }
            }
        }
        .listStyle(.plain)
        .background(Color.backgroundGray)
    }
}


struct CoupleInformationView_Previews: PreviewProvider {
    static var previews: some View {
        CoupleInformationView()
    }
}
