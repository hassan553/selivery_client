const baseUri = 'http://192.168.1.122:8000/';
const authBaseUri = '${baseUri}auth/';
final clientLogin = Uri.parse('${authBaseUri}login/client');
final clientRegister = Uri.parse('${authBaseUri}signup/client');
final driverLogin = Uri.parse('${authBaseUri}login/driver');
final driverRegister = Uri.parse('${authBaseUri}signup/driver');
final verifyDriverEmailCodeUrl = Uri.parse('${authBaseUri}driver/verify_email');
final verifyClientEmailCodeUrl = Uri.parse('${authBaseUri}client/verify_email');
final verifyClientResendEmailCodeUrl =
    Uri.parse('${authBaseUri}resend_verification_code');
final completeCarInfoUrl = Uri.parse('${baseUri}request');
final getAllAdsUri = Uri.parse('http://192.168.1.122:8000/advertisement');

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
final driverGoogleSignIn = Uri.parse('${authBaseUri}google/driver');
///////profile uri
const profileUri = '${baseUri}user/profile';
final profileUpdateImageUri = Uri.parse('{$baseUri}user/changePicture');
final profileUpdateInfoUri = Uri.parse('http://192.168.1.122:8000/user/updateInfo');
final profileUpdateInfoUriHZ = '{$baseUri}user/updateInfo';
final profileClientUpdatePassword = Uri.parse('http://192.168.1.122:8000/user/changePassword');
//categories

const String categoriesUrL = '${baseUri}category';
String CategoriesList(id) => "${baseUri}vehicles/sale/category/$id";
//getdata for owner sale car
String ownerData(id) => "{$baseUri}user/driver/$id";

// add rent car
const String rentcar = '{$baseUri}vehicles/rent';

String carsWithDriver(id) => "{$baseUri}vehicles/rent/with_driver/category/$id";
String carsWithoutDriver(id) =>
    "{$baseUri}vehicles/rent/without_driver/category/$id";

const String addCarForSale = "{$baseUri}vehicles/sale";
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
      'Content-Type': 'application/json; charset=utf-8',
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
