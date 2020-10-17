
## flutter_shopping_app [![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)](https://github.com/Thealphamerc/flutter_ecommerce_app)


Shopping app is a design implementaion of [E-commerce App](https://dribbble.com/shots/7174226-Bright-app-UI-Kit) designed by [M A J E D](https://dribbble.com/majed_interactive)
  
## Android Screenshots

  

HomePage | Product Detail Page | Cart Page

:-------------------------:|:-------------------------:|:-------------------------:

![](https://github.com/congtieniuh/Flutter-Shopping-App/blob/master/shopping_app/screenshot/img1.jpg?raw=true)|![](https://github.com/congtieniuh/Flutter-Shopping-App/blob/master/shopping_app/screenshot/img2.jpg?raw=true)|![](https://github.com/congtieniuh/Flutter-Shopping-App/blob/master/shopping_app/screenshot/img5.jpg?raw=true)

  

![](https://github.com/congtieniuh/Flutter-Shopping-App/blob/master/shopping_app/screenshot/img3.jpg?raw=true)
  
![](https://github.com/congtieniuh/Flutter-Shopping-App/blob/master/shopping_app/screenshot/img4.jpg?raw=true)

![](https://github.com/congtieniuh/Flutter-Shopping-App/blob/master/shopping_app/screenshot/img6.jpg?raw=true)

![]https://github.com/congtieniuh/Flutter-Shopping-App/blob/master/shopping_app/screenshot/img7.jpg?raw=true)

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
  
