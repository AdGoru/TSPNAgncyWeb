// JScript File

// JScript File


/**
 * DHTML date validation script.)
 */
// Declaring valid date character, minimum year and maximum year
var dtCh= "/";
var minYear=1900;
var maxYear=2100;

function isInteger(s){
	var i;
    for (i = 0; i < s.length; i++){   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}

function stripCharsInBag(s, bag){
	var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++){   
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function daysInFebruary (year){
	// February has 29 days in any year evenly divisible by four,
    // EXCEPT for centurial years which are not also divisible by 400.
    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}
function DaysArray(n) {
	for (var i = 1; i <= n; i++) {
		this[i] = 31
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
		if (i==2) {this[i] = 29}
   } 
   return this
}

function isDate(dtCtl){
    var dtStr=dtCtl.value;
    //alert(dtStr);
    if(dtStr!="")
    {
	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strMonth=dtStr.substring(0,pos1)
	var strDay=dtStr.substring(pos1+1,pos2)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++) {
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)
	if (pos1==-1 || pos2==-1){
		alert("The date format should be : mm/dd/yyyy")
		dtCtl.value=""
		//dtCtl.style.backgroundColor = '#FD5E53';
		dtCtl.focus()
		return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		alert("Please enter a valid month")
		dtCtl.value=""
		//dtCtl.style.backgroundColor = '#FD5E53';
		dtCtl.focus()
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		alert("Please enter a valid day")
		dtCtl.value=""
		//dtCtl.style.backgroundColor = '#FD5E53';
		dtCtl.focus()
		return false
	}
	if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
		alert("Please enter a valid 4 digit year between "+minYear+" and "+maxYear)
		dtCtl.value=""
		//dtCtl.style.backgroundColor = '#FD5E53';
		dtCtl.focus()
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		alert("Please enter a valid date")
		dtCtl.value=""
		//dtCtl.style.backgroundColor = '#FD5E53';
		dtCtl.focus()
		return false
	}
	//dtCtl.style.backgroundColor = '';
	
return true;
}
return true;
}
function IsRquired(ctrl)
{
 var Str=ctrl.value;
 //alert(Str);
 if(Str=="")
 {
  alert("It is Required Field.Please Enter");
  ctrl.focus();
  return false;
 }
 else
  return true;
}
///**
// * DHTML Alphabates and numbers validation script.)
// */
function isValidAlpha(ctr)
{
//debugger
var obj=document.getElementById(ctr);
var m=obj.value;
if(obj.value!="")
{	
var regexLetter = /^[a-zA-Z][a-zA-Z' ]*$/;
if(regexLetter.test(m)){
return true;
}
else
{
alert("Only alphabets and ' are allowed.Must start with alphabets.");
//obj.value="";
obj.focus();
return false;
}
}
return true;
}
function isValidaAlphaandRequired(ctr,lbl)
{
isValidAlpha(ctr);
ChangeRequiredFieldLabelColor(ctr,lbl);
}
/**
 * DHTML Alphabates and numbers validation script.)
 */
function validateNumber(s){
	var i;
	var obj=document.getElementById(s);
    var m=obj.value;
    for (i = 0; i < m.length; i++){   
        // Check that current character is number.
        var c = m.charAt(i);
        if (((c < "0") || (c > "9")))
        {
         alert("Eneter only numbers");
         //obj.value="";
         obj.focus();
         return false;
        }
    }
    // All characters are numbers.
    return true;
}
/**
 * DHTML Alphabate charachters validation script.)
 */
function isValidAlphaOrNumDot(ctr)
{

var obj=document.getElementById(ctr);
var m=obj.value;
	//alert(obj.value);
if(obj.value!="")
{	
var regexLetter = /^[a-zA-Z0-9. ]+$/;
//alert(regexLetter.test(obj.value));
if(regexLetter.test(m))
{
return true;
}

else
{
alert('Only alphanumerics and . are allowed');
//obj.value="";
obj.focus();
return false;
}
}
 return true;

}
/**
 * DHTML Alphanumeric,dot,/ validation script.)
 */
function isValidAlphaOrNumDotSlash(ctr)
{
//debugger
var obj=document.getElementById(ctr);
var m=obj.value;
	//alert(obj.value);
if(obj.value!="")
{	
var regexLetter = /^[a-zA-Z][ a-zA-Z0-9./-]*$/;
//alert(regexLetter.test(obj.value));
if(regexLetter.test(m))
{
return true;
}

else
{
alert('Only alphanumerics,.,- and / are allowed and must start with alphabet.');
//obj.value="";
obj.focus();
return false;
}
}
 return true;

}
/**
 * DHTML Alphabate charachters validation script.)
 */
function isValidAlphaOrNum(ctr)
{
var obj=document.getElementById(ctr);
var m=obj.value;
if(obj.value!="")
{	
//alert(obj.value);
var regexLetter = /^[a-zA-Z0-9 ]+$/;
//alert(regexLetter.test(obj.value));
if(regexLetter.test(m))
{
return true;
}
else
{
alert('Only alphanumerics are allowed..!!');
//obj.value="";
obj.focus();
return false;
}
}
return true;
}
/**
 * DHTML script for validating phone number .)
 */
function validatePhoneNumber(ctr) 
{ 
var obj=document.getElementById(ctr);
var m=obj.value;
	//alert(obj.value);
if(obj.value!="")
{	
var regexLetter = /^([0-9+\s()-])+$/;
//alert(regexLetter.test(obj.value));
if(regexLetter.test(m))
{
return true;
}

else
{
alert('phone number is not valid');
//obj.value="";
obj.focus();
return false;
}
}
else
{
 return true;
 }
}
function ValidatePhoneandRequired(ctr,lbl)
{
validatePhoneNumber(ctr);
ChangeRequiredFieldLabelColor(lbl);
}
/**
 * DHTML Email validation script.)
 */
function valideEmail(Id)
{
//debugger
var obj=document.getElementById(Id);
var regex = /^[a-zA-Z0-9_\+-]+(\.[a-zA-Z0-9_\+-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.([a-zA-Z]{2,4})$/;
var emailpat1=/^(\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*)$/;
var emailregpat=/^[a-zA-Z0-9,!#\$%&'\*\+/=\?\^_`\{\|}~-]+(\.[a-z0-9,!#\$%&'\*\+/=\?\^_`\{\|}~-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.([a-z]{2,})$/; 
var objreg=new RegExp(regex);
var objreg1=new RegExp(emailregpat);
if(obj.value!="")
{
if (regex.test(obj.value))
{
  return true;
}
else if(emailregpat.test(obj.value))
{
 alert("The email address looks a bit strange but it is syntactically valid. You might want to check it for typos.");
 obj.focus();
 return true;
}
else {
  alert("The email address is not valid.");
  //obj.value="";
  obj.focus();
  return false;
}
}
else
 return true;
}
function ValidateEmailandRequired(ctr,lbl)
{
valideEmail(ctr);
ChangeRequiredFieldLabelColor(lbl);
}
function IsRquired(ctrl)
{
 var Str=ctrl.value;
 //alert(Str);
 if(Str=="")
 {
  alert("It is Required Field.Please Enter");
  ctrl.focus();
  return false;
 }
 else
  return true;
}

function ChangeRequiredFieldLabelColor(txtctr,lblctr)
{
//debugger
var Str=document.getElementById(txtctr).value;
 //alert(Str);
 if(Str=="")
 {
  //alert("It is Required Field.Please Enter");
  document.getElementById(lblctr).style.color="red";
  //ctrl.focus();
  return false;
 }
 else
 {
  document.getElementById(lblctr).style.color="black";
  return true;
  }
}
function isValidZipCode(ctr) {
//debugger
var obj=document.getElementById(ctr);
var m=obj.value;
var re = /^[0-9]+$/;
if(obj.value!="")
{	
var res=re.test(m);
 if(res)
 {
return true;
}

else
{
alert('Zip code is not valid');
obj.value="";
obj.focus();
return false;
}
}
else
 return true;
}
function isValidEventName(ctr)
{
 var obj=ctr;//document.getElementById(Id);
 if(obj)
 {
  var m=obj.value;
  var re = /^[a-zA-Z][a-zA-Z' -]+$/;
  if(obj.value!="")
  {	
   var res=re.test(m);
   if(res)
   {
    return true;
   }
   //var strSpecialChar=/' and -/;
   else
   {
    alert("Only set of alphabets and ',- are allowed. Example: Meeting's or Meeting - ESM");
    //obj.value="";
    obj.focus();
    return false;
   }
  }
  else
   return true;
  }
  else
  return false;
 }
