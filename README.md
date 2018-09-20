# NHK EASY NEWS CLIENT 

### Screenshot

<img src = "/resources/NHK_ScreenShot.png" height = 400/>

### Bug Resolved Lists

1. if using real device and also run the backend server on `localhost:${port}` but indicated the error: `I/flutter (21274): SocketException: OS Error: Connection refused, errno = 111, address = localhost, port = 49338`
   * For Android: `adb reverse tcp:${port} tcp:${port}`.

