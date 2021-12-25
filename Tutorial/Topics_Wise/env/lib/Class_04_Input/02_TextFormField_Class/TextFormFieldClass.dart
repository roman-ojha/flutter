import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("FormField Class")),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(
                        // to style the label text
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    isCollapsed: false,
                    // isCollapse will collapsed the whole TextField
                    prefixText: "Prefix",
                    prefix: null, //<Widget>
                    // prefixText will prefill the given text in the text
                    prefixIcon: null,
                    prefixIconConstraints: null, //<BoxConstraints>
                    // prefixIcon: Image.asset('<Path>'),
                    // prefixIcon return Image/icon
                    prefixStyle: TextStyle(color: Colors.red, fontSize: 30),
                    // to style the prefix
                    suffixText: "Suffix",
                    suffix: null, //<Widget>
                    suffixIcon: null,
                    suffixIconConstraints: null, //<BoxConstraints>
                    suffixStyle: TextStyle(color: Colors.orange, fontSize: 25),
                    icon: Text("Icon"),
                    // icon take Widget to put at the front of TextField
                    errorText: null,
                    errorStyle: null,
                    errorMaxLines: null,
                    filled: true,
                    fillColor: Colors.black12,
                    // fillColor will fill the color inside the TextField
                    focusColor: Colors.black,

                    hintText: "Enter Username",
                    // hintText is use for the placeholder of the input
                    hintStyle: TextStyle(color: Colors.brown, fontSize: 20),
                    helperText: "HelperText",
                    helperStyle: TextStyle(color: Colors.purple, fontSize: 20),
                    counterText: "01",
                    counterStyle: TextStyle(color: Colors.black, fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      // this border will enable when the user is out of the TextField
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      gapPadding: 10,
                    ),
                    border: OutlineInputBorder(
                      // this is apply for the default border
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(),
                      gapPadding: 10,
                    ),
                    focusedBorder: OutlineInputBorder(
                      // this will apply if the TextField is active or Focused
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      // focusedErrorBorder will active when TextField validation will through an error and is not focus
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    errorBorder: OutlineInputBorder(
                      // errorBorder will active TextField validation will through and error
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (val) {
                    // validator is use to validator the entered value in the inputform
                    if (val == "") {
                      return "Please filled the Form";
                    } else {
                      return null;
                    }
                  },
                  // keyboardType: TextInputType.datetime,
                  // keyboardType: TextInputType.emailAddress,
                  // keyboardType: TextInputType.multiline,
                  // keyboardType: TextInputType.number,
                  // keyboardType: TextInputType.phone,
                  // keyboardType: TextInputType.streetAddress,
                  // keyboardType: TextInputType.text,
                  // keyboardType: TextInputType.url,
                  // keyboardType: TextInputType.visiblePassword,
                  keyboardType: TextInputType.name,
                  // to get input for the specific perpose
                  style: TextStyle(
                    // style for the input value
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                  cursorColor: Colors.red,
                  // to color the cursor of the input form
                  showCursor: true,
                  // to enable/disable cursor visiblility
                  cursorWidth: 15,
                  cursorHeight: 30,
                  cursorRadius: Radius.circular(10),
                  autofocus: true,
                  // to automatic get focus when page load
                  // autovalidateMode: AutovalidateMode.always,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // to validate the input field automatic
                  maxLength: 300,
                  // to stop the input after maxlength cross
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,

                  textDirection: TextDirection.rtl,
                  // to change the direction of the text input
                  textAlign: TextAlign.center,
                  // to align the input text in center
                  expands: false,
                  maxLines: 2,
                  // to visible the no. of line in the input
                  minLines: 1,
                  // to viesible the initial line in the input it will grown line up to maxLine when required

                  textCapitalization: TextCapitalization.characters,
                  autofillHints: ["Roman", "Ojha", "another"],
                  enableSuggestions: true,
                  initialValue: "",
                  readOnly: false,
                  //
                  obscureText: false,
                  // this will to hide the original input and show the obsucreingCharacter
                  // default ="*"
                  obscuringCharacter: "9",
                  //
                  toolbarOptions: ToolbarOptions(
                      selectAll: true, copy: true, paste: true, cut: true),
                  onSaved: (val) {
                    print(val);
                  },
                  onChanged: (val) {
                    // this function will triggured every time when the user will type anything in the TextField
                    print(val);
                  },
                  onFieldSubmitted: (val) {
                    // this funciton will triggured when the user will submit the TextField
                    print(val);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    // border: InputBorder.none,
                    // to desable the border
                    suffix: ElevatedButton(
                      child: Text("Submit"),
                      onPressed: null,
                    ),
                    prefix: ElevatedButton(
                      child: Text("Submit"),
                      onPressed: null,
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    errorText: "Error throw",
                    errorMaxLines: 2,
                    // errorText is use to throw an error after the validation
                    errorBorder: OutlineInputBorder(
                      // errorBorder will active TextField validation will through and error
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  initialValue: "Initial Value",
                  // readOnly: true,
                  obscureText: true,
                  // this will to hide the original input and show the obsucreingCharacter
                  // default ="*"
                  obscuringCharacter: "*",
                  // now in this field uer can't write any thing
                  style: TextStyle(color: Colors.cyan, fontSize: 20),
                  validator: (val) {
                    // validator is use to validator the entered value in the inputform
                    if (val == null) {
                      return "Please filled the Form";
                    } else {
                      return null;
                    }
                  },
                ),
                ElevatedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () => {},
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
