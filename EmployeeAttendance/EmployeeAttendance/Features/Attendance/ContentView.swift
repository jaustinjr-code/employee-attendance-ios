//
//  ContentView.swift
//  EmployeeAttendance
//
//  Created by James Austin Jr. on 5/11/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
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
                        Label(Tabs.attendance.rawValue, systemImage: "person.circle")
                    }

                DashboardView()
                    .tabItem {
                        Label(Tabs.dashboard.rawValue, systemImage: "person.circle")
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
        var body: some View {
            VStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("Good morning Superstar!").font(Font.largeTitle.bold())
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .topLeading
                )
                .padding(20)
                let d = Date()
                let formatter = DateFormatter()
                let dateString = formatter.string(from: d)
                Text(dateString).font(Font.subheadline)
                
                Section {
                    VStack(alignment: .center) {
                        Text("Current Time")
                        TimelineView(.periodic(from: .now, by: 1)) { context in
                            Text(context.date.formatted(.dateTime.hour().minute().second()))
                        }.font(Font.title)
                        Button(action: {})
                        {
                            Label("Mark Attendance", systemImage: "play")
                        }
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .center
                    )
                    .background(Color.red)
                    .padding(10)
                }
                .background(Color.blue)
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
