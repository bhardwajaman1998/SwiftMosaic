# SwiftMosaic
SwiftMosaic is a modular open-source framework for iOS development.
It provides reusable building blocks for both UIKit and SwiftUI, helping developers structure apps with clean architecture, state management, and navigation patterns.

Two SwiftPM libraries:
- **SwiftCore** – UIKit + general Swift patterns (MVVM base, Coordinator, DI helpers, async/await networking, property wrappers).
- **SwiftUICore** – SwiftUI state management, enum-based router, observable view model base, reusable UI utilities.

📦 Modules

SwiftCore

UIKit + general Swift patterns:
	•	MVVM base classes & protocols
	•	AppCoordinator for navigation flows
	•	Protocol-based Dependency Injection
	•	Async/await + Combine networking helpers
	•	Property wrappers (e.g. @UserDefault)

SwiftUICore

SwiftUI-focused utilities:
	•	Observable ViewModel base
	•	UniversalStateManager (async state wrapper)
	•	EnumRouter (state-driven navigation)
	•	BooleanBinding & OptionalItem patterns
	•	Reusable animations and UI helpers

## Installation (SPM)

In Xcode:
File > Add Packages…

Enter the repo URL: https://github.com/bhardwajaman1998/SwiftMosaic

## Quick Start

##########################
UIKit Example (SwiftCore)
import SwiftCore
import UIKit

struct LoginState {
    var username = ""
    var isLoading = false
}

final class LoginViewModel: BaseViewModel<LoginState> {
    override func bind() {
        // Business logic & API binding
    }
}

final class LoginViewController: MVVMViewController<LoginViewModel> {
    // Build your UIKit UI here
}

##########################

SwiftUI Example (SwiftUICore)

import SwiftUICore
import SwiftUI

struct DashboardState { var items: [String] = [] }

final class DashboardVM: ObservableViewModel<DashboardState> {
    func load() {
        update { $0.items = ["One", "Two", "Three"] }
    }
}

struct DashboardView: View {
    @StateObject var vm = DashboardVM(initialState: DashboardState())

    var body: some View {
        List(vm.state.items, id: \.self) { item in
            Text(item)
        }
        .onAppear { vm.load() }
    }
}
##########################

✅ Current Features (v0.1.0)
	•	MVVM base classes for Swift + SwiftUI
	•	AppCoordinator (UIKit navigation)
	•	UniversalStateManager (async state wrapper for SwiftUI)
	•	EnumRouter (SwiftUI navigation)
	•	Async/await Networking client
	•	Property wrappers (@UserDefault)
	•	XCTest scaffolding with smoke tests

⸻

🛠 Roadmap
	•	Dependency Container (protocol-based DI)
	•	Universal Animations for SwiftUI
	•	Repository Pattern boilerplate
	•	PreferenceKey + ViewBuilder helpers
	•	UIKit + SwiftUI demo apps
	•	Extended test coverage

⸻

📄 License

SwiftMosaic is available under the MIT License.

⸻

✨ Contributing

Pull requests are welcome!
For major changes, please open an issue first to discuss what you’d like to add.
