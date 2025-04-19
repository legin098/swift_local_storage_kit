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

## 🚀 Getting Started

1. **Basic usage**:

   ```swift
   let storage = StorageFactory.makeStorage()
   ```

   By default, this option uses UserDefaultsStorage as the storage engine.

2. **Testing/ in-memory usage**:

   **Explicit form**:

   ```swift
   let testStorage = StorageFactory.makeStorage(config: StorageConfig(useInMemoryStorage: true))
   ```

   You manually pass a `StorageConfig` with the option to use in-memory storage.

   **Abbreviated form:**

   ```swift
   let memoryStorage = StorageFactory.makeStorage(config: .init(useInMemoryStorage: true))
   ```

   Swift infers the type, so .init(...) is a shorter equivalent.
