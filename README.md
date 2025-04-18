<div align="center">
  <h1>LocalStorage</h1>
</div>

A lightweight and extensible Swift Package for accessing local storage (`UserDefaults` and, in the future, `Keychain` ). Designed to work in both Clean Architecture projects and simpler setups.

---

## ✨ Features

- 🔑 Type-safe data access using `Codable`
- 🧪 In-memory storage support for testing
- ⏳ Support for expirable values

## 📦 Installation

### Swift Package Manager

In `Package.swift` add the following:

```swift
.package(url: "https://github.com/legin098/swift_local_storage_kit", from: "1.0.0")
```

If you're using the local version:

1. Drag the package folder into your Xcode project
2. Go to: **File > Add Packages...**
3. Select "**Add local...**" and choose the folder where you package is located
