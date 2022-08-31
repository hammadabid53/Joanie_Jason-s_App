import 'dart:convert';

import 'package:get/get.dart';
import 'package:getxpractice/Modular/auth/Models/CoreModuleModels/Favorites_Model/Add_Remove_Favoraites/Add_Remove_Favoraites.dart';
import 'package:getxpractice/Modular/auth/Models/CoreModuleModels/Get_Product/Get_Product_model.dart';
import 'package:getxpractice/Modular/auth/Models/CoreModuleModels/Get_Sub_Categories/Get_sub_Categories.dart';
import 'package:getxpractice/Modular/auth/Models/CoreModuleModels/product_order/product_order_model.dart';
import 'package:getxpractice/Modular/auth/Models/PastOrderModel/PastOrderModel.dart';
import 'package:getxpractice/Modular/auth/Models/PaymentModels/Add_Card_Model.dart';
import 'package:getxpractice/Modular/auth/Models/PaymentModels/Default_Card.dart';
import 'package:getxpractice/Modular/auth/Models/PaymentModels/Delete_Card_Model.dart';
import 'package:getxpractice/Modular/auth/Models/PaymentModels/Get_Card_Model.dart';
import 'package:getxpractice/Modular/auth/Services/connectivity_manager.dart';
import 'package:getxpractice/view/Screens/core_module/bottom_navibar_pages/Shopping_Cart/shoppingcart_controller.dart';
import 'package:getxpractice/view/Screens/core_module/payment_screens/checkout.dart';

import '../../../Resuable_widgets/bot_toast/error_message.dart';
import '../../../Resuable_widgets/bot_toast/loading.dart';
import '../../../Resuable_widgets/bot_toast/network_message.dart';
import '../../../Resuable_widgets/custom_snackbar.dart';
import '../../../utils/api.dart';
import 'package:http/http.dart' as http;

import '../../../view/Screens/registration_module/splash_screen_module/splash_screen.dart';
import '../Controllers.dart/CoreController/GetSubCategories/Get_Sub_Categories.dart';
import '../Controllers.dart/CoreController/Get_Product_Controller/Get_Product_Controller.dart';
import '../Models/CoreModuleModels/Favorites_Model/Show_Fav_Model/Favoraites_model.dart';
import '../Models/CoreModuleModels/GetAllCategories/GetAllCat.dart';
import '../Models/CoreModuleModels/GetRestuarant/GetResModel.dart';
import '../Models/CoreModuleModels/Get_Single_Product/Get_Single_Product_Model.dart';

class CoreApi extends SharedApi {
////////////////////////////////////GETRESTUARANT////////////////////////////////////////////
  Future<GetResModel?> GetResAPI() async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        var data = await http
            .get(Uri.parse("$baseUrl/resturants"), headers: getToken())
            .timeout(
          const Duration(seconds: 15),
          onTimeout: () {
            stopLoading();
            showErrorMessage("connection Time out Sorry! try again");
            return http.Response(
                'Error', 408); // Request Timeout response status code
          },
        );
        print(data.body.toString());
        jsonData = json.decode(data.body);
        print(data.statusCode);

        print(" GetResAPI JsonData:#########${jsonData}");

        if (data.statusCode == 200) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
         // customSnackBar("Get Restuarant Successfully", "congrats");

          return GetResModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
          showErrorMessage(jsonData['message']);
        }
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");

      return GetResModel.fromJson({"status": 404});
    } finally {
      stopLoading();
    }
    return null;
  }

  //#########################GETALLCATEGORIES##################################
  Future<GetAllCategories?> GetAllCat(String resid) async {
    print("################# Get all res id ${resid}");
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        var data = await http
            .get(Uri.parse("$baseUrl/all-categories/$resid"),
                headers: getToken())
            .timeout(
          const Duration(seconds: 15),
          onTimeout: () {
            stopLoading();
            showErrorMessage("connection Time out Sorry! try again");
            return http.Response(
                'Error', 408); // Request Timeout response status code
          },
        );
        print(data.body.toString());
        jsonData = json.decode(data.body);
        print(data.statusCode);

        print("GetAllCat JsonData:######################${jsonData}");

        if (data.statusCode == 200) {
          print(data.statusCode);
          stopLoading();

         // customSnackBar("Get All Categories Successfully", "congrats");

          return GetAllCategories.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
          showErrorMessage(jsonData['message']);
        } else {
          stopLoading();
          customSnackBar("NO_INTERNET_CONNECTION", "CHECK INTERNET");
        }
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");
      return GetAllCategories.fromJson({"status": 404});
    } finally {
      stopLoading();
    }
    return null;
  }

  //#########################GET ALL SUB CATEGORIES##################################
  Future<GetSubCategoriesModel?> GetSubCat(String catid) async {
    print("################# get sub cat id  ${catid}");
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        var data = await http
            .get(Uri.parse("$baseUrl/sub-categories/$catid"),
                headers: getToken())
            .timeout(
          const Duration(seconds: 15),
          onTimeout: () {
            stopLoading();
            showErrorMessage("connection Time out Sorry! try again");
            return http.Response(
                'Error', 408); // Request Timeout response status code
          },
        );
        print(data.body.toString());
        jsonData = json.decode(data.body);
        print(data.statusCode);

        print("GetSubCat JsonData:############################${jsonData}");

        if (data.statusCode == 200) {
          print("statusCode:##########${data.statusCode}");
          stopLoading();
          // customSnackBar("Get All Sub Categories Successfully", "congrats");

          return GetSubCategoriesModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
          showErrorMessage(jsonData['message']);
        } else {
          stopLoading();
          customSnackBar("No List Found", "Failed ");
        }
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");
      return GetSubCategoriesModel.fromJson({"status": 404});
    } finally {
      stopLoading();
    }
    return null;
  }

//////////////////////////////////ALL GET PRODUCT ////////////////////////////////////////////
  Future<GetProductModel?> GetProduct(String getproductid) async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        var data = await http
            .get(Uri.parse("$baseUrl/products/$getproductid"),
                headers: getToken())
            .timeout(
          const Duration(seconds: 15),
          onTimeout: () {
            stopLoading();
            showErrorMessage("connection Time out Sorry! try again");
            return http.Response(
                'Error', 408); // Request Timeout response status code
          },
        );
        print("$baseUrl/products/$getproductid");
        print(data.body.toString());
        jsonData = json.decode(data.body);
        print(data.statusCode);

        print("GetProduct JsonData:###############${jsonData}");

        if (data.statusCode == 200) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");

          // customSnackBar("Get All Product Successfully", "congrats");

          return GetProductModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
          showErrorMessage(jsonData['message']);
        } else {
          stopLoading();
          customSnackBar("No List Found", "Failed ");
        }
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");
      return GetProductModel.fromJson({"status": 404});
    } finally {
      stopLoading();
    }
    return null;
  }

//////////////////////////////////ALL GET PRODUCT ////////////////////////////////////////////
  Future<GetSingleProductDetailsModel?> GetSingleProductDetail(
      String getsingleproductid) async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        var data = await http
            .get(Uri.parse("$baseUrl/products/details/$getsingleproductid"),
                headers: getToken())
            .timeout(
          const Duration(seconds: 15),
          onTimeout: () {
            stopLoading();
            showErrorMessage("connection Time out Sorry! try again");
            return http.Response(
                'Error', 408); // Request Timeout response status code
          },
        );
        print(data.body.toString());
        jsonData = json.decode(data.body);
        print(data.statusCode);

        print(
            "GetSingleProductDetail JsonData:##############################################${jsonData}");

        if (data.statusCode == 200) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");

          // customSnackBar("Get Single Product Detail Successfully", "congrats");

          return GetSingleProductDetailsModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");

          showErrorMessage(jsonData['message']);
        } else {
          stopLoading();
          customSnackBar("NO_INTERNET_CONNECTION", "CHECK INTERNET");
        }
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");

      return GetSingleProductDetailsModel.fromJson({"status": 404});
    } finally {
      stopLoading();
    }
    return null;
  }

//////////////////////////////////ALL FAVORITES PRODUCT ////////////////////////////////////////////
  Future<FavoritesModel?> GetALLFAVORITES() async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        var data = await http
            .get(Uri.parse("$baseUrl/product/favourites"), headers: getToken())
            .timeout(
          const Duration(seconds: 15),
          onTimeout: () {
            stopLoading();
            showErrorMessage("connection Time out Sorry! try again");
            return http.Response(
                'Error', 408); // Request Timeout response status code
          },
        );
        print(data.body.toString());
        jsonData = json.decode(data.body);
        print(data.statusCode);

        print("GetALLFAVORITES JsonData:#############${jsonData}");

        if (data.statusCode == 200) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");

          // customSnackBar("Get Favorites List Successfully", "congrats");

          return FavoritesModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
          showErrorMessage(jsonData['message']);
        }
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");

      return FavoritesModel.fromJson({"status": 404});
    } finally {
      stopLoading();
    }
    return null;
  }

//////////////////////////////////ADD REMOVE FAVORITES PRODUCT ////////////////////////////////////////////
  Future<AddRemoveFavoritesModel?> ADDREMOVEFAVORITES(String favid) async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        var data = await http
            .post(Uri.parse("$baseUrl/products/favourite"),
                body: {'productId': favid}, headers: getToken())
            .timeout(
          const Duration(seconds: 15),
          onTimeout: () {
            stopLoading();
            showErrorMessage("connection Time out Sorry! try again");
            return http.Response(
                'Error', 408); // Request Timeout response status code
          },
        );
        print(data.body.toString());
        jsonData = json.decode(data.body);
        print(data.statusCode);

        print(
            "ADDREMOVEFAVORITES JsonData:#########################${jsonData}");

        if (data.statusCode == 200) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");

          customSnackBar("Add To Favorites List Successfully", "congrats");
           GetProductController.p.GetProduct(GetSubCatController
        .s.getSubCategories!.category![GetProductController.p.selectedindex].id
        .toString());
          return AddRemoveFavoritesModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
          showErrorMessage(jsonData['message']);
        }
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");
      return AddRemoveFavoritesModel.fromJson({"status": 404});
    } finally {
      stopLoading();
    }
    return null;
  }

//////////////////////////////////ADD CARD ////////////////////////////////////////////
  Future<AddCardModel?> ADDCARD(
      String CardNumber, String expMonth, String expYear, String cvv) async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        var data = await http
            .post(Uri.parse("$baseUrl/add-card"),
                body: {
                  'cardNumber': CardNumber,
                  'exp_month': expMonth,
                  'exp_year': expYear,
                  'cvv': cvv
                },
                headers: getToken())
            .timeout(
          const Duration(seconds: 15),
          onTimeout: () {
            stopLoading();
            showErrorMessage("connection Time out Sorry! try again");
            return http.Response(
                'Error', 408); // Request Timeout response status code
          },
        );
        print(data.body.toString());
        jsonData = json.decode(data.body);
        print(data.statusCode);

        print("ADD CARD JsonData:#####################${jsonData}");

        if (data.statusCode == 200) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");

          customSnackBar("Add Card Successfully", "congrats");

          return AddCardModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
          showErrorMessage(jsonData['message']);
        }
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");

      return AddCardModel.fromJson({"status": 404});
    } finally {
      stopLoading();
    }
    return null;
  }

//////////////////////////////////GET CARD ////////////////////////////////////////////
  Future<GetCardModel?> GETCARD() async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        var data = await http
            .get(Uri.parse("$baseUrl/getCards"), headers: getToken())
            .timeout(
          const Duration(seconds: 15),
          onTimeout: () {
            stopLoading();
            showErrorMessage("connection Time out Sorry! try again");
            return http.Response(
                'Error', 408); // Request Timeout response status code
          },
        );
        print(data.body.toString());
        jsonData = json.decode(data.body);
        print(data.statusCode);

        print(
            "JsonData:##############################################${jsonData}");

        if (data.statusCode == 200) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");

          // customSnackBar("Get Card Successfully", "congrats");

          return GetCardModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
          showErrorMessage(jsonData['message']);
        }
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");
      return GetCardModel.fromJson({"status": 404});
    } finally {
      stopLoading();
    }
    return null;
  }

//////////////////////////////////Default CARD ////////////////////////////////////////////
  Future<DefaultCardModel?> DefaultCARD(String CardNumber) async {
    try {
      showLoading();

      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        var data = await http
            .post(Uri.parse("$baseUrl/defaultCard"),
                body: {
                  'cardNumber': CardNumber,
                },
                headers: getToken())
            .timeout(
          const Duration(seconds: 15),
          onTimeout: () {
            stopLoading();
            showErrorMessage("connection Time out Sorry! try again");
            return http.Response(
                'Error', 408); // Request Timeout response status code
          },
        );
        print(data.body.toString());
        jsonData = json.decode(data.body);
        print(data.statusCode);

        print("Default Card JsonData:############################${jsonData}");

        if (data.statusCode == 200) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");

          customSnackBar("defaultCard Selected", "congrats");

          return DefaultCardModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
          showErrorMessage(jsonData['message']);
        }
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");

      return DefaultCardModel.fromJson({"status": 404});
    } finally {
      stopLoading();
    }
    return null;
  }

//////////////////////////////////Delete CARD ////////////////////////////////////////////
  Future<DeleteCardModel?> DeleteCard(String id) async {
    try {
      showLoading();

      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        var data = await http
            .post(Uri.parse("$baseUrl/deleteCard/$id"), headers: getToken())
            .timeout(
          const Duration(seconds: 15),
          onTimeout: () {
            stopLoading();
            showErrorMessage("connection Time out Sorry! try again");
            return http.Response(
                'Error', 408); // Request Timeout response status code
          },
        );
        print(data.body.toString());
        jsonData = json.decode(data.body);
        print(data.statusCode);

        print("Delete CARD JsonData:####################${jsonData}");

        if (data.statusCode == 200) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");

          customSnackBar("Card Deleted", "congrats");

          return DeleteCardModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
          showErrorMessage(jsonData['message']);
        }
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");

      return DeleteCardModel.fromJson({"status": 404});
    } finally {
      stopLoading();
    }
    return null;
  }

  //#########################PRODUCT ORDER API##################################
  Future<ProductOrderModel?> ProductOrder() async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var data = await http.post(
          Uri.parse("$baseUrl/products/order"),
          body: jsonEncode({
            "products": temp,
            "orderPrice": AddToCartVM.sp.sub.toString(),
          }),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer " + await box.read('user_token'),
          },
        ).timeout(
          const Duration(seconds: 15),
          onTimeout: () {
            stopLoading();
            showErrorMessage("connection Time out Sorry! try again");
            return http.Response(
                'Error', 408); // Request Timeout response status code
          },
        );
        print("body###############${data.body.toString()}");
        Map<String, dynamic> jsonData =
            new Map<String, dynamic>.from(json.decode(data.body));

        print(data.statusCode);

        print("Product Order Api JsonData:#####################${jsonData}");

        if (data.statusCode == 200) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");

          customSnackBar("Order Placed successfully", "congrats");

          return ProductOrderModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
          showErrorMessage(jsonData['message']);
        } else {
          stopLoading();
          customSnackBar("No Order Placed", "Failed ");
        }
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");

      return ProductOrderModel.fromJson({"status": 404});
    } finally {
      stopLoading();
    }
    return null;
  }

  //########################PAST ORDER API##################################
  Future<PastOrderModel?> PastOrderApi(String id) async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        var jsonData;

        var data = await http
            .get(Uri.parse("$baseUrl/product/order/$id"), headers: getToken())
            .timeout(
          const Duration(seconds: 15),
          onTimeout: () {
            stopLoading();
            showErrorMessage("connection Time out Sorry! try again");
            return http.Response(
                'Error', 408); // Request Timeout response status code
          },
        );
        print("body###############${data.body.toString()}");
        print(data.body.toString());
        jsonData = json.decode(data.body);
        print(data.statusCode);

        print("Past Order Api JsonData:#####################${jsonData}");

        if (data.statusCode == 200) {
          stopLoading();

          
          print("statusCode:##########${data.statusCode}");

          customSnackBar("Past Orders Get successfully", "congrats");

          return PastOrderModel.fromJson(jsonData);
        } else if (data.statusCode == 400) {
          stopLoading();
          print("statusCode:##########${data.statusCode}");
          showErrorMessage(jsonData['message']);
        } else {
          stopLoading();
          customSnackBar("No Orders Get", "Failed ");
        }
      }
    } on Exception catch (_) {
      stopLoading();
      printError();
      showInternetMessage("Failed! Exception Something Went Wrong");

      return PastOrderModel.fromJson({"status": 404});
    } finally {
      stopLoading();
    }
    return null;
  }
}
