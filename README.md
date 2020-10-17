
## flutter_shopping_app [![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)](https://github.com/Thealphamerc/flutter_ecommerce_app)


Shopping app is a design implementaion of [E-commerce App](https://dribbble.com/shots/7174226-Bright-app-UI-Kit) designed by [M A J E D](https://dribbble.com/majed_interactive)
  
## Android Screenshots

<table>
  <tr>
    <td>Home Screen</td>
    <td>Product Details</td>
    <td>Product cart</td>
  </tr>
  <tr>
    <td valign="top"><img src="shopping_app/screenshot/img1.jpg" width=270 height=480></td>
    <td valing="top"><img src="shopping_app/screenshot/img2.jpg" width=270 height=480></td>
    <td valing="top"><img src="shopping_app/screenshot/img5.jpg" width=270 height=480></td>
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
 ┃ ┃ ┃ ┣ 📜profile_repository.dart  
 ┃ ┃ ┃ ┗ 📜profile_repository_firebase.dart  
 ┃ ┃ ┗ 📜profile_screen.dart  
 ┃ ┣ 📂shipping  
 ┃ ┃ ┣ 📂model  
 ┃ ┃ ┃ ┗ 📜ship_method.dart  
 ┃ ┃ ┗ 📜shipping_method_screen.dart  
 ┃ ┗ 📂wishlist  
 ┃ ┃ ┣ 📂bloc  
 ┃ ┃ ┗ 📂ui  
 ┃ ┃ ┃ ┗ 📜wishlist_screen.dart  
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
 ┣ 📜bloc_observer.dart  
 ┗ 📜main.dart

```
  
