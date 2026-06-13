//
//  ContentView.swift
//  EmployeeAttendance
//
//  Created by James Austin Jr. on 5/11/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tabs = .attendance
    
    enum Tabs: String, Equatable, Hashable, Identifiable {
        case attendance = "Attendance"
        case dashboard = "Dashboard"
        
        var id: Tabs { self }
    }

    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                MainView()
                    .tabItem {
                        Label(Tabs.attendance.rawValue, systemImage: "checkmark.circle")
                    }

                DashboardView()
                    .tabItem {
                        Label(Tabs.dashboard.rawValue, systemImage: "list.bullet")
                    }
            }
            .navigationTitle(selectedTab.rawValue)
            .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {}) {
                        Label("Profile", systemImage: "person.crop.circle")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}) {
                        Label("Settings", systemImage: "gear")
                    }
                }
            }
        }
    }

    struct MainView: View {
        @State private var isClockedIn: Bool = false
        @State private var clockTime: String = ""
        
        func formattedCurrentDate() -> String {
            Date.now.formatted(
                .dateTime
                    .weekday(.wide)
                    .month(.abbreviated)
                    .day()
            )
        }
        
        func formattedCurrentTime() -> String {
            Date.now.formatted(
                .dateTime
                    .hour()
                    .minute()
                    .second()
            )
        }
        
        var body: some View {
            let dateString = formattedCurrentDate()
            
            ScrollView{
                VStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text(dateString).font(Font.subheadline)
                        Text("Good morning Superstar!").font(Font.largeTitle.bold())
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: .topLeading
                    )
                    .padding(20)
                    
                    VStack(alignment: .center) {
                        Text("Current Time")
                        TimelineView(.periodic(from: .now, by: 1)) { context in
                            Text(context.date.formatted(.dateTime.hour().minute().second()))
                        }.font(Font.title)
                        
                        Button(action: {
                            isClockedIn = !isClockedIn
                            clockTime = formattedCurrentTime()
                        })
                        {
                            Label(isClockedIn ? "Clock out" : "Clock in", systemImage: "play")
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if !clockTime.isEmpty {
                            Text(isClockedIn ? "Clocked in at \(clockTime)" : "Clocked out at \(clockTime)")
                        }
                    }
                    .padding(50)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(20)
                    
                    Button(action: {}) {
                        Label("Enable Location", systemImage: "location.fill")
                    }
                    .buttonStyle(.glass)
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .top
                )
            }
        }
    }
    
    struct DashboardView: View {
        var body: some View {
                Text("Dashboard Overview")
        }
    }
}

#Preview {
    ContentView()
}
