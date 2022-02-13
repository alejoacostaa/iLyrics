# iLyrics 🎼

iLyrics is a simple native iOS/Swift/SwiftUI app that grabs lyrics from the https://lyricsovh.docs.apiary.io/ REST API and displays them in a somewhat stylish and fun way.


## Features

- Display song name, artist and lyrics in a nice native iOS sheet view.
- API Error checking
- Internet availability checking
- Watch your favourite songs/lyrics on YouTube straight from the Lyrics View!
- Loved the lyrics you received and feel like telling it to the world? Smash that ❤️ button!
- Previous search section shows the last successfull lyrics search. Works without internet!
- History section allows to retrieve every successfull lyric search ever.

## Tech Used

- [Swift](https://swift.org/)
- [SwiftUI](https://developer.apple.com/xcode/swiftui/)
- [URLSession](https://developer.apple.com/documentation/foundation/urlsession)
- [NWPath](https://developer.apple.com/documentation/network/nwpath)


## Notes
- If you wish to test for the lack of internet access functionality, please do so on a real device! NWPath (apples framework for monitoring internet connectivity) is known to be pretty buggy on the Simulator (As you can see [here](https://www.reddit.com/r/swift/comments/ir8wn5/network_connectivity_is_always_unsatisfied_when/) and [here](https://stackoverflow.com/questions/57223756/nwpathmonitor-not-calling-satisfied-in-swift)) Summarized, when testing on simulators, whatever connection status NWPath detects when the app runs stays forever and does not change. Works flawlessly on a real device though!
- iLyrics uses some iOS 14 exclusive SwiftUI views (such as Link to toggle YouTube for example) so testing on the latest iOS and XCode available is preferred.
- Making iLyrics from scratch has been super fun! Should you encounter any issues, feel free to reach out!

## Demo

<p align="center">
  <img alt="Light" src="https://user-images.githubusercontent.com/11844338/117036808-34969b00-acdc-11eb-8bed-cbb68b12be0c.png" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Dark" src="https://user-images.githubusercontent.com/11844338/117036821-37918b80-acdc-11eb-855d-1f3910a932dd.png" width="45%">
</p>

<p align="center">
  <img alt="Light" src="https://user-images.githubusercontent.com/11844338/117036825-38c2b880-acdc-11eb-8cda-ac5377feb3ae.png" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Dark" src="https://user-images.githubusercontent.com/11844338/117036830-395b4f00-acdc-11eb-9bbc-8ba5e06d27cf.png" width="45%">
</p>

