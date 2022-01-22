# edc-client

Implementation of a client to use the embedded dashboard console:
https://github.com/hgrodriguez/embedded-dashboard-console

The code for the client itself is platform agnostic and uses standard Ada 2012.

## Overall idea
This should enable any platform to use the client library to connect to the dashboard.

## Connection capabilities
Currently the dashboard itself offers only UART connectivity.
See the dashboard link above to follow the connectivity capabilities.
As soon as the connectivity is extended in the dashboard, the examples here will be updated to ensure, that the communication is working.

##  Versioning scheme
Major.Minor.Patch

### Major
1 = UART; Status: **implemented**

2 = UART + SPI

3 = UART + SPI + I2C

### Minor

1 = LEDs; Status: **implemented**

2 = LEDs + Matrix 16-bit Word HEX display; Status: **implemented**

3 = LEDs + Matrix 16-bit Word HEX Display + Matrix 32-bit DWord HEX Display; Status: **implemented**

4 = LEDs + Matrix 16-bit Word HEX Display + Matrix 32-bit DWord HEX Display + Character Display

5 = LEDs + Matrix 16-bit Word HEX Display + Matrix 32-bit DWord HEX Display + Character Display + Horizontal Scrolling Character Display

6 = OLED
