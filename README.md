# Map-Location
<h4>it is an application which allows to retrieve the current position of the user, and also to add markers when the latter presses and holds on the map of the application, and it also makes it possible to follow the movements of the user.<h4>
<h3>to get the user location we should configure the project:</h3>
<ul>
  <li><h4>1-Add a libary</h4>
  - build phases > link binary with libaries > + > coreLocation.framework <li>
  <li><h4>2-Add 2 rows on info.plist</h4>
  -privacy location when in use + "message" (ex:This app need to know your location)
  -privcy location always usage + "message"  (ex: This app need to know your permission)<li>
    </ul>

  
  <h4>User Position:</h4>
  ![userposition](https://user-images.githubusercontent.com/62174583/120862570-15ac5280-c581-11eb-8b51-ed0cd581249b.PNG)
  
  <h4>Markers:<h4>
    ![add markers](https://user-images.githubusercontent.com/62174583/120862650-34aae480-c581-11eb-8d4d-1db59be31acc.PNG)

