# Google Maps SDK Bugs

This repo houses demo projects to reproduce Google Maps iOS SDK issues.

1. `pod install`
2. `xed .`
3. Replace `API Key Here` in `AppDelegate.swift` with your [Google Maps SDK API key](https://developers.google.com/maps/documentation/ios-sdk/start#get-key)
4. Build and run
5. On launch, the following will be logged to the console, even though the map was not moved by a user gesture: `Map will move. Gesture: true`
