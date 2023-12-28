const baseUri = 'https://selivery.onrender.com/'; //'http://192.168.1.122:8000/';
const authBaseUri = '${baseUri}auth/';
final clientLogin = Uri.parse('http://192.168.1.5:8000/auth/login/client');
final clientRegister = Uri.parse('${authBaseUri}signup/client');
final verifyClientEmailCodeUrl = Uri.parse('${authBaseUri}client/verify_email');
final verifyClientResendEmailCodeUrl =
    Uri.parse('${authBaseUri}resend_verification_code');
final completeCarInfoUrl = Uri.parse('${baseUri}request');
final getAllAdsUri = Uri.parse('${baseUri}advertisement');

final sendNewPasswordUrl = Uri.parse('${baseUri}user/setPassword');

final sendForgetPasswordCodeUrl = Uri.parse('${authBaseUri}forget_password');
final reSendForgetPasswordCodeUrl =
    Uri.parse('${authBaseUri}resend_password_code');
final verifyClientForgetPasswordCodeUrl =
    Uri.parse('${authBaseUri}client/verify_password_code');
final verifyDriverForgetPasswordCodeUrl =
    Uri.parse('${authBaseUri}driver/verify_password_code');

//google sign in
final clientGoogleSignIn = Uri.parse('${authBaseUri}google/client');
///////profile uri
const profileUri = '${baseUri}user/profile';
final profileUpdateImageUri = Uri.parse('${baseUri}user/changePicture');
final profileUpdateInfoUri =
    Uri.parse('${baseUri}user/updateInfo');
const profileUpdateInfoUriHZ = '${baseUri}user/updateInfo';
final profileClientUpdatePassword =
    Uri.parse('${baseUri}user/changePassword');
//categories

const String categoriesUrL = '${baseUri}category';
String categoriesList(id) =>
    "${baseUri}vehicles/sale/category/$id";
String starttrip(id) => "${baseUri}trip/$id/start_trip";
//getdata for owner sale car
String ownerData(id) => "${baseUri}user/driver/$id";

// add rent car
const String rentcar = '${baseUri}vehicles/rent';

String carsWithDriver(id) => "{${baseUri}vehicles/rent/with_driver/category/$id";
String carsWithoutDriver(id) =>
    "${baseUri}vehicles/rent/without_driver/category/$id";

const String addCarForSale = "${baseUri}vehicles/sale";

//rating
String rating(tripid) => "${baseUri}trip/$tripid/rate";

//getdrivers
String getdrivers(lat, long) =>
    "${baseUri}trip/nearest_drivers?latitude=$lat&longitude=$long";
const String requestDriver = "${baseUri}trip/request";
const String getMyTrips = "${baseUri}user/client/trips";

//driver
String getdriverProfile(id) => "${baseUri}user/driver/$id";
/////////
final authHeaders = {
  'Keep-Alive': 'timeout=5',
  'Connection': 'keep-alive',
  'Date': 'Fri, 18 Aug 2023 21:32:41 GMT',
  'ETag': 'W/"260-WWE610PoFt4+PMlb4uXuYqzj+4w"',
  'Content-Type': 'application/json; charset=utf-8',
  'X-Powered-By': 'Express',
  'Access-Control-Allow-Origin': '*',
};
authHeadersWithToken(String token) => {
      'Keep-Alive': 'timeout=5',
      'Connection': 'keep-alive',
      'Date': 'Fri, 18 Aug 2023 21:32:41 GMT',
      'ETag': 'W/"260-WWE610PoFt4+PMlb4uXuYqzj+4w"',
      'Content-Type': 'application/json',
      'X-Powered-By': 'Express',
      'Access-Control-Allow-Origin': '*',
      'AUTHORIZATION': 'Bearer $token',
    };
//

authHeadersWithTokenIm(String token) => {
      'Keep-Alive': 'timeout=5',
      'Connection': 'keep-alive',
      'Date': 'Fri, 18 Aug 2023 21:32:41 GMT',
      'ETag': 'W/"260-WWE610PoFt4+PMlb4uXuYqzj+4w"',
      'Content-Type':
          'multipart/form-data; boundary=<calculated when request is sent>',
      'X-Powered-By': 'Express',
      'Access-Control-Allow-Origin': '*',
      'Authorization': 'Bearer $token',
    };
//<calculated when request is sent>
