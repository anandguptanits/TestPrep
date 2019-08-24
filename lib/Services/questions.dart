import 'dart:convert';
import 'package:http/http.dart' as http;



class ApiService {

  /// fetching questions for server
  static Future<List<dynamic>> getQuestion(
      String classValue, String subjectValue) async {
    try {
      final url = "http://testprepp.com/api/get/questions/";
      final response = await http.post(url, body: {
        'token': '0ae63a7e2fabddd08f22c72096cfddaa',
        'secret': 'edurer_mobile',
        'classes': classValue,
        'subject': subjectValue,
      });
      if (response.statusCode == 200) {
        print(response.body);
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (ex) {
      return null;
    }
  }

// Saving responses to the server
  static Future<List<dynamic>> saveResponse(
    
      String classValue,
      String subjectValue,
      List quesArray,
      List selectedRespArray,
     
      List respArray) async {
         List<Map> responseJSONArray=[];
    for (var i = 0; i < quesArray.length; i++) {
       var jsonResp = {};
      jsonResp['q_id'] = 1;
      jsonResp['response'] = selectedRespArray[i];
      jsonResp['duration'] = 0 ;
      if (respArray[i] == selectedRespArray[i] ) {
        jsonResp['is_correct'] = "0";
      } else {
        jsonResp['is_correct'] = "1" ;
      }
      responseJSONArray.add(jsonResp);
    }

    print(responseJSONArray.toString());

    try {
      final url = "http://testprepp.com/api/student_response/";
      final response = await http.post(url, body: {
        'token': '0ae63a7e2fabddd08f22c72096cfddaa',
        'secret': 'edurer_mobile',
        'school_code': 'demo',
        "student_email": "ritikjain@gmail.com",
        "test_details": "Question Bank" + "|" + classValue + "|" + subjectValue,
        // "time_array": JSON.stringify(responseJSONArray),
        "response_array":json.encode(responseJSONArray),
        "num_ques": quesArray.length.toString(),
      });
      print(response.statusCode);
      
      if (response.statusCode == 200) {
        print(response.body);
        print("successfully submitted to server");
        return json.decode(response.body);
      } else {

        print("s");
        return null;
      }
    } catch (ex) {

      print(ex);
      return null;
    }
  }
}

