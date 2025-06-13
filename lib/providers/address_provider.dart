

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../core/services/address_service.dart';
import '../core/utils/utils.dart';
import '../models/address_model.dart';
import '../models/error_model.dart';

enum UIState {idle, loading, error, done}
class AddressProvider with ChangeNotifier {

  final AddressServices service = AddressServices();

  UIState uiState = UIState.idle;

  get isLoading => uiState == UIState.loading;

  get done => uiState == UIState.done;

  get error => uiState == UIState.error;


  setUiState(UIState _uiState) {
    uiState = _uiState;
    notifyListeners();
  }


  updateUi(func) {
    func();
    notifyListeners();
  }

  Address? addressModel;

  num? amountInDollars;

  num? addressAdaTokens;




  bool loadingWalletDetails = false;
  //This code will fetch the data for the specific address
  fetchSpecificAddressDetails(BuildContext context, String? walletAddress) async {
    if (walletAddress!.isEmpty) {
      Utils.showSnackBar(context, message: "The wallet address must not be empty");
      return;
    }
    try{
      loadingWalletDetails = true;
      var response = await service.getAddressDetails(addressDetails: walletAddress);
      updateUi(()=> loadingWalletDetails = false);
      log(response.toString());
      if (service.successfulResponse(response)) {
        addressModel = Address.fromJson(response.data);
        fetchAmount();
      }else {
        ErrorResponse error = ErrorResponse.fromJson(response.data);
        Utils.showSnackBar(context, message: error.message);
      }
    } on DioException catch(e) {
      Utils.showSnackBar(context, message: e.message);
      updateUi(()=> loadingWalletDetails = false);
    }
  }


//fetch the amount in the address
  fetchAmount() {
    Amount adaAmountInLovelace;
    adaAmountInLovelace = addressModel!.amount!.firstWhere((amount) => amount.unit == 'lovelace');
    num lovelaceAmountConversion = num.parse(adaAmountInLovelace.quantity!);
    addressAdaTokens =  lovelaceAmountConversion/ 1000000;
    if (addressAdaTokens != null) {
      amountInDollars = addressAdaTokens! * 0.66;
    }

  }


}