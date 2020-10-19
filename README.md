
## flutter_shopping_app [![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)](https://github.com/congtieniuh/Flutter-Shopping-App-Bloc)


Shopping app is a design implementaion of [E-commerce App](https://dribbble.com/shots/7174226-Bright-app-UI-Kit) designed by [M A J E D](https://dribbble.com/majed_interactive)

## Package using
 * firebase_auth
 * firebase_core
 * cloud_firestore
 * flutter_bloc
 * sqflite

 * flutter_icons
 * google_nav_bar
 * equatable
 * flutter_spinkit
 * carousel_slider
 
## Feature implement
 * Authentication (Login/Logout, Register)
 * HomePage (List all product, filter),
 * Product details (Show product details),
 * Add to Cart (Cart Page),
 * Add to Wishlist (Wishlist page),
 * Shipping method (UI),
 * Confirm Orders (UI),
 * Change Credit Card Payment (UI),
 * Profile (UI),


  
## Android Screenshots

<table>
  <tr>
    <td>Home Screen</td>
    <td>Product Details</td>
    <td>Product cart</td>
  </tr>
  <tr>
    <td valign="top"><img src="shopping_app/screenshot/img1.jpg" width=270 height=600></td>
    <td valing="top"><img src="shopping_app/screenshot/img2.jpg" width=270 height=600></td>
    <td valing="top"><img src="shopping_app/screenshot/img5.jpg" width=270 height=600></td>
  </tr>
  
   <tr>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td valign="top"><img src="shopping_app/screenshot/img3.jpg" width=270 height=600></td>
    <td valing="top"><img src="shopping_app/screenshot/img4.jpg" width=270 height=600></td>
    <td valing="top"><img src="shopping_app/screenshot/img6.jpg" width=270 height=600></td>
  </tr>
  <tr>
      <td valign="top"><img src="shopping_app/screenshot/img7.jpg" width=270 height=600></td>
  </tr>
 </table>

 <br>
<br>
<hr>

## Directory Structure

```
📦lib
 ┣ 📂db
 ┃ ┗ 📜db_provider.dart
 ┣ 📂feature
 ┃ ┣ 📂auth
 ┃ ┃ ┣ 📂login
 ┃ ┃ ┃ ┗ 📜login_screen.dart
 ┃ ┃ ┣ 📂model
 ┃ ┃ ┃ ┗ 📜user_app.dart
 ┃ ┃ ┣ 📂register
 ┃ ┃ ┃ ┗ 📜register_screen.dart
 ┃ ┃ ┗ 📜auth_bloc.dart
 ┃ ┣ 📂cart
 ┃ ┃ ┣ 📂bloc
 ┃ ┃ ┃ ┣ 📜cart_bloc.dart
 ┃ ┃ ┃ ┣ 📜cart_event.dart
 ┃ ┃ ┃ ┗ 📜cart_state.dart
 ┃ ┃ ┣ 📂models
 ┃ ┃ ┃ ┣ 📜cart.dart
 ┃ ┃ ┃ ┗ 📜cart_item.dart
 ┃ ┃ ┣ 📂repository
 ┃ ┃ ┃ ┣ 📜cart_repository.dart
 ┃ ┃ ┃ ┗ 📜cart_repository_local.dart
 ┃ ┃ ┗ 📂ui
 ┃ ┃ ┃ ┗ 📜cart_screen.dart
 ┃ ┣ 📂checkout
 ┃ ┃ ┗ 📜checkout_screen.dart
 ┃ ┣ 📂credit_card_details
 ┃ ┃ ┣ 📂models
 ┃ ┃ ┃ ┗ 📜credit_card_model.dart
 ┃ ┃ ┗ 📜card_details_screen.dart
 ┃ ┣ 📂discover
 ┃ ┃ ┣ 📂bloc
 ┃ ┃ ┃ ┣ 📜discover_bloc.dart
 ┃ ┃ ┃ ┣ 📜discover_event.dart
 ┃ ┃ ┃ ┗ 📜discover_state.dart
 ┃ ┃ ┣ 📂model
 ┃ ┃ ┃ ┗ 📜product.dart
 ┃ ┃ ┣ 📂repository
 ┃ ┃ ┃ ┣ 📜discover_repository.dart
 ┃ ┃ ┃ ┗ 📜firebase_discover_repository.dart
 ┃ ┃ ┗ 📂ui
 ┃ ┃ ┃ ┗ 📜discover_screen.dart
 ┃ ┣ 📂home
 ┃ ┃ ┗ 📜home.dart
 ┃ ┣ 📂product_category
 ┃ ┃ ┗ 📜product_categorys_screen.dart
 ┃ ┣ 📂product_details
 ┃ ┃ ┣ 📂bloc
 ┃ ┃ ┃ ┣ 📜product_details_bloc.dart
 ┃ ┃ ┃ ┣ 📜product_details_event.dart
 ┃ ┃ ┃ ┗ 📜product_details_state.dart
 ┃ ┃ ┣ 📂repository
 ┃ ┃ ┃ ┗ 📜product_details_repository.dart
 ┃ ┃ ┗ 📂ui
 ┃ ┃ ┃ ┣ 📜popup_desc_details.dart
 ┃ ┃ ┃ ┗ 📜product_details_screen.dart
 ┃ ┣ 📂profile
 ┃ ┃ ┣ 📂bloc
 ┃ ┃ ┃ ┣ 📜profile_bloc.dart
 ┃ ┃ ┃ ┣ 📜profile_event.dart
 ┃ ┃ ┃ ┗ 📜profile_state.dart
 ┃ ┃ ┣ 📂repository
 ┃ ┃ ┃ ┣ 📜firebase_profile_repository.dart
 ┃ ┃ ┃ ┗ 📜profile_repository.dart
 ┃ ┃ ┗ 📜profile_screen.dart
 ┃ ┣ 📂shipping
 ┃ ┃ ┣ 📂model
 ┃ ┃ ┃ ┗ 📜ship_method.dart
 ┃ ┃ ┗ 📜shipping_method_screen.dart
 ┃ ┗ 📂wishlist
 ┃ ┃ ┣ 📂bloc
 ┃ ┃ ┗ 📂ui
 ┃ ┃ ┃ ┗ 📜wishlist_screen.dart
 ┣ 📂localization
 ┃ ┗ 📜app_localization.dart
 ┣ 📂resources
 ┃ ┣ 📜app_data.dart
 ┃ ┣ 📜app_theme.dart
 ┃ ┣ 📜colors.dart
 ┃ ┣ 📜dimens.dart
 ┃ ┣ 📜icons.dart
 ┃ ┣ 📜R.dart
 ┃ ┣ 📜resources.dart
 ┃ ┣ 📜strings.dart
 ┃ ┗ 📜utils.dart
 ┣ 📂route
 ┃ ┣ 📜router.dart
 ┃ ┣ 📜route_constants.dart
 ┃ ┗ 📜slide_route_builder.dart
 ┣ 📂widget
 ┃ ┣ 📜alert_dialog.dart
 ┃ ┣ 📜appbar.dart
 ┃ ┣ 📜bottom_dialog.dart
 ┃ ┣ 📜card_component.dart
 ┃ ┣ 📜card_product.dart
 ┃ ┣ 📜credit_card_widget.dart
 ┃ ┣ 📜loader_wiget.dart
 ┃ ┗ 📜quater_circle.dart
 ┣ 📜app.dart
 ┣ 📜bloc_observer.dart
 ┗ 📜main.dart

```
## MIT License

Copyright (c) 2020 Huynh Cong Tien congtien.iuh@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.