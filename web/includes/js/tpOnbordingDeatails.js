 /* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



function protocolsSelect(x) {
  document.getElementById("protocolValue").value=x;
    if(x == '-1'){
       // document.getElementById('protocolmsg').innerHTML = "";
        document.getElementById('tpResultMessage').innerHTML = "";
        $("#ftpDiv").hide();
        $("#sftpDiv").hide();
        $("#httpDiv").hide();
        $("#smtpDiv").hide();
        $("#as2Div").hide();
        $("#sslDiv").hide();
        $("#sslDiv2").hide();
        $("#transferModeDiv").hide();
    }
    else

 if(x == 'AS2'){
        document.getElementById('protocolmsg').innerHTML = "";
        $("#ftpDiv").hide();
        $("#sftpDiv").hide();
        $("#httpDiv").hide();
        $("#smtpDiv").hide();
        $("#as2Div").show();
        $("#sslDiv").hide();
        $("#sslDiv2").hide();
        $("#transferModeDiv").hide();
        //$('#transferMode').attr('disabled', true);
        //document.forms["addTpOnboard"]["transferMode"].value = 'get';
    }else if(x == 'SMTP'){
        document.getElementById('protocolmsg').innerHTML = "";
        $("#ftpDiv").hide();
        $("#sftpDiv").hide();
        $("#httpDiv").hide();
        $("#smtpDiv").show();
        $("#as2Div").hide();
        $("#sslDiv").hide();
        $("#sslDiv2").hide();
        $("#transferModeDiv").hide();
        //$('#transferMode').attr('disabled', true);
        //document.forms["addTpOnboard"]["transferMode"].value = 'get';
    }else{
        document.getElementById('protocolmsg').innerHTML = "";
        $("#ftpDiv").hide();
        $("#sftpDiv").hide();
        $("#httpDiv").hide();
        $("#smtpDiv").hide();
        $("#as2Div").hide();
        $("#sslDiv").hide();
        $("#sslDiv2").hide();
        $("#transferModeDiv").show();
         //document.getElementById('transferMode').disabled =false;
         
        
    }
    document.getElementById("transferModeMsg").style.display = "none";
    var transferMode = document.forms["addTpOnboard"]["transferMode"].value;
     alert(transferMode);
    if(transferMode=="get" || transferMode=="put")
    
        {
            alert("transferMode clicked");
            gettransferModeSelection(transferMode);
        }
//gettransferModeSelection(transferMode);
//transferModeSelection(transferMode);
}
function sslRequired(x){
    var transferMode;
    if (document.addTpOnboard.transferMode.value) {
        transferMode = document.addTpOnboard.transferMode.value;
    }
    if(x == 'ftp'){
        var ftp_ssl = document.getElementById("ftp_ssl_req").checked;
        if(ftp_ssl == true){
            if(transferMode == 'get'){
                $("#sslDiv").show();
            }
            if(transferMode == 'put'){
                $("#sslDiv2").show();
            }
        }else{
            $("#sslDiv").hide();
            $("#sslDiv2").hide();
        }
    }
    if(x == 'http'){
        var http_ssl=document.getElementById("http_ssl_req").checked;
        if(http_ssl == true){
            if(transferMode == 'get'){
                $("#sslDiv2").show();
            }
            if(transferMode == 'put'){
                $("#sslDiv").show();
            }
        }else{
            $("#sslDiv").hide();
            $("#sslDiv2").hide();
        }
    }
    if(x == 'as2'){
        var as2_ssl=document.getElementById("as2_ssl_req").checked;
        if(as2_ssl == true){
            $("#sslDiv2").show();
        }else{
            $("#sslDiv").hide();
            $("#sslDiv2").hide();
        }
    }
}


function sslPriorityChange(x){
    if(x == 'NONE'){
        document.getElementById("ssl_passphrase").readOnly = true;
        $('#ssl_cipher_stergth').attr('disabled', true)
    }else{
        document.getElementById("ssl_passphrase").readOnly = false;
        $('#ssl_cipher_stergth').attr('disabled', false)
    }
}
        
function fieldLengthValidator(element) {
    var i=0;
    var k=0;
    //alert("In Field Length validator ESCV");
    if(element.value!=null&&(element.value!="")) {
       
        // alert(element.id);
        if(element.id == 'partnerName'|| element.id == 'contactEmail' || element.id == 'contactName' || element.id == 'address1' || element.id == 'city' || element.id == 'state'|| element.id == 'regpartnerName' || element.id == 'regcontactName' || element.id == 'regpassword' || element.id == 'regcontactEmail'){
            i=50;  
        }
                  
        if(element.id == 'zipCode'){
            i=10;
            validatenumber(element);
        }
        if(element.id == 'phoneNo' || element.id == 'regphoneNo'){
            k=1;
            i=15; 
            validatenumber(element);
        }
            
        /* 850 IB validation */
        if(element.id == 'isa850senderIdIB'|| element.id == 'gs850senderIdIB' || element.id == 'st850senderIdIB' || element.id == 'gs850VersionIB' || element.id == 'st850VersionIB'){
            i=15;  
        }
        if(element.id == 'isa850VersionIB'){
            i=5;  
        }
        if(element.id == 'fun850GroupIdIB' || element.id == 'res850AgecodeIB' || element.id == 'trans850IdcodeIB'){
            i=3;  
        }
        /* 850 end*/     
        /* 855 IB validation */
        if(element.id == 'isa855senderIdIB'|| element.id == 'gs855senderIdIB' || element.id == 'st855senderIdIB' || element.id == 'gs855VersionIB' || element.id == 'st855VersionIB'){
            i=15;  
        }
        if(element.id == 'isa855VersionIB'){
            i=5;  
        }
        if(element.id == 'fun855GroupIdIB' || element.id == 'res855AgecodeIB' || element.id == 'trans855IdcodeIB'){
            i=3;  
        }
        /* 855 end*/ 
        /* 856 IB validation */
        if(element.id == 'isa856senderIdIB'|| element.id == 'gs856senderIdIB' || element.id == 'st856senderIdIB' || element.id == 'gs856VersionIB' || element.id == 'st856VersionIB'){
            i=15;  
        }
        if(element.id == 'isa856VersionIB'){
            i=5;  
        }
        if(element.id == 'fun856GroupIdIB' || element.id == 'res856AgecodeIB' || element.id == 'trans856IdcodeIB'){
            i=3;  
        }
        /* 856 end*/
        /* 810 IB validation */
        if(element.id == 'isa810senderIdIB'|| element.id == 'gs810senderIdIB' || element.id == 'st810senderIdIB' || element.id == 'gs810VersionIB' || element.id == 'st810VersionIB'){
            i=15;  
        }
        if(element.id == 'isa810VersionIB'){
            i=5;  
        }
        if(element.id == 'fun810GroupIdIB' || element.id == 'res810AgecodeIB' || element.id == 'trans810IdcodeIB'){
            i=3;  
        }
        /* 810 end*/
       
        /* 850 OB validation */
        if(element.id == 'isa850senderIdOB'|| element.id == 'gs850senderIdOB' || element.id == 'st850senderIdOB' || element.id == 'gs850VersionOB' || element.id == 'st850VersionOB'){
            i=15;  
        }
        if(element.id == 'isa850VersionOB'){
            i=5;  
        }
        if(element.id == 'fun850GroupIdOB' || element.id == 'res850AgecodeOB' || element.id == 'trans850IdcodeOB'){
            i=3;  
        }
        /* 850 end*/     
        /* 855 OB validation */
        if(element.id == 'isa855senderIdOB'|| element.id == 'gs855senderIdOB' || element.id == 'st855senderIdOB' || element.id == 'gs855VersionOB' || element.id == 'st855VersionOB'){
            i=15;  
        }
        if(element.id == 'isa855VersionOB'){
            i=5;  
        }
        if(element.id == 'fun855GroupIdOB' || element.id == 'res855AgecodeOB' || element.id == 'trans855IdcodeOB'){
            i=3;  
        }
        /* 855 end*/ 
        /* 856 OB validation */
        if(element.id == 'isa856senderIdOB'|| element.id == 'gs856senderIdOB' || element.id == 'st856senderIdOB' || element.id == 'gs856VersionOB' || element.id == 'st856VersionOB'){
            i=15;  
        }
        if(element.id == 'isa856VersionOB'){
            i=5;  
        }
        if(element.id == 'fun856GroupIdOB' || element.id == 'res856AgecodeOB' || element.id == 'trans856IdcodeOB'){
            i=3;  
        }
        /* 856 end*/
        /* 810 OB validation */
        if(element.id == 'isa810senderIdOB'|| element.id == 'gs810senderIdOB' || element.id == 'st810senderIdOB' || element.id == 'gs810VersionOB' || element.id == 'st810VersionOB'){
            i=15;  
        }
        if(element.id == 'isa810VersionOB'){
            i=5;  
        }
        if(element.id == 'fun810GroupIdOB' || element.id == 'res810AgecodeOB' || element.id == 'trans810IdcodeOB'){
            i=3;  
        }
        /* 810 end*/
        if(element.id == 'ftp_resp_time' || element.id == 'ftp_port' || element.id == 'sftp_remote_port' || element.id == 'http_resp_time' || element.id == 'http_port' || element.id == 'smtp_server_port'){
            //k=1;
            i=5; 
            validatenumber(element);
        }
 
        if(k==1){
            
            if(element.value.replace(/^\s+|\s+$/g,"").length<=9) {
                str=new String(element.value);
                element.value=str.substring(0,i);
            
                //alert("The "+element.id+" must be greater than 9 characters");
                document.getElementById('tpResultMessage').innerHTML = "<font color=red>Phone Number must be 10 characters</font>";
                element.value="";
                element.focus();
                return false;
            }
            
            if(element.value.replace(/^\s+|\s+$/g,"").length>i) {
                str=new String(element.value);
                element.value=str.substring(0,i);
                //alert("The "+element.id+" must be less than "+i+" characters");
                document.getElementById('tpResultMessage').innerHTML = "<font color=red>The Value must be less than "+i+" characters</font>";
                element.focus();
                return false;
            }
        }else{
            if(element.value.replace(/^\s+|\s+$/g,"").length>i) {
                str=new String(element.value);
                element.value=str.substring(0,i);
                //alert("The "+element.id+" must be less than "+i+" characters");
                document.getElementById('tpResultMessage').innerHTML = "<font color=red>The Value must be less than "+i+" characters</font>";
                element.focus();
                return false;
            }
        }
        return true;
        
    }
}

function validatenumber(xxxxx) {
    //alert('hi');
    var maintainplus = '';
    var numval = xxxxx.value
    if ( numval.charAt(0)=='+' ){
        var maintainplus = '+';
    }
    curnumbervar = numval.replace(/[\\A-Za-z!"£$%^&*+_={};:'@#~,¦\/<>?|`¬\]\[]/g,'');
    xxxxx.value = maintainplus + curnumbervar;
    var maintainplus = '';
    // alert("enter integers only");
    xxxxx.focus;
}



//PHONE NUMBER FORMAT SCRIPT :START   
function formatPhone(num)
{ 

    str = new String(document.userForm.ophno.value);
    var pattern =/^\(\d{3}\)\-\d{3}\-\d{4}$/;
    document.userForm.ophno.value=str.replace(pattern, "");
    //document.userForm.ophno.value=str.replace(/[A-Za-z\(\)\.\-\x\s,]/gpattern, "");
    num=document.userForm.ophno.value;
    var _return;
    if(num.length == 10) 
    { 
        //  _return="(";
        var ini = num.substring(0,3);
        _return+=ini;
        var st = num.substring(3,6);
        _return+="-"+st+"-";
        var end = num.substring(6,10);
        _return+=end;
  
        document.userForm.ophno.value ="";
        document.userForm.ophno.value =_return;
         
    }else if(num.length > 10)
    {
        //_return="(";
        var ini = num.substring(0,3);
        _return+=ini;
        var st = num.substring(3,6);
        _return+="-"+st+"-";
        var end = num.substring(6,10);
        _return+=end+"x";
        var ext = num.substring(10,num.length);
        _return+=ext;
        document.getElementById('tpResultMessage').innerHTML = "<font color=red>Phone Number should be 10 characters</font>";
        document.userForm.ophno.value =_return;
        document.userForm.ophno.value ="";
        document.userForm.ophno.focus();
        return false;
    }else if(num.length < 10)
    {
        document.getElementById('tpResultMessage').innerHTML = "<font color=red>Please give atleast  10 charcters in PhoneNumber</font>";
        document.userForm.ophno.value ="";
    }

    return _return;
}
//to convert given phone format to specified format((111)-111-1111) 
function generalFormatPhone(element) {     
    //alert("Hii");
    str = new String(element.value);    
    //var str = element.value;
    if(str == "undefined" ) { 
        document.getElementById('tpResultMessage').innerHTML = "<font color=red>Please give atleast  10 charcters in PhoneNumber</font>";
        return false;        
    }else{        
        var pattern =/^\(\d{3}\)\-\d{3}\-\d{4}$/;
        //        element.value=str.replace(/[A-Za-z\(\)\.\-\x\s,]/g, "");
        element.value=str.replace(pattern, "");
        num=element.value;
        var _return;
        if(num.length == 10) { 
            // _return="(";
            var ini = num.substring(0,3);
            _return+=ini;
            var st = num.substring(3,6);
            _return+="-"+st+"-";
            var end = num.substring(6,10);
            _return+=end;
            
            element.value ="";
            element.value =_return;
            
        }
        else if(num.length > 10)
        {
            //_return="(";
            var ini = num.substring(0,3);
            _return+=ini;
            var st = num.substring(3,6);
            _return+="-"+st+"-";
            var end = num.substring(6,10);
            _return+=end+"x";
            var ext = num.substring(10,num.length);
            _return+=ext;
          
            element.value ="";
            element.value =_return;
            
        }
        return _return;
    }
};

function validateEmail(thisObj)
{
    // alert('hi');
    var x = thisObj.value;	
    var atpos=x.indexOf("@");
    //alert('atpos----'+atpos);
    var dotpos=x.lastIndexOf(".");
    //alert('dotpos----'+dotpos);
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
    {  
        thisObj.value = "";
        document.getElementById('tpResultMessage').innerHTML = "<font color=red>Not a valid e-mail address</font>";
    //return false;
    }
}

function IBsender850()
{
    /* 850 inbound gs and st value */
    var n1 = document.getElementById('gs850senderIdIB');
    var n2 = document.getElementById('st850senderIdIB');
    n2.value = n1.value;
}
function IBversion850(){
    var versiongs850Ib=document.getElementById('gs850VersionIB');
    var versionst850Ib=document.getElementById('st850VersionIB');
    versionst850Ib.value=versiongs850Ib.value;
}
function IBrecId850(){
    var recIdgs850Ib=document.getElementById('gs850RecIdIB');
    var recIdst850Ib=document.getElementById('st850RecIdIB');
    recIdst850Ib.value=recIdgs850Ib.value;
}
/* 850 inbound gs and st value end*/
    
/* 855 inbound gs and st value */
function IBsender855()
{
    var senderIdgs855Ib = document.getElementById('gs855senderIdIB');
    var senderIdst855Ib = document.getElementById('st855senderIdIB');
    senderIdst855Ib.value = senderIdgs855Ib.value;
}
function IBversion855(){
    var versiongs855Ib=document.getElementById('gs855VersionIB');
    var versionst855Ib=document.getElementById('st855VersionIB');
    versionst855Ib.value=versiongs855Ib.value;
} 
function IBrecId855(){
    var recIdgs855Ib=document.getElementById('gs855RecIdIB');
    var recIdst855Ib=document.getElementById('st855RecIdIB');
    recIdst855Ib.value=recIdgs855Ib.value;
}
/* 855 inbound gs and st value end*/

/* 856 inbound gs and st value */
function IBsender856()
{
    var senderIdgs856Ib = document.getElementById('gs856senderIdIB');
    var senderIdst856Ib = document.getElementById('st856senderIdIB');
    senderIdst856Ib.value = senderIdgs856Ib.value;
}
function IBversion856(){
    var versiongs856Ib=document.getElementById('gs856VersionIB');
    var versionst856Ib=document.getElementById('st856VersionIB');
    versionst856Ib.value=versiongs856Ib.value;
} 
function IBrecId856(){
    var recIdgs856Ib=document.getElementById('gs856RecIdIB');
    var recIdst856Ib=document.getElementById('st856RecIdIB');
    recIdst856Ib.value=recIdgs856Ib.value;
}
/* 856 inbound gs and st value end*/

/* 810 inbound gs and st value */
function IBsender810()
{
    var senderIdgs810Ib = document.getElementById('gs810senderIdIB');
    var senderIdst810Ib = document.getElementById('st810senderIdIB');
    senderIdst810Ib.value = senderIdgs810Ib.value;
}
function IBversion810(){
    var versiongs810Ib=document.getElementById('gs810VersionIB');
    var versionst810Ib=document.getElementById('st810VersionIB');
    versionst810Ib.value=versiongs810Ib.value;
}
function IBrecId810(){
    var recIdgs810Ib=document.getElementById('gs810RecIdIB');
    var recIdst810Ib=document.getElementById('st810RecIdIB');
    recIdst810Ib.value=recIdgs810Ib.value;
}
/* 810 inbound gs and st value end*/
 
/*----------------- Outbound values copy  ------------------*/
 
/* 850 outbound gs and st value */
function OBsender850()
{
    var senderIdgs850Ob = document.getElementById('gs850senderIdOB');
    var senderIdst850Ob = document.getElementById('st850senderIdOB');
    senderIdst850Ob.value = senderIdgs850Ob.value;
}
function OBversion850(){
    var versiongs850Ob=document.getElementById('gs850VersionOB');
    var versionst850Ob=document.getElementById('st850VersionOB');
    versionst850Ob.value=versiongs850Ob.value;
}  
function OB850recId(){
    var recIdgs850Ob=document.getElementById('gs850RecIdOB');
    var recIdst850Ob=document.getElementById('st850RecIdOB');
    recIdst850Ob.value=recIdgs850Ob.value;
}
/* 850 outbound gs and st value end*/
    
/* 855 outbound gs and st value */
function OBsender855()
{
    var senderIdgs855Ob = document.getElementById('gs855senderIdOB');
    var senderIdst855Ob = document.getElementById('st855senderIdOB');
    senderIdst855Ob.value = senderIdgs855Ob.value;
}
function OBversion855(){
    var versiongs855Ob=document.getElementById('gs855VersionOB');
    var versionst855Ob=document.getElementById('st855VersionOB');
    versionst855Ob.value=versiongs855Ob.value;
}
function OB855recId(){
    var recIdgs855Ob=document.getElementById('gs855RecIdOB');
    var recIdst855Ob=document.getElementById('st855RecIdOB');
    recIdst855Ob.value=recIdgs855Ob.value;
}
/* 855 outbound gs and st value end*/

/* 856 outbound gs and st value */
function OBsender856()
{
    var senderIdgs856Ob = document.getElementById('gs856senderIdOB');
    var senderIdst856Ob = document.getElementById('st856senderIdOB');
    senderIdst856Ob.value = senderIdgs856Ob.value;
}
function OBversion856(){
    var versiongs856Ob=document.getElementById('gs856VersionOB');
    var versionst856Ob=document.getElementById('st856VersionOB');
    versionst856Ob.value=versiongs856Ob.value;
} 
function OB856recId(){
    var recIdgs856Ob=document.getElementById('gs856RecIdOB');
    var recIdst856Ob=document.getElementById('st856RecIdOB');
    recIdst856Ob.value=recIdgs856Ob.value;
}
/* 856 outbound gs and st value end*/

/* 810 outbound gs and st value */
function OBsender810()
{
    var senderIdgs810Ob = document.getElementById('gs810senderIdOB');
    var senderIdst810Ob = document.getElementById('st810senderIdOB');
    senderIdst810Ob.value = senderIdgs810Ob.value;
} 
function OBversion810(){
    var versiongs810Ob=document.getElementById('gs810VersionOB');
    var versionst810Ob=document.getElementById('st810VersionOB');
    versionst810Ob.value=versiongs810Ob.value;
}
function OB810recId(){
    var recIdgs810Ob=document.getElementById('gs810RecIdOB');
    var recIdst810Ob=document.getElementById('st810RecIdOB');
    recIdst810Ob.value=recIdgs810Ob.value;
/* 810 outbound gs and st value end*/
   
}

 
var ib850="";
var ib855="";
var ib856="";
var ib810="";
var ob850="";
var ob855="";
var ob856="";
var ob810="";
       
function checkib850(){
    var ibtransaction=document.getElementById("ibvalue850").value;
    var ibdirection=document.getElementById("ibdirection").value;
    var isa850senderIdIB=document.getElementById("isa850senderIdIB").value;
    var gs850senderIdIB=document.getElementById("gs850senderIdIB").value;
    var st850senderIdIB=document.getElementById("st850senderIdIB").value;
    var isa850RecIdIB=document.getElementById("isa850RecIdIB").value;
    var gs850RecIdIB=document.getElementById("gs850RecIdIB").value;
    var st850RecIdIB=document.getElementById("st850RecIdIB").value;
    var isa850VersionIB=document.getElementById("isa850VersionIB").value;
    var gs850VersionIB=document.getElementById("gs850VersionIB").value;
    var st850VersionIB=document.getElementById("st850VersionIB").value;
    var fun850GroupIdIB=document.getElementById("fun850GroupIdIB").value;
    var res850AgecodeIB=document.getElementById("res850AgecodeIB").value;
    var gen850AckIB=document.getElementById("gen850AckIB").checked;
    var trans850IdcodeIB=document.getElementById("trans850IdcodeIB").value;
    
    if(isa850senderIdIB.length==0 || isa850senderIdIB == "" || isa850senderIdIB==null){
        document.getElementById('resultMessage').innerHTML = "<font color=red>Please enter senderId ISA.</font>";
        return false;   
    }else if(gs850senderIdIB.length==0 || gs850senderIdIB == "" || gs850senderIdIB==null){
        document.getElementById('resultMessage').innerHTML = "<font color=red>Please enter senderId GS.</font>";
        return false;   
    }else if(st850senderIdIB.length==0 || st850senderIdIB == "" || st850senderIdIB==null){
        document.getElementById('resultMessage').innerHTML = "<font color=red>Please enter senderId ST.</font>";
        return false;   
    }else if(isa850RecIdIB.length==0 || isa850RecIdIB == "" || isa850RecIdIB==null){
        document.getElementById('resultMessage').innerHTML = "<font color=red>Please enter RecieverId ISA.</font>";
        return false;   
    }else if(gs850RecIdIB.length==0 || gs850RecIdIB == "" || gs850RecIdIB==null){
        document.getElementById('resultMessage').innerHTML = "<font color=red>Please enter RecieverId GS.</font>";
        return false;   
    }else if(st850RecIdIB.length==0 || st850RecIdIB == "" || st850RecIdIB==null){
        document.getElementById('resultMessage').innerHTML = "<font color=red>Please enter RecieverId ST.</font>";
        return false;   
    }else if(isa850VersionIB.length==0 || isa850VersionIB == "" || isa850VersionIB==null){
        document.getElementById('resultMessage').innerHTML = "<font color=red>Please enter Version ISA.</font>";
        return false;   
    }else if(gs850VersionIB.length==0 || gs850VersionIB == "" || gs850VersionIB==null){
        document.getElementById('resultMessage').innerHTML = "<font color=red>Please enter Version GS.</font>";
        return false;   
    }else if(st850VersionIB.length==0 || st850VersionIB == "" || st850VersionIB==null){
        document.getElementById('resultMessage').innerHTML = "<font color=red>Please enter Version ST.</font>";
        return false;   
    }else if(fun850GroupIdIB.length==0 || fun850GroupIdIB == "" || fun850GroupIdIB==null){
        document.getElementById('resultMessage').innerHTML = "<font color=red>Please enter Functional ID Code.</font>";
        return false;   
    }else if(res850AgecodeIB.length==0 || res850AgecodeIB == "" || res850AgecodeIB==null){
        document.getElementById('resultMessage').innerHTML = "<font color=red>Please enter Responsible Agency Code.</font>";
        return false;   
    }
   
    if(isa850senderIdIB!= null || isa850senderIdIB!=""){
        if(gs850senderIdIB!= null && gs850senderIdIB!=""){
            if(st850senderIdIB!= null && st850senderIdIB!=""){
                if(isa850RecIdIB!= null && isa850RecIdIB!=""){
                    if(gs850RecIdIB!= null && gs850RecIdIB!=""){
                        if(st850RecIdIB!= null && st850RecIdIB!=""){
                            if(isa850VersionIB!= null && isa850VersionIB!=""){
                                if(gs850VersionIB!= null && gs850VersionIB!=""){
                                    if(st850VersionIB!= null && st850VersionIB!=""){
                                        if(fun850GroupIdIB!= null && fun850GroupIdIB!=""){
                                            if(res850AgecodeIB!= null && res850AgecodeIB!=""){
                                                ib850 = ibtransaction+"@"+ibdirection+"@"+isa850senderIdIB+"@"+gs850senderIdIB+"@"+st850senderIdIB+"@"+isa850RecIdIB+"@"+gs850RecIdIB+"@"+st850RecIdIB+"@"+isa850VersionIB+"@"+gs850VersionIB+"@"+st850VersionIB+"@"+fun850GroupIdIB+"@"+res850AgecodeIB+"@"+gen850AckIB+"@"+trans850IdcodeIB; 
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    document.getElementById("IB850Transaction").value=ib850;
//alert("850 transaction "+document.getElementById("IB850Transaction").value);
}
function checkib855(){
    var ibtransaction=document.getElementById("ibvalue855").value;
    var ibdirection=document.getElementById("ibdirection855").value;
    var isa855senderIdIB=document.getElementById("isa855senderIdIB").value;
    var gs855senderIdIB=document.getElementById("gs855senderIdIB").value;
    var st855senderIdIB=document.getElementById("st855senderIdIB").value;
    var isa855RecIdIB=document.getElementById("isa855RecIdIB").value;
    var gs855RecIdIB=document.getElementById("gs855RecIdIB").value;
    var st855RecIdIB=document.getElementById("st855RecIdIB").value;
    var isa855VersionIB=document.getElementById("isa855VersionIB").value;
    var gs855VersionIB=document.getElementById("gs855VersionIB").value;
    var st855VersionIB=document.getElementById("st855VersionIB").value;
    var fun855GroupIdIB=document.getElementById("fun855GroupIdIB").value;
    var res855AgecodeIB=document.getElementById("res855AgecodeIB").value;
    var gen855AckIB=document.getElementById("gen855AckIB").checked;
    var trans855IdcodeIB=document.getElementById("trans855IdcodeIB").value;
       
    if(isa855senderIdIB.length==0 || isa855senderIdIB == " " || isa855senderIdIB==null){
        document.getElementById('resultMessage855ib').innerHTML = "<font color=red>Please enter senderId ISA.</font>";
        return false;   
    }else if(gs855senderIdIB.length==0 || gs855senderIdIB == "" || gs855senderIdIB==null){
        document.getElementById('resultMessage855ib').innerHTML = "<font color=red>Please enter senderId GS.</font>";
        return false;   
    }else if(st855senderIdIB.length==0 || st855senderIdIB == "" || st855senderIdIB==null){
        document.getElementById('resultMessage855ib').innerHTML = "<font color=red>Please enter senderId ST.</font>";
        return false;   
    }else if(isa855RecIdIB.length==0 || isa855RecIdIB == "" || isa855RecIdIB==null){
        document.getElementById('resultMessage855ib').innerHTML = "<font color=red>Please enter RecieverId ISA.</font>";
        return false;   
    }else if(gs855RecIdIB.length==0 || gs855RecIdIB == "" || gs855RecIdIB==null){
        document.getElementById('resultMessage855ib').innerHTML = "<font color=red>Please enter RecieverId GS.</font>";
        return false;   
    }else if(st855RecIdIB.length==0 || st855RecIdIB == "" || st855RecIdIB==null){
        document.getElementById('resultMessage855ib').innerHTML = "<font color=red>Please enter RecieverId ST.</font>";
        return false;   
    }else if(isa855VersionIB.length==0 || isa855VersionIB == "" || isa855VersionIB==null){
        document.getElementById('resultMessage855ib').innerHTML = "<font color=red>Please enter Version ISA.</font>";
        return false;   
    }else if(gs855VersionIB.length==0 || gs855VersionIB == "" || gs855VersionIB==null){
        document.getElementById('resultMessage855ib').innerHTML = "<font color=red>Please enter Version GS.</font>";
        return false;   
    }else if(st855VersionIB.length==0 || st855VersionIB == "" || st855VersionIB==null){
        document.getElementById('resultMessage855ib').innerHTML = "<font color=red>Please enter Version ST.</font>";
        return false;   
    }else if(fun855GroupIdIB.length==0 || fun855GroupIdIB == "" || fun855GroupIdIB==null){
        document.getElementById('resultMessage855ib').innerHTML = "<font color=red>Please enter Functional ID Code.</font>";
        return false;   
    }else if(res855AgecodeIB.length==0 || res855AgecodeIB == "" || res855AgecodeIB==null){
        document.getElementById('resultMessage855ib').innerHTML = "<font color=red>Please enter Responsible Agency Code.</font>";
        return false;   
    }
   
    if(isa855senderIdIB!= null || isa855senderIdIB!=""){
        if(gs855senderIdIB!= null && gs855senderIdIB!=""){
            if(st855senderIdIB!= null && st855senderIdIB!=""){
                if(isa855RecIdIB!= null && isa855RecIdIB!=""){
                    if(gs855RecIdIB!= null && gs855RecIdIB!=""){
                        if(st855RecIdIB!= null && st855RecIdIB!=""){
                            if(isa855VersionIB!= null && isa855VersionIB!=""){
                                if(gs855VersionIB!= null && gs855VersionIB!=""){
                                    if(st855VersionIB!= null && st855VersionIB!=""){
                                        if(fun855GroupIdIB!= null && fun855GroupIdIB!=""){
                                            if(res855AgecodeIB!= null && res855AgecodeIB!=""){
                                                ib855 = ibtransaction+"@"+ibdirection+"@"+isa855senderIdIB+"@"+gs855senderIdIB+"@"+st855senderIdIB+"@"+isa855RecIdIB+"@"+gs855RecIdIB+"@"+st855RecIdIB+"@"+isa855VersionIB+"@"+gs855VersionIB+"@"+st855VersionIB+"@"+fun855GroupIdIB+"@"+res855AgecodeIB+"@"+gen855AckIB+"@"+trans855IdcodeIB; 
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    document.getElementById("IB855Transaction").value=ib855;
  //  alert("ib 855 transaction "+document.getElementById("IB855Transaction").value);     
   
}
        
function checkib856()
{
    var ibtransaction=document.getElementById("ibvalue856").value;
    var ibdirection=document.getElementById("ibdirection856").value;
    var isa856senderIdIB=document.getElementById("isa856senderIdIB").value;
    var gs856senderIdIB=document.getElementById("gs856senderIdIB").value;
    var st856senderIdIB=document.getElementById("st856senderIdIB").value;
    var isa856RecIdIB=document.getElementById("isa856RecIdIB").value;
    var gs856RecIdIB=document.getElementById("gs856RecIdIB").value;
    var st856RecIdIB=document.getElementById("st856RecIdIB").value;
    var isa856VersionIB=document.getElementById("isa856VersionIB").value;
    var gs856VersionIB=document.getElementById("gs856VersionIB").value;
    var st856VersionIB=document.getElementById("st856VersionIB").value;
    var fun856GroupIdIB=document.getElementById("fun856GroupIdIB").value;
    var res856AgecodeIB=document.getElementById("res856AgecodeIB").value;
    var gen856AckIB=document.getElementById("gen856AckIB").checked;
    var trans856IdcodeIB=document.getElementById("trans856IdcodeIB").value;
  
    if(isa856senderIdIB.length==0 || isa856senderIdIB == "" || isa856senderIdIB==null){
        document.getElementById('resultMessage856ib').innerHTML = "<font color=red>Please enter senderId ISA.</font>";
        return false;   
    }else if(gs856senderIdIB.length==0 || gs856senderIdIB == "" || gs856senderIdIB==null){
        document.getElementById('resultMessage856ib').innerHTML = "<font color=red>Please enter senderId GS.</font>";
        return false;   
    }else if(st856senderIdIB.length==0 || st856senderIdIB == "" || st856senderIdIB==null){
        document.getElementById('resultMessage856ib').innerHTML = "<font color=red>Please enter senderId ST.</font>";
        return false;   
    }else if(isa856RecIdIB.length==0 || isa856RecIdIB == "" || isa856RecIdIB==null){
        document.getElementById('resultMessage856ib').innerHTML = "<font color=red>Please enter RecieverId ISA.</font>";
        return false;   
    }else if(gs856RecIdIB.length==0 || gs856RecIdIB == "" || gs856RecIdIB==null){
        document.getElementById('resultMessage856ib').innerHTML = "<font color=red>Please enter RecieverId GS.</font>";
        return false;   
    }else if(st856RecIdIB.length==0 || st856RecIdIB == "" || st856RecIdIB==null){
        document.getElementById('resultMessage856ib').innerHTML = "<font color=red>Please enter RecieverId ST.</font>";
        return false;   
    }else if(isa856VersionIB.length==0 || isa856VersionIB == "" || isa856VersionIB==null){
        document.getElementById('resultMessage856ib').innerHTML = "<font color=red>Please enter Version ISA.</font>";
        return false;   
    }else if(gs856VersionIB.length==0 || gs856VersionIB == "" || gs856VersionIB==null){
        document.getElementById('resultMessage856ib').innerHTML = "<font color=red>Please enter Version GS.</font>";
        return false;   
    }else if(st856VersionIB.length==0 || st856VersionIB == "" || st856VersionIB==null){
        document.getElementById('resultMessage856ib').innerHTML = "<font color=red>Please enter Version ST.</font>";
        return false;   
    }else if(fun856GroupIdIB.length==0 || fun856GroupIdIB == "" || fun856GroupIdIB==null){
        document.getElementById('resultMessage856ib').innerHTML = "<font color=red>Please enter Functional ID Code.</font>";
        return false;   
    }else if(res856AgecodeIB.length==0 || res856AgecodeIB == "" || res856AgecodeIB==null){
        document.getElementById('resultMessage856ib').innerHTML = "<font color=red>Please enter Responsible Agency Code.</font>";
        return false;   
    }
   
    if(isa856senderIdIB!= null || isa856senderIdIB!=""){
        if(gs856senderIdIB!= null && gs856senderIdIB!=""){
            if(st856senderIdIB!= null && st856senderIdIB!=""){
                if(isa856RecIdIB!= null && isa856RecIdIB!=""){
                    if(gs856RecIdIB!= null && gs856RecIdIB!=""){
                        if(st856RecIdIB!= null && st856RecIdIB!=""){
                            if(isa856VersionIB!= null && isa856VersionIB!=""){
                                if(gs856VersionIB!= null && gs856VersionIB!=""){
                                    if(st856VersionIB!= null && st856VersionIB!=""){
                                        if(fun856GroupIdIB!= null && fun856GroupIdIB!=""){
                                            if(res856AgecodeIB!= null && res856AgecodeIB!=""){
                                                ib856 = ibtransaction+"@"+ibdirection+"@"+isa856senderIdIB+"@"+gs856senderIdIB+"@"+st856senderIdIB+"@"+isa856RecIdIB+"@"+gs856RecIdIB+"@"+st856RecIdIB+"@"+isa856VersionIB+"@"+gs856VersionIB+"@"+st856VersionIB+"@"+fun856GroupIdIB+"@"+res856AgecodeIB+"@"+gen856AckIB+"@"+trans856IdcodeIB; 
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    document.getElementById("IB856Transaction").value=ib856;
//alert("ib 856 transaction "+document.getElementById("IB856Transaction").value);     
   
}
        
function checkib810()
{
    var ibtransaction=document.getElementById("ibvalue810").value;
    var ibdirection=document.getElementById("ibdirection810").value;
    var isa810senderIdIB=document.getElementById("isa810senderIdIB").value;
    var gs810senderIdIB=document.getElementById("gs810senderIdIB").value;
    var st810senderIdIB=document.getElementById("st810senderIdIB").value;
    var isa810RecIdIB=document.getElementById("isa810RecIdIB").value;
    var gs810RecIdIB=document.getElementById("gs810RecIdIB").value;
    var st810RecIdIB=document.getElementById("st810RecIdIB").value;
    var isa810VersionIB=document.getElementById("isa810VersionIB").value;
    var gs810VersionIB=document.getElementById("gs810VersionIB").value;
    var st810VersionIB=document.getElementById("st810VersionIB").value;
    var fun810GroupIdIB=document.getElementById("fun810GroupIdIB").value;
    var res810AgecodeIB=document.getElementById("res810AgecodeIB").value;
    var gen810AckIB=document.getElementById("gen810AckIB").checked;
    var trans810IdcodeIB=document.getElementById("trans810IdcodeIB").value;
    
    if(isa810senderIdIB.length==0 || isa810senderIdIB == "" || isa810senderIdIB==null){
        document.getElementById('resultMessage810ib').innerHTML = "<font color=red>Please enter senderId ISA.</font>";
        return false;   
    }else if(gs810senderIdIB.length==0 || gs810senderIdIB == "" || gs810senderIdIB==null){
        document.getElementById('resultMessage810ib').innerHTML = "<font color=red>Please enter senderId GS.</font>";
        return false;   
    }else if(st810senderIdIB.length==0 || st810senderIdIB == "" || st810senderIdIB==null){
        document.getElementById('resultMessage810ib').innerHTML = "<font color=red>Please enter senderId ST.</font>";
        return false;   
    }else if(isa810RecIdIB.length==0 || isa810RecIdIB == "" || isa810RecIdIB==null){
        document.getElementById('resultMessage810ib').innerHTML = "<font color=red>Please enter RecieverId ISA.</font>";
        return false;   
    }else if(gs810RecIdIB.length==0 || gs810RecIdIB == "" || gs810RecIdIB==null){
        document.getElementById('resultMessage810ib').innerHTML = "<font color=red>Please enter RecieverId GS.</font>";
        return false;   
    }else if(st810RecIdIB.length==0 || st810RecIdIB == "" || st810RecIdIB==null){
        document.getElementById('resultMessage810ib').innerHTML = "<font color=red>Please enter RecieverId ST.</font>";
        return false;   
    }else if(isa810VersionIB.length==0 || isa810VersionIB == "" || isa810VersionIB==null){
        document.getElementById('resultMessage810ib').innerHTML = "<font color=red>Please enter Version ISA.</font>";
        return false;   
    }else if(gs810VersionIB.length==0 || gs810VersionIB == "" || gs810VersionIB==null){
        document.getElementById('resultMessage810ib').innerHTML = "<font color=red>Please enter Version GS.</font>";
        return false;   
    }else if(st810VersionIB.length==0 || st810VersionIB == "" || st810VersionIB==null){
        document.getElementById('resultMessage810ib').innerHTML = "<font color=red>Please enter Version ST.</font>";
        return false;   
    }else if(fun810GroupIdIB.length==0 || fun810GroupIdIB == "" || fun810GroupIdIB==null){
        document.getElementById('resultMessage810ib').innerHTML = "<font color=red>Please enter Functional ID Code.</font>";
        return false;   
    }else if(res810AgecodeIB.length==0 || res810AgecodeIB == "" || res810AgecodeIB==null){
        document.getElementById('resultMessage810ib').innerHTML = "<font color=red>Please enter Responsible Agency Code.</font>";
        return false;   
    }
   
    if(isa810senderIdIB!= null || isa810senderIdIB!=""){
        if(gs810senderIdIB!= null && gs810senderIdIB!=""){
            if(st810senderIdIB!= null && st810senderIdIB!=""){
                if(isa810RecIdIB!= null && isa810RecIdIB!=""){
                    if(gs810RecIdIB!= null && gs810RecIdIB!=""){
                        if(st810RecIdIB!= null && st810RecIdIB!=""){
                            if(isa810VersionIB!= null && isa810VersionIB!=""){
                                if(gs810VersionIB!= null && gs810VersionIB!=""){
                                    if(st810VersionIB!= null && st810VersionIB!=""){
                                        if(fun810GroupIdIB!= null && fun810GroupIdIB!=""){
                                            if(res810AgecodeIB!= null && res810AgecodeIB!=""){
                                                ib810 = ibtransaction+"@"+ibdirection+"@"+isa810senderIdIB+"@"+gs810senderIdIB+"@"+st810senderIdIB+"@"+isa810RecIdIB+"@"+gs810RecIdIB+"@"+st810RecIdIB+"@"+isa810VersionIB+"@"+gs810VersionIB+"@"+st810VersionIB+"@"+fun810GroupIdIB+"@"+res810AgecodeIB+"@"+gen810AckIB+"@"+trans810IdcodeIB; 
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    document.getElementById("IB810Transaction").value=ib810;
//alert("ib 810 transaction "+document.getElementById("IB810Transaction").value);  
}
        
function checkob850()
{
    //alert("into checkob850");
    var obtransaction=document.getElementById("obvalue850").value;
    var obdirection=document.getElementById("obdirection").value;
    var isa850senderIdOB=document.getElementById("isa850senderIdOB").value;
    var gs850senderIdOB=document.getElementById("gs850senderIdOB").value;
    var st850senderIdOB=document.getElementById("st850senderIdOB").value;
    var isa850RecIdOB=document.getElementById("isa850RecIdOB").value;
    var gs850RecIdOB=document.getElementById("gs850RecIdOB").value;
    var st850RecIdOB=document.getElementById("st850RecIdOB").value;
    var isa850VersionOB=document.getElementById("isa850VersionOB").value;
    var gs850VersionOB=document.getElementById("gs850VersionOB").value;
    var st850VersionOB=document.getElementById("st850VersionOB").value;
    var fun850GroupIdOB=document.getElementById("fun850GroupIdOB").value;
    var res850AgecodeOB=document.getElementById("res850AgecodeOB").value;
    var gen850AckOB=document.getElementById("gen850AckOB").checked;
    var trans850IdcodeOB=document.getElementById("trans850IdcodeOB").value;

    if(isa850senderIdOB.length==0 || isa850senderIdOB == "" || isa850senderIdOB==null){
        document.getElementById('resultMessage850ob').innerHTML = "<font color=red>Please enter senderId ISA.</font>";
        return false;   
    }else if(gs850senderIdOB.length==0 || gs850senderIdOB == "" || gs850senderIdOB==null){
        document.getElementById('resultMessage850ob').innerHTML = "<font color=red>Please enter senderId GS.</font>";
        return false;   
    }else if(st850senderIdOB.length==0 || st850senderIdOB == "" || st850senderIdOB==null){
        document.getElementById('resultMessage850ob').innerHTML = "<font color=red>Please enter senderId ST.</font>";
        return false;   
    }else if(isa850RecIdOB.length==0 || isa850RecIdOB == "" || isa850RecIdOB==null){
        document.getElementById('resultMessage850ob').innerHTML = "<font color=red>Please enter RecieverId ISA.</font>";
        return false;   
    }else if(gs850RecIdOB.length==0 || gs850RecIdOB == "" || gs850RecIdOB==null){
        document.getElementById('resultMessage850ob').innerHTML = "<font color=red>Please enter RecieverId GS.</font>";
        return false;   
    }else if(st850RecIdOB.length==0 || st850RecIdOB == "" || st850RecIdOB==null){
        document.getElementById('resultMessage850ob').innerHTML = "<font color=red>Please enter RecieverId ST.</font>";
        return false;   
    }else if(isa850VersionOB.length==0 || isa850VersionOB == "" || isa850VersionOB==null){
        document.getElementById('resultMessage850ob').innerHTML = "<font color=red>Please enter Version ISA.</font>";
        return false;   
    }else if(gs850VersionOB.length==0 || gs850VersionOB == "" || gs850VersionOB==null){
        document.getElementById('resultMessage850ob').innerHTML = "<font color=red>Please enter Version GS.</font>";
        return false;   
    }else if(st850VersionOB.length==0 || st850VersionOB == "" || st850VersionOB==null){
        document.getElementById('resultMessage850ob').innerHTML = "<font color=red>Please enter Version ST.</font>";
        return false;   
    }else if(fun850GroupIdOB.length==0 || fun850GroupIdOB == "" || fun850GroupIdOB==null){
        document.getElementById('resultMessage850ob').innerHTML = "<font color=red>Please enter Functional ID Code.</font>";
        return false;   
    }else if(res850AgecodeOB.length==0 || res850AgecodeOB == "" || res850AgecodeOB==null){
        document.getElementById('resultMessage850ob').innerHTML = "<font color=red>Please enter Responsible Agency Code.</font>";
        return false;   
    }
   
    if(isa850senderIdOB!= null || isa850senderIdOB!=""){
        if(gs850senderIdOB!= null && gs850senderIdOB!=""){
            if(st850senderIdOB!= null && st850senderIdOB!=""){
                if(isa850RecIdOB!= null && isa850RecIdOB!=""){
                    if(gs850RecIdOB!= null && gs850RecIdOB!=""){
                        if(st850RecIdOB!= null && st850RecIdOB!=""){
                            if(isa850VersionOB!= null && isa850VersionOB!=""){
                                if(gs850VersionOB!= null && gs850VersionOB!=""){
                                    if(st850VersionOB!= null && st850VersionOB!=""){
                                        if(fun850GroupIdOB!= null && fun850GroupIdOB!=""){
                                            if(res850AgecodeOB!= null && res850AgecodeOB!=""){
                                                ob850 = obtransaction+"@"+obdirection+"@"+isa850senderIdOB+"@"+gs850senderIdOB+"@"+st850senderIdOB+"@"+isa850RecIdOB+"@"+gs850RecIdOB+"@"+st850RecIdOB+"@"+isa850VersionOB+"@"+gs850VersionOB+"@"+st850VersionOB+"@"+fun850GroupIdOB+"@"+res850AgecodeOB+"@"+gen850AckOB+"@"+trans850IdcodeOB; 
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    document.getElementById("OB850Transaction").value=ob850;
//alert("ob 850 transaction "+document.getElementById("OB850Transaction").value);  
}
        
        
function checkob855()
{
    //alert("into 855ob");
    var obtransaction=document.getElementById("obvalue855").value;
    var obdirection=document.getElementById("obdirection855").value;
    var isa855senderIdOB=document.getElementById("isa855senderIdOB").value;
    var gs855senderIdOB=document.getElementById("gs855senderIdOB").value;
    var st855senderIdOB=document.getElementById("st855senderIdOB").value;
    var isa855RecIdOB=document.getElementById("isa855RecIdOB").value;
    var gs855RecIdOB=document.getElementById("gs855RecIdOB").value;
    var st855RecIdOB=document.getElementById("st855RecIdOB").value;
    var isa855VersionOB=document.getElementById("isa855VersionOB").value;
    var gs855VersionOB=document.getElementById("gs855VersionOB").value;
    var st855VersionOB=document.getElementById("st855VersionOB").value;
    var fun855GroupIdOB=document.getElementById("fun855GroupIdOB").value;
    var res855AgecodeOB=document.getElementById("res855AgecodeOB").value;
    var gen855AckOB=document.getElementById("gen855AckOB").checked;
    var trans855IdcodeOB=document.getElementById("trans855IdcodeOB").value;

    if(isa855senderIdOB.length==0 || isa855senderIdOB == "" || isa855senderIdOB==null){
        document.getElementById('resultMessage855ob').innerHTML = "<font color=red>Please enter senderId ISA.</font>";
        return false;   
    }else if(gs855senderIdOB.length==0 || gs855senderIdOB == "" || gs855senderIdOB==null){
        document.getElementById('resultMessage855ob').innerHTML = "<font color=red>Please enter senderId GS.</font>";
        return false;   
    }else if(st855senderIdOB.length==0 || st855senderIdOB == "" || st855senderIdOB==null){
        document.getElementById('resultMessage855ob').innerHTML = "<font color=red>Please enter senderId ST.</font>";
        return false;   
    }else if(isa855RecIdOB.length==0 || isa855RecIdOB == "" || isa855RecIdOB==null){
        document.getElementById('resultMessage855ob').innerHTML = "<font color=red>Please enter RecieverId ISA.</font>";
        return false;   
    }else if(gs855RecIdOB.length==0 || gs855RecIdOB == "" || gs855RecIdOB==null){
        document.getElementById('resultMessage855ob').innerHTML = "<font color=red>Please enter RecieverId GS.</font>";
        return false;   
    }else if(st855RecIdOB.length==0 || st855RecIdOB == "" || st855RecIdOB==null){
        document.getElementById('resultMessage855ob').innerHTML = "<font color=red>Please enter RecieverId ST.</font>";
        return false;   
    }else if(isa855VersionOB.length==0 || isa855VersionOB == "" || isa855VersionOB==null){
        document.getElementById('resultMessage855ob').innerHTML = "<font color=red>Please enter Version ISA.</font>";
        return false;   
    }else if(gs855VersionOB.length==0 || gs855VersionOB == "" || gs855VersionOB==null){
        document.getElementById('resultMessage855ob').innerHTML = "<font color=red>Please enter Version GS.</font>";
        return false;   
    }else if(st855VersionOB.length==0 || st855VersionOB == "" || st855VersionOB==null){
        document.getElementById('resultMessage855ob').innerHTML = "<font color=red>Please enter Version ST.</font>";
        return false;   
    }else if(fun855GroupIdOB.length==0 || fun855GroupIdOB == "" || fun855GroupIdOB==null){
        document.getElementById('resultMessage855ob').innerHTML = "<font color=red>Please enter Functional ID Code.</font>";
        return false;   
    }else if(res855AgecodeOB.length==0 || res855AgecodeOB == "" || res855AgecodeOB==null){
        document.getElementById('resultMessage855ob').innerHTML = "<font color=red>Please enter Responsible Agency Code.</font>";
        return false;   
    }
   
    if(isa855senderIdOB!= null || isa855senderIdOB!=""){
        if(gs855senderIdOB!= null && gs855senderIdOB!=""){
            if(st855senderIdOB!= null && st855senderIdOB!=""){
                if(isa855RecIdOB!= null && isa855RecIdOB!=""){
                    if(gs855RecIdOB!= null && gs855RecIdOB!=""){
                        if(st855RecIdOB!= null && st855RecIdOB!=""){
                            if(isa855VersionOB!= null && isa855VersionOB!=""){
                                if(gs855VersionOB!= null && gs855VersionOB!=""){
                                    if(st855VersionOB!= null && st855VersionOB!=""){
                                        if(fun855GroupIdOB!= null && fun855GroupIdOB!=""){
                                            if(res855AgecodeOB!= null && res855AgecodeOB!=""){
                                                ob855 = obtransaction+"@"+obdirection+"@"+isa855senderIdOB+"@"+gs855senderIdOB+"@"+st855senderIdOB+"@"+isa855RecIdOB+"@"+gs855RecIdOB+"@"+st855RecIdOB+"@"+isa855VersionOB+"@"+gs855VersionOB+"@"+st855VersionOB+"@"+fun855GroupIdOB+"@"+res855AgecodeOB+"@"+gen855AckOB+"@"+trans855IdcodeOB; 
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    document.getElementById("OB855Transaction").value=ob855;
//alert("ob 855 transaction "+document.getElementById("OB855Transaction").value);  
}
        
        
        
function checkob856()
{
    var obtransaction=document.getElementById("obvalue856").value;
    var obdirection=document.getElementById("obdirection856").value;
    var isa856senderIdOB=document.getElementById("isa856senderIdOB").value;
    var gs856senderIdOB=document.getElementById("gs856senderIdOB").value;
    var st856senderIdOB=document.getElementById("st856senderIdOB").value;
    var isa856RecIdOB=document.getElementById("isa856RecIdOB").value;
    var gs856RecIdOB=document.getElementById("gs856RecIdOB").value;
    var st856RecIdOB=document.getElementById("st856RecIdOB").value;
    var isa856VersionOB=document.getElementById("isa856VersionOB").value;
    var gs856VersionOB=document.getElementById("gs856VersionOB").value;
    var st856VersionOB=document.getElementById("st856VersionOB").value;
    var fun856GroupIdOB=document.getElementById("fun856GroupIdOB").value;
    var res856AgecodeOB=document.getElementById("res856AgecodeOB").value;
    var gen856AckOB=document.getElementById("gen856AckOB").checked;
    var trans856IdcodeOB=document.getElementById("trans856IdcodeOB").value;
   
    if(isa856senderIdOB.length==0 || isa856senderIdOB == "" || isa856senderIdOB==null){
        document.getElementById('resultMessage856ob').innerHTML = "<font color=red>Please enter senderId ISA.</font>";
        return false;   
    }else if(gs856senderIdOB.length==0 || gs856senderIdOB == "" || gs856senderIdOB==null){
        document.getElementById('resultMessage856ob').innerHTML = "<font color=red>Please enter senderId GS.</font>";
        return false;   
    }else if(st856senderIdOB.length==0 || st856senderIdOB == "" || st856senderIdOB==null){
        document.getElementById('resultMessage856ob').innerHTML = "<font color=red>Please enter senderId ST.</font>";
        return false;   
    }else if(isa856RecIdOB.length==0 || isa856RecIdOB == "" || isa856RecIdOB==null){
        document.getElementById('resultMessage856ob').innerHTML = "<font color=red>Please enter RecieverId ISA.</font>";
        return false;   
    }else if(gs856RecIdOB.length==0 || gs856RecIdOB == "" || gs856RecIdOB==null){
        document.getElementById('resultMessage856ob').innerHTML = "<font color=red>Please enter RecieverId GS.</font>";
        return false;   
    }else if(st856RecIdOB.length==0 || st856RecIdOB == "" || st856RecIdOB==null){
        document.getElementById('resultMessage856ob').innerHTML = "<font color=red>Please enter RecieverId ST.</font>";
        return false;   
    }else if(isa856VersionOB.length==0 || isa856VersionOB == "" || isa856VersionOB==null){
        document.getElementById('resultMessage856ob').innerHTML = "<font color=red>Please enter Version ISA.</font>";
        return false;   
    }else if(gs856VersionOB.length==0 || gs856VersionOB == "" || gs856VersionOB==null){
        document.getElementById('resultMessage856ob').innerHTML = "<font color=red>Please enter Version GS.</font>";
        return false;   
    }else if(st856VersionOB.length==0 || st856VersionOB == "" || st856VersionOB==null){
        document.getElementById('resultMessage856ob').innerHTML = "<font color=red>Please enter Version ST.</font>";
        return false;   
    }else if(fun856GroupIdOB.length==0 || fun856GroupIdOB == "" || fun856GroupIdOB==null){
        document.getElementById('resultMessage856ob').innerHTML = "<font color=red>Please enter Functional ID Code.</font>";
        return false;   
    }else if(res856AgecodeOB.length==0 || res856AgecodeOB == "" || res856AgecodeOB==null){
        document.getElementById('resultMessage856ob').innerHTML = "<font color=red>Please enter Responsible Agency Code.</font>";
        return false;   
    }
   
    if(isa856senderIdOB!= null || isa856senderIdOB!=""){
        if(gs856senderIdOB!= null && gs856senderIdOB!=""){
            if(st856senderIdOB!= null && st856senderIdOB!=""){
                if(isa856RecIdOB!= null && isa856RecIdOB!=""){
                    if(gs856RecIdOB!= null && gs856RecIdOB!=""){
                        if(st856RecIdOB!= null && st856RecIdOB!=""){
                            if(isa856VersionOB!= null && isa856VersionOB!=""){
                                if(gs856VersionOB!= null && gs856VersionOB!=""){
                                    if(st856VersionOB!= null && st856VersionOB!=""){
                                        if(fun856GroupIdOB!= null && fun856GroupIdOB!=""){
                                            if(res856AgecodeOB!= null && res856AgecodeOB!=""){
                                                ob856 = obtransaction+"@"+obdirection+"@"+isa856senderIdOB+"@"+gs856senderIdOB+"@"+st856senderIdOB+"@"+isa856RecIdOB+"@"+gs856RecIdOB+"@"+st856RecIdOB+"@"+isa856VersionOB+"@"+gs856VersionOB+"@"+st856VersionOB+"@"+fun856GroupIdOB+"@"+res856AgecodeOB+"@"+gen856AckOB+"@"+trans856IdcodeOB; 
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    document.getElementById("OB856Transaction").value=ob856;
//alert("ob 856 transaction "+document.getElementById("OB856Transaction").value); 
}
        
        
function checkob810()
{
    //alert("into check0b810");
    var obtransaction=document.getElementById("obvalue810").value;
    var obdirection=document.getElementById("obdirection810").value;
    var isa810senderIdOB=document.getElementById("isa810senderIdOB").value;
    var gs810senderIdOB=document.getElementById("gs810senderIdOB").value;
    var st810senderIdOB=document.getElementById("st810senderIdOB").value;
    var isa810RecIdOB=document.getElementById("isa810RecIdOB").value;
    var gs810RecIdOB=document.getElementById("gs810RecIdOB").value;
    var st810RecIdOB=document.getElementById("st810RecIdOB").value;
    var isa810VersionOB=document.getElementById("isa810VersionOB").value;
    var gs810VersionOB=document.getElementById("gs810VersionOB").value;
    var st810VersionOB=document.getElementById("st810VersionOB").value;
    var fun810GroupIdOB=document.getElementById("fun810GroupIdOB").value;
    var res810AgecodeOB=document.getElementById("res810AgecodeOB").value;
    var gen810AckOB=document.getElementById("gen810AckOB").checked;
    var trans810IdcodeOB=document.getElementById("trans810IdcodeOB").value;
    //alert(isa810senderIdOB);

    if(isa810senderIdOB.length==0 || isa810senderIdOB == "" || isa810senderIdOB==null){
        document.getElementById('resultMessage810ob').innerHTML = "<font color=red>Please enter senderId ISA.</font>";
        return false;   
    }else if(gs810senderIdOB.length==0 || gs810senderIdOB == "" || gs810senderIdOB==null){
        document.getElementById('resultMessage810ob').innerHTML = "<font color=red>Please enter senderId GS.</font>";
        return false;   
    }else if(st810senderIdOB.length==0 || st810senderIdOB == "" || st810senderIdOB==null){
        document.getElementById('resultMessage810ob').innerHTML = "<font color=red>Please enter senderId ST.</font>";
        return false;   
    }else if(isa810RecIdOB.length==0 || isa810RecIdOB == "" || isa810RecIdOB==null){
        document.getElementById('resultMessage810ob').innerHTML = "<font color=red>Please enter RecieverId ISA.</font>";
        return false;   
    }else if(gs810RecIdOB.length==0 || gs810RecIdOB == "" || gs810RecIdOB==null){
        document.getElementById('resultMessage810ob').innerHTML = "<font color=red>Please enter RecieverId GS.</font>";
        return false;   
    }else if(st810RecIdOB.length==0 || st810RecIdOB == "" || st810RecIdOB==null){
        document.getElementById('resultMessage810ob').innerHTML = "<font color=red>Please enter RecieverId ST.</font>";
        return false;   
    }else if(isa810VersionOB.length==0 || isa810VersionOB == "" || isa810VersionOB==null){
        document.getElementById('resultMessage810ob').innerHTML = "<font color=red>Please enter Version ISA.</font>";
        return false;   
    }else if(gs810VersionOB.length==0 || gs810VersionOB == "" || gs810VersionOB==null){
        document.getElementById('resultMessage810ob').innerHTML = "<font color=red>Please enter Version GS.</font>";
        return false;   
    }else if(st810VersionOB.length==0 || st810VersionOB == "" || st810VersionOB==null){
        document.getElementById('resultMessage810ob').innerHTML = "<font color=red>Please enter Version ST.</font>";
        return false;   
    }else if(fun810GroupIdOB.length==0 || fun810GroupIdOB == "" || fun810GroupIdOB==null){
        document.getElementById('resultMessage810ob').innerHTML = "<font color=red>Please enter Functional ID Code.</font>";
        return false;   
    }else if(res810AgecodeOB.length==0 || res810AgecodeOB == "" || res810AgecodeOB==null){
        document.getElementById('resultMessage810ob').innerHTML = "<font color=red>Please enter Responsible Agency Code.</font>";
        return false;   
    }
   
    if(isa810senderIdOB!= null || isa810senderIdOB!=""){
        if(gs810senderIdOB!= null && gs810senderIdOB!=""){
            if(st810senderIdOB!= null && st810senderIdOB!=""){
                if(isa810RecIdOB!= null && isa810RecIdOB!=""){
                    if(gs810RecIdOB!= null && gs810RecIdOB!=""){
                        if(st810RecIdOB!= null && st810RecIdOB!=""){
                            if(isa810VersionOB!= null && isa810VersionOB!=""){
                                if(gs810VersionOB!= null && gs810VersionOB!=""){
                                    if(st810VersionOB!= null && st810VersionOB!=""){
                                        if(fun810GroupIdOB!= null && fun810GroupIdOB!=""){
                                            if(res810AgecodeOB!= null && res810AgecodeOB!=""){
                                                ob810 = obtransaction+"@"+obdirection+"@"+isa810senderIdOB+"@"+gs810senderIdOB+"@"+st810senderIdOB+"@"+isa810RecIdOB+"@"+gs810RecIdOB+"@"+st810RecIdOB+"@"+isa810VersionOB+"@"+gs810VersionOB+"@"+st810VersionOB+"@"+fun810GroupIdOB+"@"+res810AgecodeOB+"@"+gen810AckOB+"@"+trans810IdcodeOB; 
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    document.getElementById("OB810Transaction").value=ob810;
//alert("ob 810 transaction "+document.getElementById("OB810Transaction").value); 
}


// New method

function fieldLengthValidator850IB(element) {
    var i=0;
    //var k=0;
    //alert("In Field Length validator ESCV");
    if(element.value!=null&&(element.value!="")) {
       
        /* 850 IB validation */
        if(element.id == 'isa850senderIdIB'|| element.id == 'gs850senderIdIB' || element.id == 'st850senderIdIB' || element.id == 'gs850VersionIB' || element.id == 'st850VersionIB'){
            i=15;  
        }
        if(element.id == 'isa850VersionIB'){
            i=5;  
        }
        if(element.id == 'fun850GroupIdIB' || element.id == 'res850AgecodeIB' || element.id == 'trans850IdcodeIB'){
            i=3;  
        }
        /* 850 end*/     
        if(element.value.replace(/^\s+|\s+$/g,"").length>i) {
            str=new String(element.value);
            element.value=str.substring(0,i);
            //alert("The "+element.id+" must be less than "+i+" characters");
            document.getElementById('resultMessage').innerHTML = "<font color=red>The Value must be less than "+i+" characters</font>";
            element.focus();
            return false;
        }
        //  }
        return true;
        
    }
}
function fieldLengthValidator855IB(element) {
    var i=0;
    //var k=0;
    //alert("In Field Length validator ESCV");
    if(element.value!=null&&(element.value!="")) {
       
         
        /* 855 IB validation */
        if(element.id == 'isa855senderIdIB'|| element.id == 'gs855senderIdIB' || element.id == 'st855senderIdIB' || element.id == 'gs855VersionIB' || element.id == 'st855VersionIB'){
            i=15;  
        }
        if(element.id == 'isa855VersionIB'){
            i=5;  
        }
        if(element.id == 'fun855GroupIdIB' || element.id == 'res855AgecodeIB' || element.id == 'trans855IdcodeIB'){
            i=3;  
        }
        /* 855 end*/ 
        
        if(element.value.replace(/^\s+|\s+$/g,"").length>i) {
            str=new String(element.value);
            element.value=str.substring(0,i);
            //alert("The "+element.id+" must be less than "+i+" characters");
            document.getElementById('resultMessage855ib').innerHTML = "<font color=red>The Value must be less than "+i+" characters</font>";
            element.focus();
            return false;
        }
        //  }
        return true;
        
    }
}
function fieldLengthValidator856IB(element) {
    var i=0;
    //var k=0;
    //alert("In Field Length validator ESCV");
    if(element.value!=null&&(element.value!="")) {
       

        /* 856 IB validation */
        if(element.id == 'isa856senderIdIB'|| element.id == 'gs856senderIdIB' || element.id == 'st856senderIdIB' || element.id == 'gs856VersionIB' || element.id == 'st856VersionIB'){
            i=15;  
        }
        if(element.id == 'isa856VersionIB'){
            i=5;  
        }
        if(element.id == 'fun856GroupIdIB' || element.id == 'res856AgecodeIB' || element.id == 'trans856IdcodeIB'){
            i=3;  
        }
        /* 856 end*/
       
    
        if(element.value.replace(/^\s+|\s+$/g,"").length>i) {
            str=new String(element.value);
            element.value=str.substring(0,i);
            //alert("The "+element.id+" must be less than "+i+" characters");
            document.getElementById('resultMessage856ib').innerHTML = "<font color=red>The Value must be less than "+i+" characters</font>";
            element.focus();
            return false;
        }
        //  }
        return true;
        
    }
}
function fieldLengthValidator810IB(element) {
    var i=0;
    //var k=0;
    //alert("In Field Length validator ESCV");
    if(element.value!=null&&(element.value!="")) {
       

        /* 810 IB validation */
        if(element.id == 'isa810senderIdIB'|| element.id == 'gs810senderIdIB' || element.id == 'st810senderIdIB' || element.id == 'gs810VersionIB' || element.id == 'st810VersionIB'){
            i=15;  
        }
        if(element.id == 'isa810VersionIB'){
            i=5;  
        }
        if(element.id == 'fun810GroupIdIB' || element.id == 'res810AgecodeIB' || element.id == 'trans810IdcodeIB'){
            i=3;  
        }
        /* 810 end*/
              
        if(element.value.replace(/^\s+|\s+$/g,"").length>i) {
            str=new String(element.value);
            element.value=str.substring(0,i);
            //alert("The "+element.id+" must be less than "+i+" characters");
            document.getElementById('resultMessage810ib').innerHTML = "<font color=red>The Value must be less than "+i+" characters</font>";
            element.focus();
            return false;
        }
        //  }
        return true;
        
    }
}
function fieldLengthValidator850OB(element) {
    var i=0;
    //var k=0;
    //alert("In Field Length validator ESCV");
    if(element.value!=null&&(element.value!="")) {
       
       
       
        /* 850 OB validation */
        if(element.id == 'isa850senderIdOB'|| element.id == 'gs850senderIdOB' || element.id == 'st850senderIdOB' || element.id == 'gs850VersionOB' || element.id == 'st850VersionOB'){
            i=15;  
        }
        if(element.id == 'isa850VersionOB'){
            i=5;  
        }
        if(element.id == 'fun850GroupIdOB' || element.id == 'res850AgecodeOB' || element.id == 'trans850IdcodeOB'){
            i=3;  
        }
        /* 850 end*/     
       
    
        if(element.value.replace(/^\s+|\s+$/g,"").length>i) {
            str=new String(element.value);
            element.value=str.substring(0,i);
            //alert("The "+element.id+" must be less than "+i+" characters");
            document.getElementById('resultMessage850ob').innerHTML = "<font color=red>The Value must be less than "+i+" characters</font>";
            element.focus();
            return false;
        }
        //  }
        return true;
        
    }
}
function fieldLengthValidator855OB(element) {
    var i=0;
    //var k=0;
    //alert("In Field Length validator ESCV");
    if(element.value!=null&&(element.value!="")) {
       
         
        /* 855 OB validation */
        if(element.id == 'isa855senderIdOB'|| element.id == 'gs855senderIdOB' || element.id == 'st855senderIdOB' || element.id == 'gs855VersionOB' || element.id == 'st855VersionOB'){
            i=15;  
        }
        if(element.id == 'isa855VersionOB'){
            i=5;  
        }
        if(element.id == 'fun855GroupIdOB' || element.id == 'res855AgecodeOB' || element.id == 'trans855IdcodeOB'){
            i=3;  
        }
        /* 855 end*/ 
       
 
    
        if(element.value.replace(/^\s+|\s+$/g,"").length>i) {
            str=new String(element.value);
            element.value=str.substring(0,i);
            //alert("The "+element.id+" must be less than "+i+" characters");
            document.getElementById('resultMessage855ob').innerHTML = "<font color=red>The Value must be less than "+i+" characters</font>";
            element.focus();
            return false;
        }
        //  }
        return true;
        
    }
}
function fieldLengthValidator856OB(element) {
    var i=0;
    //var k=0;
    //alert("In Field Length validator ESCV");
    if(element.value!=null&&(element.value!="")) {
       
     
        /* 856 OB validation */
        if(element.id == 'isa856senderIdOB'|| element.id == 'gs856senderIdOB' || element.id == 'st856senderIdOB' || element.id == 'gs856VersionOB' || element.id == 'st856VersionOB'){
            i=15;  
        }
        if(element.id == 'isa856VersionOB'){
            i=5;  
        }
        if(element.id == 'fun856GroupIdOB' || element.id == 'res856AgecodeOB' || element.id == 'trans856IdcodeOB'){
            i=3;  
        }
        /* 856 end*/
    
 
    
        if(element.value.replace(/^\s+|\s+$/g,"").length>i) {
            str=new String(element.value);
            element.value=str.substring(0,i);
            //alert("The "+element.id+" must be less than "+i+" characters");
            document.getElementById('resultMessage856ob').innerHTML = "<font color=red>The Value must be less than "+i+" characters</font>";
            element.focus();
            return false;
        }
        //  }
        return true;
        
    }
}
function fieldLengthValidator810OB(element) {
    var i=0;
    //var k=0;
    //alert("In Field Length validator ESCV");
    if(element.value!=null&&(element.value!="")) {
       
        /* 810 OB validation */
        if(element.id == 'isa810senderIdOB'|| element.id == 'gs810senderIdOB' || element.id == 'st810senderIdOB' || element.id == 'gs810VersionOB' || element.id == 'st810VersionOB'){
            i=15;  
        }
        if(element.id == 'isa810VersionOB'){
            i=5;  
        }
        
        if(element.id == 'fun810GroupIdOB' || element.id == 'res810AgecodeOB' || element.id == 'trans810IdcodeOB'){
            i=3;  
        }
        /* 810 end*/
 
    
        if(element.value.replace(/^\s+|\s+$/g,"").length>i) {
            str=new String(element.value);
            element.value=str.substring(0,i);
            //alert("The "+element.id+" must be less than "+i+" characters");
            document.getElementById('resultMessage810ob').innerHTML = "<font color=red>The Value must be less than "+i+" characters</font>";
            element.focus();
            return false;
        }
        //  }
        return true;
        
    }
}
function protocolsSelectwithoutvalidation(x) {
    //alert("inside protocolsSelectwithoutvalidation --"+x);
    var commnProtocolCheck = document.getElementById("commnProtocol").value;
    var transferModeCheck = document.forms["updateTpOnboard"]["transferMode"].value;
    if(x == '-1'){
        document.getElementById('protocolmsg').innerHTML = "";
        document.getElementById('tpResultMessage').innerHTML = "";
        $("#ftpDiv").hide();
        $("#sftpDiv").hide();
        $("#httpDiv").hide();
        $("#smtpDiv").hide();
        $("#as2Div").hide();
        $("#sslDiv").hide();
        $("#sslDiv2").hide();
        $("#transferModeDiv").hide();
        $("#transactionsDiv").hide();   
        $("#ibenvelop850").hide();
        $("#ibenvelop855").hide();
        $("#ibenvelop856").hide();
        $("#ibenvelop810").hide();
        $("#obenvelop850").hide();
        $("#obenvelop855").hide();
        $("#obenvelop856").hide();
        $("#obenvelop810").hide();
    }else if(x == 'AS2'){
        document.getElementById('protocolmsg').innerHTML = "";
        document.getElementById('tpResultMessage').innerHTML = "";
        $("#ftpDiv").hide();
        $("#sftpDiv").hide();
        $("#httpDiv").hide();
        $("#smtpDiv").hide();
        $("#as2Div").show();
        $("#sslDiv").hide();
        $("#sslDiv2").hide();
        $("#transferModeDiv").hide();
        $("#transactionsDiv").show(); 
        $("#ibenvelop850").hide();
        $("#ibenvelop855").hide();
        $("#ibenvelop856").hide();
        $("#ibenvelop810").hide();
        $("#obenvelop850").hide();
        $("#obenvelop855").hide();
        $("#obenvelop856").hide();
        $("#obenvelop810").hide();
    /*  if(commnProtocolCheck == 'As2'){
            if(transferModeCheck == 'get'){
                document.forms["updateTpOnboard"]["transferMode"].value = 'get';
            }else if(transferModeCheck == 'put'){
                document.forms["updateTpOnboard"]["transferMode"].value = 'put';
            }else{
                document.forms["updateTpOnboard"]["transferMode"].value = 'get';
            }
        } */
    }
    else if(x == 'FTP'){
        document.getElementById('protocolmsg').innerHTML = "";
        document.getElementById('tpResultMessage').innerHTML = "";
        $("#ftpDiv").show();
        $("#sftpDiv").hide();
        $("#httpDiv").hide();
        $("#smtpDiv").hide();
        $("#as2Div").hide();
        $("#sslDiv").hide();
        $("#sslDiv2").hide();
        $("#transferModeDiv").show();
        $("#transactionsDiv").show(); 
        $("#ibenvelop850").hide();
        $("#ibenvelop855").hide();
        $("#ibenvelop856").hide();
        $("#ibenvelop810").hide();
        $("#obenvelop850").hide();
        $("#obenvelop855").hide();
        $("#obenvelop856").hide();
        $("#obenvelop810").hide();
    /*  if(transferModeCheck == 'get'){
                document.forms["updateTpOnboard"]["transferMode"].value = 'get';
            }else if(transferModeCheck == 'put'){
                document.forms["updateTpOnboard"]["transferMode"].value = 'put';
            }else{
                document.forms["updateTpOnboard"]["transferMode"].value = 'get';
            } */
    }
    else if(x == 'HTTP'){
        document.getElementById('protocolmsg').innerHTML = "";
        document.getElementById('tpResultMessage').innerHTML = "";
        $("#ftpDiv").hide();
        $("#sftpDiv").hide();
        $("#httpDiv").show();
        $("#smtpDiv").hide();
        $("#as2Div").hide();
        $("#sslDiv").hide();
        $("#sslDiv2").hide();
        $("#transactionsDiv").show(); 
        $("#ibenvelop850").hide();
        $("#ibenvelop855").hide();
        $("#ibenvelop856").hide();
        $("#ibenvelop810").hide();
        $("#obenvelop850").hide();
        $("#obenvelop855").hide();
        $("#obenvelop856").hide();
        $("#obenvelop810").hide();
        $("#transferModeDiv").show(); 
    /* if(commnProtocolCheck == 'HTTP'){
            if(transferModeCheck == 'get'){
                document.forms["updateTpOnboard"]["transferMode"].value = 'put';
            }else if(transferModeCheck == 'put'){
                document.forms["updateTpOnboard"]["transferMode"].value = 'get';
            }else{
                document.forms["updateTpOnboard"]["transferMode"].value = 'put';
            }
        } */
    }
    else if(x == 'SMTP'){
        document.getElementById('protocolmsg').innerHTML = "";
        document.getElementById('tpResultMessage').innerHTML = "";
        $("#ftpDiv").hide();
        $("#sftpDiv").hide();
        $("#httpDiv").hide();
        $("#smtpDiv").show();
        $("#as2Div").hide();
        $("#sslDiv").hide();
        $("#sslDiv2").hide();
        $("#transferModeDiv").hide();
        $("#transactionsDiv").show(); 
        $("#ibenvelop850").hide();
        $("#ibenvelop855").hide();
        $("#ibenvelop856").hide();
        $("#ibenvelop810").hide();
        $("#obenvelop850").hide();
        $("#obenvelop855").hide();
        $("#obenvelop856").hide();
        $("#obenvelop810").hide();
    }
    else if(x == 'SFTP'){
        document.getElementById('protocolmsg').innerHTML = "";
        document.getElementById('tpResultMessage').innerHTML = "";
        $("#ftpDiv").hide();
        $("#sftpDiv").show();
        $("#httpDiv").hide();
        $("#smtpDiv").hide();
        $("#as2Div").hide();
        $("#sslDiv").hide();
        $("#sslDiv2").hide();
        $("#ibenvelop850").hide();
        $("#ibenvelop855").hide();
        $("#ibenvelop856").hide();
        $("#ibenvelop810").hide();
        $("#obenvelop850").hide();
        $("#obenvelop855").hide();
        $("#obenvelop856").hide();
        $("#obenvelop810").hide();
        $("#transferModeDiv").show(); 
        $("#transactionsDiv").show();
    /* if(commnProtocolCheck == 'SFTP'){
            if(transferModeCheck == 'get'){
                document.forms["updateTpOnboard"]["transferMode"].value = 'get';
            }else if(transferModeCheck == 'put'){
                document.forms["updateTpOnboard"]["transferMode"].value = 'put';
            }else{
                document.forms["updateTpOnboard"]["transferMode"].value = 'get';
            }
        } */
    }
    else{
        document.getElementById('protocolmsg').innerHTML = "";
        document.getElementById('tpResultMessage').innerHTML = "";
        $("#ftpDiv").hide();
        $("#sftpDiv").hide();
        $("#httpDiv").hide();
        $("#smtpDiv").hide();
        $("#as2Div").hide();
        $("#sslDiv").hide();
        $("#sslDiv2").hide();
        $("#transferModeDiv").show(); 
        $("#ibenvelop850").hide();
        $("#ibenvelop855").hide();
        $("#ibenvelop856").hide();
        $("#ibenvelop810").hide();
        $("#obenvelop850").hide();
        $("#obenvelop855").hide();
        $("#obenvelop856").hide();
        $("#obenvelop810").hide();
        $("#transactionsDiv").show();
        document.forms["updateTpOnboard"]["transferMode"].value = 'get';
    }
    document.getElementById("transferModeMsg").style.display = "none";
    var transferMode = document.forms["updateTpOnboard"]["transferMode"].value;
    gettransferModeSelection(transferMode);
}

function tpRegValidation() {
    //alert('hii');
    var partnerName = document.getElementById("regpartnerName").value;
    var contactName = document.getElementById("regcontactName").value;
    var contactEmail = document.getElementById("regcontactEmail").value;
    var phoneNo = document.getElementById("regphoneNo").value;
    var country = document.getElementById("regcountry").value;
    var pwd = document.getElementById("regpassword").value;
    // document.getElementById('tpResultMessage').innerHTML = "";
    if(((partnerName==null)||(partnerName=="")) || ((contactName==null)||(contactName=="")) || ((contactEmail==null)||(contactEmail=="")) || ((phoneNo==null)||(phoneNo=="")) || ((country==null)||(country=="")) || ((pwd==null)||(pwd==""))){
 
        document.getElementById('tpRegisteValidation').innerHTML = "<font color=red>Please Enter all mandetory fields in partner details</font>";

    }
}

function isExistedPartnerName(){
    //alert('hiiiiiii');
    $("#correctImg").hide();
    $("#wrongImg").hide();
    $("#loadingImageAjax").hide();
    var partnerName =document.getElementById("regpartnerName").value;
    //alert('partnerName------->  '+partnerName);
    // partnerName = partnerName.replace("\\s","");
    if(partnerName.trim()!=""){
        var req = getXMLHttpRequest();
        $("#loadingImageAjax").show();
        req.onreadystatechange = readyStateHandlerLoadText(req,isExistedPartnerNameResponse);
        //var url=CONTENXT_PATH+'/isExistedProjectName.action?projectName='+partnerName;
        var url="../ajax/isExistedPartnerName.action?name="+partnerName;
        //alert(url);
        req.open("GET",url,"true");
        req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        req.send(null);
    }
}

function isExistedPartnerNameResponse(resText){
    //alert(resText)
    $("#loadingImageAjax").hide();
    // $('#partnerResetButton').removeAttr('disabled');
    // $('#partnerAddButton').removeAttr('disabled');
    if(resText=='Yes'){
        $("#correctImg").show();
       
    }else{
        $("#wrongImg").show();
        document.getElementById("regpartnerName").value='';
    }
}

function isExistedUserEmail()
{
    // alert("js");
    $("#correctImg1").hide();
    $("#wrongImg1").hide();
    $("#loadingImageEmailCheck").hide();
    
    var email = document.getElementById("regcontactEmail").value;
    //alert(email);
  
    //email = email.replace("\\s","");
    if(email.trim().length>2){
        var req = getXMLHttpRequest();
        $("#loadingImageEmailCheck").show();
        req.onreadystatechange = readyStateHandlerLoadText(req,isExistedUserEmailResponse);
        //var url=CONTENXT_PATH+'/isExistedProjectName.action?projectName='+partnerName;
        var url="../ajax/isExistedUserEmail.action?email="+email;

        // alert(url);
        req.open("GET",url,"true");
        req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        req.send(null);
    }
    
}

function isExistedUserEmailResponse(resText){
    // alert("resText..."+resText);
    $("#loadingImageEmailCheck").hide();
    if(resText=='Yes'){
        $("#correctImg1").show();
       
    }else{
        $("#wrongImg1").show();
        document.getElementById("regcontactEmail").value='';
    }
}


function gettransferModeSelection(x){
//    alert('x put and get-----'+x)
//    alert('protocol-----'+document.getElementById("protocolValue").value);
    document.getElementById('tempTransferMode').value = x;
    document.getElementById("transferModeMsg").style.display = "none";
    var protocol=document.getElementById("protocolValue").value;
   
    if(protocol == '-1'){
        $("#ftpDiv").hide();
        $("#sftpDiv").hide();
        $("#httpDiv").hide();
        $("#smtpDiv").hide();
        $("#as2Div").hide();
        $("#sslDiv").hide();
    }
    if(protocol == 'FTP'){
        $("#ftpDiv").show();
        $("#sftpDiv").hide();
        $("#httpDiv").hide();
        $("#smtpDiv").hide();
        $("#as2Div").hide();
    
        // document.getElementById("ftp_ssl_req").checked = false;
        // $('#ftp_ssl_req').attr('disabled', true);
        $("#sslDiv").hide();
        $("#sslDiv2").hide();
        if(x == 'get'){
            var transferMode = x;
            var protocol = document.getElementById("commnProtocol").value;
          //  var partnerName = document.getElementById("partnerName").value;
//    
//            $.ajax({
//                url:'../ajax/getProtocolDetails.action?transferMode='+transferMode+'&protocol='+protocol+'&partnerName='+partnerName,
//                context: document.body,
//                success: function(responseText) {
//                    var json = $.parseJSON(responseText);
//                
//                    var ftpMethod = json["FTP_METHOD"];
//                    var connMethod = json["CONNECTION_METHOD"];
//                    var recvProtocol = json["RECEIVING_PROTOCOL"];
//                    var respTime = json["RESPONSE_TIMEOUT_SEC"];
//                    var host = json["FTP_HOST"];
//                    var port = json["FTP_PORT"];
//                    var userId = json["FTP_USER_ID"];
//                    var pwd = json["FTP_PASSWORD"];
//                    var directory = json["FTP_DIRECTORY"];
//                    var sslReq = json["SSL_REQUIRED_FLAG"];
//                    var SSL_PRIORITY = '';
//                    //var KEY_CERTIFICATE_PASSPHRASE = '';
//                    var CIPHER_STRENGTH = '';
//                    if(sslReq == 'true'){
//                        SSL_PRIORITY = json["SSL_PRIORITY"];
//                        //KEY_CERTIFICATE_PASSPHRASE = json["KEY_CERTIFICATE_PASSPHRASE"];
//                        CIPHER_STRENGTH = json["CIPHER_STRENGTH"];
//                    }
//            
//                    document.getElementById("ftp_method").value = ftpMethod;
//                    document.getElementById("ftp_conn_method").value = connMethod;
//                    document.getElementById("ftp_recv_protocol").value = recvProtocol;
//                    document.getElementById("ftp_resp_time").value = respTime;
//                    document.getElementById("ftp_host").value = host;
//                    document.getElementById("ftp_port").value = port;
//                    document.getElementById("ftp_userId").value = userId;
//                    document.getElementById("ftp_pwd").value = pwd;
//                    document.getElementById("ftp_directory").value = directory+'/'+partnerName;
//                    if(sslReq == 'true'){
//                        document.getElementById("ftp_ssl_req").checked = true;
//                        $("#sslDiv").show();
//                        document.getElementById("ssl_priority").value = SSL_PRIORITY;
//                        //document.getElementById("ssl_passphrase").value = KEY_CERTIFICATE_PASSPHRASE;
//                        document.getElementById("ssl_cipher_stergth").value = CIPHER_STRENGTH;
//                        
//                    }else{
//                        document.getElementById("ftp_ssl_req").checked = false;
//                    }
//                }, 
//                error: function(e){
//                    document.getElementById("protocolmsg").style.display = 'none';
//                    alert("error-->"+e);
//                }
//            });
             $('#ftp_method').attr('disabled', true);
              $('#ftp_conn_method').attr('disabled', true);
          //  document.getElementById("ftp_conn_method").readOnly = true;
            document.getElementById("ftp_recv_protocol").readOnly = true;
            document.getElementById("ftp_resp_time").readOnly = true;
            document.getElementById("ftp_host").readOnly = true;
            document.getElementById("ftp_port").readOnly = true;
            document.getElementById("ftp_userId").readOnly = true;
            document.getElementById("ftp_pwd").readOnly = true;
            document.getElementById("ftp_directory").readOnly = true;
            document.getElementById("ssl_priority").readOnly = true;
            //document.getElementById("ssl_passphrase").readOnly = true;
            document.getElementById("ssl_cipher_stergth").readOnly = true;
        }
        if(x == 'put'){
            var transferMode = x;
            var protocol = document.getElementById("commnProtocol").value;
        //    var partnerName = document.getElementById("partnerName").value;
//    
//            $.ajax({
//                url:'../ajax/getProtocolDetails.action?transferMode='+transferMode+'&protocol='+protocol+'&partnerName='+partnerName,
//                context: document.body,
//                success: function(responseText) {
//                    if((responseText.length)>0){
//                        var json = $.parseJSON(responseText);
//                
//                        var ftpMethod = json["FTP_METHOD"];
//                        var connMethod = json["CONNECTION_METHOD"];
//                        var recvProtocol = json["RECEIVING_PROTOCOL"];
//                        var respTime = json["RESPONSE_TIMEOUT_SEC"];
//                        var host = json["FTP_HOST"];
//                        var port = json["FTP_PORT"];
//                        var userId = json["FTP_USER_ID"];
//                        var pwd = json["FTP_PASSWORD"];
//                        var directory = json["FTP_DIRECTORY"];
//                        var sslReq = json["SSL_REQUIRED_FLAG"];
//                        var SSL_PRIORITY = '';
//                        //var KEY_CERTIFICATE_PASSPHRASE = '';
//                        var CIPHER_STRENGTH = '';
//                        if(sslReq == 'true'){
//                            SSL_PRIORITY = json["SSL_PRIORITY"];
//                            //KEY_CERTIFICATE_PASSPHRASE = json["KEY_CERTIFICATE_PASSPHRASE"];
//                            CIPHER_STRENGTH = json["CIPHER_STRENGTH"];
//                        }
//            
//                        document.getElementById("ftp_method").value = ftpMethod;
//                        document.getElementById("ftp_conn_method").value = connMethod;
//                        document.getElementById("ftp_recv_protocol").value = recvProtocol;
//                        document.getElementById("ftp_resp_time").value = respTime;
//                        document.getElementById("ftp_host").value = host;
//                        document.getElementById("ftp_port").value = port;
//                        document.getElementById("ftp_userId").value = userId;
//                        document.getElementById("ftp_pwd").value = pwd;
//                        document.getElementById("ftp_directory").value = directory;
//                        if(sslReq == 'true'){
//                            document.getElementById("ftp_ssl_req").checked = true;
//                            $("#sslDiv2").show();
//                            document.getElementById("ssl_priority2").value = SSL_PRIORITY;
//                            //document.getElementById("ssl_passphrase").value = KEY_CERTIFICATE_PASSPHRASE;
//                            document.getElementById("ssl_cipher_stergth2").value = CIPHER_STRENGTH;
//                        
//                        }else{
//                            document.getElementById("ftp_ssl_req").checked = false;
//                        }
//                    }else{
//                        document.getElementById("ftp_conn_method").value = 'ACTIVE';
//                        document.getElementById("ftp_method").value = 'PUT';
//                        //document.getElementById("ftp_method").readOnly = false;
//                        document.getElementById("ftp_recv_protocol").value = 'FTP';
//                        document.getElementById("ftp_resp_time").value = '';
//                        document.getElementById("ftp_host").value = '';
//                        document.getElementById("ftp_port").value = '';
//                        document.getElementById("ftp_userId").value = '';
//                        document.getElementById("ftp_pwd").value = '';
//                        document.getElementById("ftp_directory").value = '';
//                        document.getElementById("ftp_ssl_req").checked = false;
//                    }
//                }, 
//                error: function(e){
//                    document.getElementById("protocolmsg").style.display = 'none';
//                    alert("error-->"+e);
//                }
//            });
            $('#ftp_conn_method').attr('disabled', false);
            //document.getElementById("ftp_conn_method").readOnly = false;
            document.getElementById("ftp_recv_protocol").readOnly = false;
            document.getElementById("ftp_resp_time").readOnly = false;
            document.getElementById("ftp_host").readOnly = false;
            document.getElementById("ftp_port").readOnly = false;
            document.getElementById("ftp_userId").readOnly = false;
            document.getElementById("ftp_pwd").readOnly = false;
            document.getElementById("ftp_directory").readOnly = false;
            $('#ftp_method').attr('disabled', false);
            document.getElementById("ssl_priority2").readOnly = false;
            //document.getElementById("ssl_passphrase").readOnly = false;
            document.getElementById("ssl_cipher_stergth2").readOnly = false;
        } 
    }
    if(protocol == 'SFTP'){
        $("#ftpDiv").hide();
        $("#sftpDiv").show();
        $("#httpDiv").hide();
        $("#smtpDiv").hide();
        $("#as2Div").hide();
        $("#sslDiv").hide();
       
        if(x == 'get'){
            var transferMode = x;
            var protocol = document.getElementById("commnProtocol").value;
          //  var partnerName = document.getElementById("partnerName").value;
    
//            $.ajax({
//                url:'../ajax/getProtocolDetails.action?transferMode='+transferMode+'&protocol='+protocol+'&partnerName='+partnerName,
//                context: document.body,
//                success: function(responseText) {
//                    var json = $.parseJSON(responseText);
//                
//                    var CONN_METHOD = json["CONN_METHOD"];
//                    var AUTH_METHOD = json["AUTH_METHOD"];
//                    // var MY_SSH_PUB_KEY = json["MY_SSH_PUB_KEY"];
//                    // var UPL_YOUR_SSH_PUB_KEY = json["UPL_YOUR_SSH_PUB_KEY"];
//                    var REMOTE_HOST_IP_ADD = json["REMOTE_HOST_IP_ADD"];
//                    var REMOTE_PORT = json["REMOTE_PORT"];
//                    var REMOTE_USERID = json["REMOTE_USERID"];
//                    var REMOTE_PWD = json["REMOTE_PWD"];
//                    var METHOD = json["METHOD"];
//                    var DIRECTORY = '/MSCVP/'+partnerName;
//            
//                    document.getElementById("sftp_conn_method").value = CONN_METHOD;
//                    document.getElementById("sftp_auth_method").value = AUTH_METHOD;
//                    document.getElementById("sftp_host_ip").value = REMOTE_HOST_IP_ADD;
//                    document.getElementById("sftp_remote_port").value = REMOTE_PORT;
//                    document.getElementById("sftp_remote_userId").value = REMOTE_USERID;
//                    document.getElementById("sftp_remote_pwd").value = REMOTE_PWD;
//                    document.getElementById("sftp_method").value = METHOD;
//                    document.getElementById("sftp_directory").value = DIRECTORY;
//                }, 
//                error: function(e){
//                    document.getElementById("protocolmsg").style.display = 'none';
//                    alert("error-->"+e);
//                }
//            });
//            
//            document.getElementById("upload").style.display = 'none';
//            document.getElementById("download").style.display = 'block';
//            $('#sftp_conn_method').attr('disabled', true);
//            $('#sftp_auth_method').attr('disabled', true);
//            //document.getElementById("sftp_auth_method").readOnly = true;
//            document.getElementById("sftp_host_ip").readOnly = true;
//            document.getElementById("sftp_remote_port").readOnly = true;
//            document.getElementById("sftp_remote_userId").readOnly = true;
//            document.getElementById("sftp_remote_pwd").readOnly = true;
//            $('#sftp_method').attr('disabled', true);
//            document.getElementById("sftp_directory").readOnly = true;
//        }
//        if(x == 'put'){
//            var transferMode = x;
//            var protocol = document.getElementById("commnProtocol").value;
//            var partnerName = document.getElementById("partnerName").value;
//    
//            $.ajax({
//                url:'../ajax/getProtocolDetails.action?transferMode='+transferMode+'&protocol='+protocol+'&partnerName='+partnerName,
//                context: document.body,
//                success: function(responseText) {
//                    if((responseText.length)>0){
//                        var json = $.parseJSON(responseText);
//                
//                        var CONN_METHOD = json["CONN_METHOD"];
//                        var AUTH_METHOD = json["AUTH_METHOD"];
//                        // var MY_SSH_PUB_KEY = json["MY_SSH_PUB_KEY"];
//                        // var UPL_YOUR_SSH_PUB_KEY = json["UPL_YOUR_SSH_PUB_KEY"];
//                        var REMOTE_HOST_IP_ADD = json["REMOTE_HOST_IP_ADD"];
//                        var REMOTE_PORT = json["REMOTE_PORT"];
//                        var REMOTE_USERID = json["REMOTE_USERID"];
//                        var REMOTE_PWD = json["REMOTE_PWD"];
//                        var METHOD = json["METHOD"];
//                        var DIRECTORY = json["DIRECTORY"];
//            
//                        document.getElementById("sftp_conn_method").value = CONN_METHOD;
//                        document.getElementById("sftp_auth_method").value = AUTH_METHOD;
//                        document.getElementById("sftp_host_ip").value = REMOTE_HOST_IP_ADD;
//                        document.getElementById("sftp_remote_port").value = REMOTE_PORT;
//                        document.getElementById("sftp_remote_userId").value = REMOTE_USERID;
//                        document.getElementById("sftp_remote_pwd").value = REMOTE_PWD;
//                        document.getElementById("sftp_method").value = METHOD;
//                        document.getElementById("sftp_directory").value = DIRECTORY;
//                    }else{
//                        document.getElementById("sftp_conn_method").value = 'ACTIVE';
//                        document.getElementById("sftp_auth_method").value = 'Pwd_Only';
//                        document.getElementById("sftp_host_ip").value = '';
//                        document.getElementById("sftp_remote_port").value = '';
//                        document.getElementById("sftp_remote_userId").value = '';
//                        document.getElementById("sftp_remote_pwd").value = '';
//                        document.getElementById("sftp_method").value = 'PUT';
//                        // document.getElementById("sftp_method").readOnly = false;
//                        document.getElementById("sftp_directory").value = '';
//                    }
//                }, 
//                error: function(e){
//                    document.getElementById("protocolmsg").style.display = 'none';
//                    alert("error-->"+e);
//                }
//            });
            
            document.getElementById("upload").style.display = 'block';
            document.getElementById("download").style.display = 'none';
            $('#sftp_conn_method').attr('disabled', false);
            $('#sftp_auth_method').attr('disabled', false);
            document.getElementById("sftp_host_ip").readOnly = false;
            document.getElementById("sftp_remote_port").readOnly = false;
            document.getElementById("sftp_directory").readOnly = false;
            document.getElementById("sftp_remote_userId").readOnly = false;
            $('#sftp_method').attr('disabled', false);
            document.getElementById("sftp_remote_pwd").readOnly = false;
        } 
    }
    if(protocol == 'HTTP'){
        $("#ftpDiv").hide();
        $("#sftpDiv").hide();
        $("#httpDiv").show();
        $("#smtpDiv").hide();
        $("#as2Div").hide();
       
        //document.getElementById("http_ssl_req").checked = false;
        // $('#http_ssl_req').attr('disabled', true);
        $("#sslDiv").hide();
        $("#sslDiv2").hide();
        if(x == 'put'){
            var transferMode = x;
            var protocol = document.getElementById("commnProtocol").value;
//            var partnerName = document.getElementById("partnerName").value;
//    
//            $.ajax({
//                url:'../ajax/getProtocolDetails.action?transferMode='+transferMode+'&protocol='+protocol+'&partnerName='+partnerName,
//                context: document.body,
//                success: function(responseText) {
//                    var json = $.parseJSON(responseText);
//                        
//                    var RECEIVING_PROTOCOL = json["RECEIVING_PROTOCOL"];
//                    var RESPONSE_TIMEOUT_SEC = json["RESPONSE_TIMEOUT_SEC"];
//                    var HTTP_END_POINT = json["HTTP_END_POINT"];
//                    var HTTP_PORT = json["HTTP_PORT"];
//                    var HTTP_MODE = json["HTTP_MODE"];
//                    var sslReq = json["SSL_REQUIRED"];
//                    var SSL_PRIORITY = '';
//                    //var KEY_CERTIFICATE_PASSPHRASE = '';
//                    var CIPHER_STRENGTH = '';
//                    if(sslReq == 'true'){
//                        SSL_PRIORITY = json["SSL_PRIORITY"];
//                        //KEY_CERTIFICATE_PASSPHRASE = json["KEY_CERTIFICATE_PASSPHRASE"];
//                        CIPHER_STRENGTH = json["CIPHER_STRENGTH"];
//                    }
//            
//                    document.getElementById("http_recv_protocol").value = RECEIVING_PROTOCOL;
//                    document.getElementById("http_resp_time").value = RESPONSE_TIMEOUT_SEC;
//                    document.getElementById("http_endpoint").value = HTTP_END_POINT;
//                    document.getElementById("http_port").value = HTTP_PORT;
//                    document.getElementById("http_protocol_mode").value = HTTP_MODE;
//                    document.getElementById("http_url").value = '/'+partnerName;
//                    if(sslReq == 'true'){
//                        document.getElementById("http_ssl_req").checked = true;
//                        $("#sslDiv").show();
//                        
//                        document.getElementById("ssl_priority").value = SSL_PRIORITY;
//                        //document.getElementById("ssl_passphrase").value = KEY_CERTIFICATE_PASSPHRASE;
//                        document.getElementById("ssl_cipher_stergth").value = CIPHER_STRENGTH;
//                        
//                    }else{
//                        document.getElementById("ftp_ssl_req").checked = false;
//                    }
//                }, 
//                error: function(e){
//                    document.getElementById("protocolmsg").style.display = 'none';
//                    alert("error-->"+e);
//                }
//            });
//            
            document.getElementById("http_recv_protocol").readOnly = true;
            document.getElementById("http_resp_time").readOnly = true;
            document.getElementById("http_endpoint").readOnly = true;
            document.getElementById("http_port").readOnly = true;
            document.getElementById("http_url").readOnly = true;
            $('#http_protocol_mode').attr('disabled', true);
        }
        if(x == 'get'){
            var transferMode = x;
            var protocol = document.getElementById("commnProtocol").value;
//            var partnerName = document.getElementById("partnerName").value;
//    
//            $.ajax({
//                url:'../ajax/getProtocolDetails.action?transferMode='+transferMode+'&protocol='+protocol+'&partnerName='+partnerName,
//                context: document.body,
//                success: function(responseText) {
//                    //alert(responseText.length);
//                    if((responseText.length)>0){
//                        var json = $.parseJSON(responseText);
//                
//                        var RECEIVING_PROTOCOL = json["RECEIVING_PROTOCOL"];
//                        var RESPONSE_TIMEOUT_SEC = json["RESPONSE_TIMEOUT_SEC"];
//                        var HTTP_END_POINT = json["HTTP_END_POINT"];
//                        var HTTP_PORT = json["HTTP_PORT"];
//                        var HTTP_MODE = json["HTTP_MODE"];
//                        var sslReq = json["SSL_REQUIRED"];
//                        var url = json["URL"];
//                        var SSL_PRIORITY = '';
//                        //var KEY_CERTIFICATE_PASSPHRASE = '';
//                        var CIPHER_STRENGTH = '';
//                        if(sslReq == 'true'){
//                            SSL_PRIORITY = json["SSL_PRIORITY"];
//                            //KEY_CERTIFICATE_PASSPHRASE = json["KEY_CERTIFICATE_PASSPHRASE"];
//                            CIPHER_STRENGTH = json["CIPHER_STRENGTH"];
//                        }
//                        document.getElementById("http_url").value = url;
//                        document.getElementById("http_recv_protocol").value = RECEIVING_PROTOCOL;
//                        document.getElementById("http_resp_time").value = RESPONSE_TIMEOUT_SEC;
//                        document.getElementById("http_endpoint").value = HTTP_END_POINT;
//                        document.getElementById("http_port").value = HTTP_PORT;
//                        document.getElementById("http_protocol_mode").value = HTTP_MODE;
//                        if(sslReq == 'true'){
//                            document.getElementById("http_ssl_req").checked = true;
//                            $("#sslDiv2").show();
//                            document.getElementById("ssl_priority2").value = SSL_PRIORITY;
//                            //document.getElementById("ssl_passphrase").value = KEY_CERTIFICATE_PASSPHRASE;
//                            document.getElementById("ssl_cipher_stergth2").value = CIPHER_STRENGTH;
//                        
//                        }else{
//                            document.getElementById("http_ssl_req").checked = false;
//                        }
//                    }else{
//                        document.getElementById("http_recv_protocol").value = 'HTTP';
//                        document.getElementById("http_resp_time").value = '';
//                        document.getElementById("http_endpoint").value = '';
//                        document.getElementById("http_port").value = '';
//                        document.getElementById("http_protocol_mode").value = 'GET';
//                        document.getElementById("http_ssl_req").checked = false;
//                    }
//                }, 
//                error: function(e){
//                    document.getElementById("protocolmsg").style.display = 'none';
//                    alert("error-->"+e);
//                }
//            });
            document.getElementById("http_recv_protocol").readOnly = false;
            document.getElementById("http_endpoint").readOnly = false;
            $('#http_protocol_mode').attr('disabled', false);
            document.getElementById("http_port").readOnly = false;
            document.getElementById("http_resp_time").readOnly = false;
            document.getElementById("ssl_priority2").readOnly = false;
            document.getElementById("ssl_cipher_stergth2").readOnly = false;
        } 
    }
    if(protocol == 'SMTP'){
        $("#ftpDiv").hide();
        $("#sftpDiv").hide();
        $("#httpDiv").hide();
        $("#smtpDiv").show();
        $("#as2Div").hide();
       
        $("#sslDiv").hide();
        var transferMode = 'x';
        var protocol = document.getElementById("commnProtocol").value;
//        var partnerName = document.getElementById("partnerName").value;
//    
//        $.ajax({
//            url:'../ajax/getProtocolDetails.action?transferMode='+transferMode+'&protocol='+protocol+'&partnerName='+partnerName,
//            context: document.body,
//            success: function(responseText) {
//                if((responseText.length)>0){
//                    var json = $.parseJSON(responseText);
//                
//                    var RECEIVING_PROTOCOL = json["RECEIVING_PROTOCOL"];
//                    var SMTP_SERVER_HOST = json["SMTP_SERVER_HOST"];
//                    var SMTP_SERVER_PORT = json["SMTP_SERVER_PORT"];
//                    var FROM_EMAIL_ADDRESS = json["FROM_EMAIL_ADDRESS"];
//                    var TO_EMAIL_ADDRESS = json["TO_EMAIL_ADDRESS"];
//            
//                    document.getElementById("smtp_recv_protocol").value = RECEIVING_PROTOCOL;
//                    document.getElementById("smtp_server_protocol").value = SMTP_SERVER_HOST;
//                    document.getElementById("smtp_server_port").value = SMTP_SERVER_PORT;
//                    document.getElementById("smtp_from_email").value = FROM_EMAIL_ADDRESS;
//                    document.getElementById("smtp_to_email").value = TO_EMAIL_ADDRESS;
//                }else{
//                    document.getElementById("smtp_recv_protocol").value = 'SMTP';
//                    document.getElementById("smtp_server_protocol").value = '';
//                    document.getElementById("smtp_server_port").value = '';
//                    document.getElementById("smtp_from_email").value = '';
//                    document.getElementById("smtp_to_email").value = '';
//                }
//            }, 
//            error: function(e){
//                document.getElementById("protocolmsg").style.display = 'none';
//                alert("error-->"+e);
//            }
//        });
        document.getElementById("smtp_server_protocol").readOnly = false;
        document.getElementById("smtp_server_port").readOnly = false;
        $('#smtp_recv_protocol').attr('disabled', false);
        document.getElementById("smtp_server_port").readOnly = false;
        document.getElementById("smtp_from_email").readOnly = false;
        document.getElementById("smtp_to_email").readOnly = false;
    }
    if(protocol == 'AS2'){
        $("#ftpDiv").hide();
        $("#sftpDiv").hide();
        $("#httpDiv").hide();
        $("#smtpDiv").hide();
        $("#as2Div").show();
        
        // document.getElementById("as2_ssl_req").checked = false;

        // $('#as2_ssl_req').css("user-select","none");
        //$('#http_ssl_req').attr('disabled', true);
        $("#sslDiv").hide();
        $("#sslDiv2").hide();
        var transferMode = "x";
        var protocol = document.getElementById("commnProtocol").value;
//        var partnerName = document.getElementById("partnerName").value;
//    
//        $.ajax({
//            url:'../ajax/getProtocolDetails.action?transferMode='+transferMode+'&protocol='+protocol+'&partnerName='+partnerName,
//            context: document.body,
//            success: function(responseText) {
//                if((responseText.length)>0){
//                    var json = $.parseJSON(responseText);
//                
//                    // var DWL_MY_SYS_CERT = json["DWL_MY_SYS_CERT"];
//                    // var UPL_YOUR_SYS_CERT = json["UPL_YOUR_SYS_CERT"];
//                    var MY_ORG = json["MY_ORG"];
//                    var YOUR_ORG = json["YOUR_ORG"];
//                    var MY_PART_PRO_NAME = json["MY_PART_PRO_NAME"];
//                    var YOUR_PART_PRO_NAME = json["YOUR_PART_PRO_NAME"];
//                    var MY_END_POINT = json["MY_END_POINT"];
//                    var YOUR_END_POINT = json["YOUR_END_POINT"];
//                    var STR_AS2_MSG_IN = json["STR_AS2_MSG_IN"];
//                    var WAIT_FOR_SYNC_MDN_PROC = json["WAIT_FOR_SYNC_MDN_PROC"];
//                    var TRANSFER_MODE = json["TRANSFER_MODE"];
//                    var sslReq = json["SSL_REQ"];
//                    var SSL_PRIORITY = '';
//                    //var KEY_CERTIFICATE_PASSPHRASE = '';
//                    var CIPHER_STRENGTH = '';
//                    if(sslReq == 'true'){
//                        SSL_PRIORITY = json["SSL_PRIORITY"];
//                        //KEY_CERTIFICATE_PASSPHRASE = json["KEY_CERTIFICATE_PASSPHRASE"];
//                        CIPHER_STRENGTH = json["CIPHER_STRENGTH"];
//                    }
//            
//                    // document.getElementById("as2_part_cert").value = DWL_MY_SYS_CERT;
//                    document.getElementById("as2_myOrgName").value = MY_ORG;
//                    document.getElementById("as2_partOrgName").value = YOUR_ORG;
//                    document.getElementById("as2_myPartname").value = MY_PART_PRO_NAME;
//                    document.getElementById("as2_yourPartname").value = YOUR_PART_PRO_NAME;
//                    document.getElementById("as2_myEndPoint").value = MY_END_POINT;
//                    document.getElementById("as2_partendpoint").value = YOUR_END_POINT;
//                    document.getElementById("as2_strMsg").value = STR_AS2_MSG_IN;
//                    document.getElementById("as2_waitForSync").value = WAIT_FOR_SYNC_MDN_PROC;
//                    document.getElementById("as2_payloadSendMode").value = TRANSFER_MODE;
//                    if(sslReq == 'true'){
//                        document.getElementById("as2_ssl_req").checked = true;
//                        $("#sslDiv2").show();
//                        document.getElementById("ssl_priority2").value = SSL_PRIORITY;
//                        //document.getElementById("ssl_passphrase").value = KEY_CERTIFICATE_PASSPHRASE;
//                        document.getElementById("ssl_cipher_stergth2").value = CIPHER_STRENGTH;
//                        
//                    }else{
//                        document.getElementById("as2_ssl_req").checked = false;
//                    }
//                }else{
//                    //document.getElementById("as2_part_cert").value = '';
//                    document.getElementById("as2_myOrgName").value = '';
//                    document.getElementById("as2_partOrgName").value = '';
//                    document.getElementById("as2_myPartname").value = '';
//                    document.getElementById("as2_yourPartname").value = '';
//                    document.getElementById("as2_myEndPoint").value = '';
//                    document.getElementById("as2_partendpoint").value = '';
//                    document.getElementById("as2_strMsg").value = 'MailBox';
//                    document.getElementById("as2_waitForSync").value = 'YES';
//                    document.getElementById("as2_payloadSendMode").value = 'SYNC';
//                }
//            }, 
//            error: function(e){
//                document.getElementById("protocolmsg").style.display = 'none';
//                alert("error-->"+e);
//            }
//        });
        //document.getElementById("as2_part_cert").readOnly = false;
        document.getElementById("as2_myOrgName").readOnly = false;
        document.getElementById("as2_partOrgName").readOnly = false;
        document.getElementById("as2_myPartname").readOnly = false;
        document.getElementById("as2_yourPartname").readOnly = false;
        document.getElementById("as2_myEndPoint").readOnly = false;
        document.getElementById("as2_partendpoint").readOnly = false;
        document.getElementById("as2_payloadSendMode").readOnly = false;
        document.getElementById("ssl_priority2").readOnly = false;
        document.getElementById("ssl_cipher_stergth2").readOnly = false;
        $('#as2_strMsg').attr('disabled', false);
        $('#as2_waitForSync').attr('disabled', false);
    }
}
function sslRequiredForGetDetails(x){
    var transferMode;
    if (document.updateTpOnboard.transferMode.value) {
        transferMode = document.updateTpOnboard.transferMode.value;
    }
    if(x == 'ftp'){
        var ftp_ssl = document.getElementById("ftp_ssl_req").checked;
        if(ftp_ssl == true){
            
            if(transferMode == 'get'){
                $("#sslDiv").show();
            //                document.getElementById("ssl_priority").value = 'MUST';
            //                document.getElementById("ssl_passphrase").value = 'xxxx';
            //                document.getElementById("ssl_cipher_stergth").value = 'STRONG';
            }
            if(transferMode == 'put'){
                $("#sslDiv2").show();
            //                document.getElementById("ssl_priority").value = 'MUST';
            //                document.getElementById("ssl_passphrase").value = '';
            //                document.getElementById("ssl_cipher_stergth").value = 'NONE';
            }
        }else{
            $("#sslDiv").hide();
            $("#sslDiv2").hide();
        }
    }
    if(x == 'sftp'){
        var sftp_ssl = document.getElementById("sftp_ssl_req").checked;
        if(sftp_ssl == true){
            $("#sslDiv").show();
            if(transferMode == 'get'){
                document.getElementById("ssl_priority").value = 'MUST';
                document.getElementById("ssl_passphrase").value = 'xxxx';
                document.getElementById("ssl_cipher_stergth").value = 'STRONG';
            }
            if(transferMode == 'put'){
                document.getElementById("ssl_priority").value = 'MUST';
                document.getElementById("ssl_passphrase").value = '';
                document.getElementById("ssl_cipher_stergth").value = 'NONE';
            }
        }else{
            $("#sslDiv").hide();
            $("#sslDiv2").hide();
        }
    }
    if(x == 'http'){
        var http_ssl=document.getElementById("http_ssl_req").checked;
        if(http_ssl == true){
            
            if(transferMode == 'get'){
                $("#sslDiv2").show();
            //                document.getElementById("ssl_priority").value = 'MUST';
            //                document.getElementById("ssl_passphrase").value = 'xxxx';
            //                document.getElementById("ssl_cipher_stergth").value = 'xxxx';
            }
            if(transferMode == 'put'){
                $("#sslDiv").show();
            //                document.getElementById("ssl_priority").value = 'MUST';
            //                document.getElementById("ssl_passphrase").value = '';
            //                document.getElementById("ssl_cipher_stergth").value = '';
            }
        }else{
            $("#sslDiv").hide();
            $("#sslDiv2").hide();
        }
    }
    if(x == 'as2'){
        var as2_ssl=document.getElementById("as2_ssl_req").checked;
        if(as2_ssl == true){
            $("#sslDiv2").show();
        //            if(transferMode == 'get'){
        //                document.getElementById("ssl_priority").value = 'Must';
        //                document.getElementById("ssl_passphrase").value = 'xxxx';
        //                document.getElementById("ssl_cipher_stergth").value = 'xxxx';
        //            }
        //            if(transferMode == 'put'){
        //                document.getElementById("ssl_priority").value = 'Must';
        //                document.getElementById("ssl_passphrase").value = '';
        //                document.getElementById("ssl_cipher_stergth").value = '';
        //            }
        }else{
            $("#sslDiv").hide();
            $("#sslDiv2").hide();
        }
    }
}

function as2OrgProfileNames(){
    var as2_myOrgName = document.getElementById('as2_myOrgName');
    var as2_yourPartname = document.getElementById('as2_yourPartname');
    as2_yourPartname.value = as2_myOrgName.value;
} 
function as2PartnerProfileNames(){
    var as2_partOrgName = document.getElementById('as2_partOrgName');
    var as2_myPartname = document.getElementById('as2_myPartname');
    as2_myPartname.value = as2_partOrgName.value;
} 

function isExistedAS2PartnerProfileName(){
    $("#correctImg").hide();
    $("#wrongImg").hide();
    $("#loadingImageAjax").hide();
    var partnerName =document.getElementById("partnerName").value;
    var myOrgName =document.getElementById("as2_myOrgName").value;
    if(partnerName.trim()!=""){
        var req = getXMLHttpRequest();
        $("#loadingImageAjax").show();
        req.onreadystatechange = readyStateHandlerLoadText(req,isExistedAS2PartnerProfileNameResponse);
        var url="../ajax/isExistedAS2PartnerProfileName.action?name="+myOrgName+"&partnerName="+partnerName;
        req.open("GET",url,"true");
        req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        req.send(null);
    }
}

function isExistedAS2PartnerProfileNameResponse(resText){
    $("#loadingImageAjax").hide();
    if(resText=='Yes'){
        $("#correctImg").show();
        document.getElementById("as2_yourPartname").value=document.getElementById("as2_myOrgName").value;
    }else{
        $("#wrongImg").show();
        document.getElementById("as2_myOrgName").value='';
        document.getElementById("as2_yourPartname").value='';
    }
}
function validateFTP(){
    var ftp_method = document.getElementById("ftp_method").value;
    var ftp_conn_method = document.getElementById("ftp_conn_method").value;
    var ftp_recv_protocol = document.getElementById("ftp_recv_protocol").value;
    var ftp_resp_time = document.getElementById("ftp_resp_time").value;
    var ftp_host = document.getElementById("ftp_host").value;
    var ftp_port = document.getElementById("ftp_port").value;
    var ftp_userId = document.getElementById("ftp_userId").value;
    var ftp_pwd = document.getElementById("ftp_pwd").value;
    var ftp_directory = document.getElementById("ftp_directory").value;
    // var ftp_ssl_req = document.getElementById("ftp_ssl_req").value;
    var ftp_ssl = document.getElementById("ftp_ssl_req").checked;
    document.getElementById('tpResultMessage').innerHTML = "";
    //var commnProtocol =document.getElementById('commnProtocol').value;
    if(((ftp_method==null)||(ftp_method=="")) || ((ftp_conn_method==null)||(ftp_conn_method=="")) || ((ftp_recv_protocol==null)||(ftp_recv_protocol=="")) || ((ftp_resp_time==null)||(ftp_resp_time=="")) || ((ftp_host==null)||(ftp_host=="")) || ((ftp_port==null)||(ftp_port=="")) || ((ftp_userId==null)||(ftp_userId=="")) || ((ftp_pwd==null)||(ftp_pwd=="")) || ((ftp_directory==null)||(ftp_directory==""))){
        document.getElementById('protocolmsgFtp').innerHTML = "<font color=red>Please Enter all Mandetory fields in Protocals</font>";
        return false;
    }
    if((document.getElementById('tempTransferMode').value)=='put'){
        if(ftp_ssl==true){
            // var ssl_priority = document.getElementById("ssl_priority2").value;
            // var ssl_cipher_stergth = document.getElementById("ssl_cipher_stergth2").value;
            var fileName = document.getElementById("attachmentFileName").value;
            if(((fileName==null)||(fileName==""))){
                document.getElementById('protocolmsgSsl').innerHTML = "<font color=red>Please Enter all amndetory fields in SSL</font>";
                return false;
            }
        }
    }
}
            
function validateSFTP(){
    // var sftp_conn_method = document.getElementById("sftp_conn_method").value;
    //  var sftp_auth_method = document.getElementById("sftp_auth_method").value;
    var FileName = document.getElementById("attachmentFileNameSftp").value;
    var sftp_host_ip = document.getElementById("sftp_host_ip").value;
    var sftp_remote_port = document.getElementById("sftp_remote_port").value;
    var sftp_remote_userId = document.getElementById("sftp_remote_userId").value;
    var sftp_remote_pwd = document.getElementById("sftp_remote_pwd").value;
    // var sftp_method = document.getElementById("sftp_method").value;
    var sftp_directory = document.getElementById("sftp_directory").value;
    // var ftp_ssl_req = document.getElementById("ftp_ssl_req").value;
    //var ftp_ssl = document.getElementById("ftp_ssl_req").checked;
    document.getElementById('tpResultMessage').innerHTML = "";
    //var commnProtocol =document.getElementById('commnProtocol').value;
    if((document.getElementById('tempTransferMode').value)=='put'){
        if(((FileName==null)||(FileName=="")) || ((sftp_host_ip==null)||(sftp_host_ip=="")) || ((sftp_remote_port==null)||(sftp_remote_port=="")) || ((sftp_remote_userId==null)||(sftp_remote_userId=="")) || ((sftp_remote_pwd==null)||(sftp_remote_pwd=="")) || ((sftp_directory==null)||(sftp_directory==""))){
            document.getElementById('protocolmsgSftp').innerHTML = "<font color=red>Please Enter all Mandetory fields in Protocals</font>";
            return false;
        }
    }  
}
        
function validateHTTP(){
    // var sftp_conn_method = document.getElementById("sftp_conn_method").value;
    //  var sftp_auth_method = document.getElementById("sftp_auth_method").value;
    var http_recv_protocol = document.getElementById("http_recv_protocol").value;
    var http_resp_time = document.getElementById("http_resp_time").value;
    var http_endpoint = document.getElementById("http_endpoint").value;
    var http_port = document.getElementById("http_port").value;
    // var http_protocol_mode = document.getElementById("http_protocol_mode").value;
    // var sftp_method = document.getElementById("sftp_method").value;
    var http_ssl_req = document.getElementById("http_ssl_req").checked;
    // var ftp_ssl_req = document.getElementById("ftp_ssl_req").value;
    //var ftp_ssl = document.getElementById("ftp_ssl_req").checked;
    document.getElementById('tpResultMessage').innerHTML = "";
    //var commnProtocol =document.getElementById('commnProtocol').value;
    if(((http_recv_protocol==null)||(http_recv_protocol=="")) || ((http_resp_time==null)||(http_resp_time=="")) || ((http_endpoint==null)||(http_endpoint=="")) || ((http_port==null)||(http_port==""))){
        document.getElementById('protocolmsgHttp').innerHTML = "<font color=red>Please Enter all Mandetory fields in Protocals</font>";
        return false;
    }
    if((document.getElementById('tempTransferMode').value)=='get'){
        if(http_ssl_req==true){
            // var ssl_priority = document.getElementById("ssl_priority2").value;
            // var ssl_cipher_stergth = document.getElementById("ssl_cipher_stergth2").value;
            var fileName = document.getElementById("attachmentFileName").value;
            if(((fileName==null)||(fileName==""))){
                document.getElementById('protocolmsgSsl').innerHTML = "<font color=red>Please Enter all amndetory fields in SSL</font>";
                return false;
            }
        }
    }   
}

function validateAS2(){
    // var sftp_conn_method = document.getElementById("sftp_conn_method").value;
    //  var sftp_auth_method = document.getElementById("sftp_auth_method").value;
    var attachmentFileName = document.getElementById("attachmentFileNameAs2").value;
    var as2_myOrgName = document.getElementById("as2_myOrgName").value;
    var as2_partOrgName = document.getElementById("as2_partOrgName").value;
    var as2_myPartname = document.getElementById("as2_myPartname").value;
    var as2_yourPartname = document.getElementById("as2_yourPartname").value;
    var as2_myEndPoint = document.getElementById("as2_myEndPoint").value;
    var as2_partendpoint = document.getElementById("as2_partendpoint").value;
    // var ftp_ssl_req = document.getElementById("ftp_ssl_req").value;
    var as2_ssl_req = document.getElementById("as2_ssl_req").checked;
    document.getElementById('tpResultMessage').innerHTML = "";
    //var commnProtocol =document.getElementById('commnProtocol').value;
    if(((attachmentFileName==null)||(attachmentFileName=="")) || ((as2_myOrgName==null)||(as2_myOrgName=="")) || ((as2_partOrgName==null)||(as2_partOrgName=="")) || ((as2_myPartname==null)||(as2_myPartname=="")) || ((as2_yourPartname==null)||(as2_yourPartname=="")) || ((as2_myEndPoint==null)||(as2_myEndPoint=="")) || ((as2_partendpoint==null)||(as2_partendpoint==""))){
        document.getElementById('protocolmsgAs2').innerHTML = "<font color=red>Please Enter all Mandetory fields in Protocals</font>";
        return false;
    }
            
    if(as2_ssl_req==true){                
        // var ssl_priority = document.getElementById("ssl_priority2").value;
        // var ssl_cipher_stergth = document.getElementById("ssl_cipher_stergth2").value;
        var fileName = document.getElementById("attachmentFileName").value;
        if(((fileName==null)||(fileName==""))){
            document.getElementById('protocolmsgSsl').innerHTML = "<font color=red>Please Enter all amndetory fields in SSL</font>";
            return false;
        }
    }
       
}
            
function validateSMTP(){
             
    var smtp_server_protocol = document.getElementById("smtp_server_protocol").value;
    var smtp_server_port = document.getElementById("smtp_server_port").value;
    var smtp_from_email = document.getElementById("smtp_from_email").value;
    var smtp_to_email = document.getElementById("smtp_to_email").value;
                      
    document.getElementById('tpResultMessage').innerHTML = "";
    //var commnProtocol =document.getElementById('commnProtocol').value;
    if(((smtp_server_protocol==null)||(smtp_server_protocol=="")) || ((smtp_server_port==null)||(smtp_server_port=="")) || ((smtp_from_email==null)||(smtp_from_email=="")) || ((smtp_to_email==null)||(smtp_to_email=="")) ){
        document.getElementById('protocolmsgSmtp').innerHTML = "<font color=red>Please Enter all Mandetory fields in Protocals</font>";
        return false;
    }
}



function addPartner(){
    
      
          
            document.getElementById("headerLabel").style.color="white";
            document.getElementById("headerLabel").innerHTML="Add Partner";
            var overlay = document.getElementById('overlay');
            var specialBox = document.getElementById('specialBox');
          
            overlay.style.opacity = .8;
            if(overlay.style.display == "block"){
                overlay.style.display = "none";
                specialBox.style.display = "none";
               
                
            } else {
                overlay.style.display = "block";
                specialBox.style.display = "block";
            }
}

function partnerAdding(){
    var addpartnerName =document.getElementById("addpartnerName").value;
    var addphoneNo =document.getElementById("addphoneNo").value;
    var addaddress1 =document.getElementById("addaddress1").value;
    var addcity =document.getElementById("addcity").value;
    var addstate =document.getElementById("addstate").value;
    var addcountry =document.getElementById("addcountry").value;
    var addzipCode =document.getElementById("addzipCode").value;
    
    if(addpartnerName.trim()== ""){
        document.getElementById('addpartnerMsg').innerHTML = "<font color=red>Please enter Partner name.</font>";
        return false;   
    }else if(addphoneNo.length==0 || addphoneNo == "" || addphoneNo==null){
        document.getElementById('addpartnerMsg').innerHTML = "<font color=red>Please enter phone number.</font>";
        return false;   
    }else if(addaddress1.length==0 || addaddress1 == "" || addaddress1==null){
        document.getElementById('addpartnerMsg').innerHTML = "<font color=red>Please enter address.</font>";
        return false;   
    }else if(addcity.length==0 || addcity == "" || addcity==null){
        document.getElementById('addpartnerMsg').innerHTML = "<font color=red>Please enter city.</font>";
        return false;   
    }else if(addstate.length==0 || addstate == "" || addstate==null){
        document.getElementById('addpartnerMsg').innerHTML = "<font color=red>Please enter state.</font>";
        return false;   
    }else if(addzipCode.length==0 || addzipCode == "" || addzipCode==null){
        document.getElementById('addpartnerMsg').innerHTML = "<font color=red>Please enter zipcode.</font>";
        return false;   
    }
    
    document.getElementById('addbutton').disabled = true;
        var req = getXMLHttpRequest();
        req.onreadystatechange = readyStateHandlerLoadText(req,addingPartnerNameResponse);
        var url='../ajax/addPartner.action?addpartnerName='+addpartnerName+'&addphoneNo='+addphoneNo+'&addaddress1='+addaddress1+'&addcity='+addcity+'&addstate='+addstate+'&addcountry='+addcountry+'&addzipCode='+addzipCode;
        //alert(url);
        req.open("GET",url,"true");
        req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        req.send(null);
        
}
function addingPartnerNameResponse(resText){
    //alert(resText);
        document.getElementById("addpartnerMsg").innerHTML=resText;
}
function resetPartnerValues(){
    document.getElementById('addbutton').disabled = false;
   document.getElementById("addpartnerMsg").value = "";
   document.getElementById("addpartnerName").value = "";
    document.getElementById("addphoneNo").value = "";
    document.getElementById("addaddress1").value = "";
    document.getElementById("addcity").value = "";
    document.getElementById("addstate").value = "";
    document.getElementById("addcountry").value = "USA";
   document.getElementById("addzipCode").value = "";
   document.getElementById("correctImg").style.display = "none";
   document.getElementById("wrongImg").style.display = "none";
}

function addPtnerLengthValidator(element) {
    var i=0;
    var k=0;
    //alert("In Field Length validator ESCV");
    var addpartnerName =document.getElementById("addpartnerName").value;
    var addphoneNo =document.getElementById("addphoneNo").value;
    var addaddress1 =document.getElementById("addaddress1").value;
    var addcity =document.getElementById("addcity").value;
    var addstate =document.getElementById("addstate").value;
    var addcountry =document.getElementById("addcountry").value;
    var addzipCode =document.getElementById("addzipCode").value;
    if(element.value!=null&&(element.value!="")) {
       
        // alert(element.id);
        if(element.id == 'addpartnerName'|| element.id == 'addphoneNo' || element.id == 'addaddress1' || element.id == 'addcity' || element.id == 'addstate' || element.id == 'addzipCode'){
            i=50;  
        }
                  
        if(element.id == 'addzipCode'){
            i=10;
            validatenumber(element);
        }
        if(element.id == 'addphoneNo'){
            k=1;
            i=15; 
            validatenumber(element);
        }
            
        if(k==1){
            
            if(element.value.replace(/^\s+|\s+$/g,"").length<=9) {
                str=new String(element.value);
                element.value=str.substring(0,i);
            
                //alert("The "+element.id+" must be greater than 9 characters");
                document.getElementById('addpartnerMsg').innerHTML = "<font color=red>Phone Number must be 10 characters</font>";
                element.value="";
                element.focus();
                return false;
            }
            
            if(element.value.replace(/^\s+|\s+$/g,"").length>i) {
                str=new String(element.value);
                element.value=str.substring(0,i);
                //alert("The "+element.id+" must be less than "+i+" characters");
                document.getElementById('addpartnerMsg').innerHTML = "<font color=red>The Value must be less than "+i+" characters</font>";
                element.focus();
                return false;
            }
        }else{
            if(element.value.replace(/^\s+|\s+$/g,"").length>i) {
                str=new String(element.value);
                element.value=str.substring(0,i);
                //alert("The "+element.id+" must be less than "+i+" characters");
                document.getElementById('addpartnerMsg').innerHTML = "<font color=red>The Value must be less than "+i+" characters</font>";
                element.focus();
                return false;
            }
        }
        return true;
        
    }
}

function usrCreationValidation(){
    var regpartnerName =document.getElementById("regpartnerName").value;
    var regcontactName =document.getElementById("regcontactName").value;
    var regcontactEmail =document.getElementById("regcontactEmail").value;
    var regpassword =document.getElementById("regpassword").value;
    var regphoneNo =document.getElementById("regphoneNo").value;
    alert("partner name:"+regpartnerName)
    
    if(regpartnerName.trim()== "" || regpartnerName =="-1"){
        document.getElementById('tpResultMessage').innerHTML = "<font color=red>Please select Partner name.</font>";
        return false;   
    }else if(regcontactName == ""){
        document.getElementById('tpResultMessage').innerHTML = "<font color=red>Please enter Contact name.</font>";
        return false;   
    }else if(regcontactEmail == ""){
        document.getElementById('tpResultMessage').innerHTML = "<font color=red>Please enter email.</font>";
        return false;   
    }else if(regpassword == ""){
        document.getElementById('tpResultMessage').innerHTML = "<font color=red>Please enter password.</font>";
        return false;   
    }else if(regphoneNo == ""){
        document.getElementById('tpResultMessage').innerHTML = "<font color=red>Please enter phone number.</font>";
        return false;   
    }
    return true;
}

    function getDeleteProfile(id){
      alert(id);
    var r=confirm("Are you Confirm deleted Profile "+id);
    if (r==true){
         var req = getXMLHttpRequest();
        req.onreadystatechange = readyStateHandlerLoadText1(req,populateProfileDelete);
        var url="../ajax/getDeleteProfile.action?id="+id;
        req.open("GET",url,"true");
        req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        req.send(null);
        returnType = true;
    }
    else{
        returnType = false;
    }   
    return returnType;
}
function populateProfileDelete(response){
      //alert(response);
      
  //  document.getElementById("profileDeleteMsg").innerHTML=response;
   // document.getElementById("addpartnerMsg").innerHTML=resText;
   window.location = "../tpOnboarding/manageProfile.action";
    //document.getElementById("searchTpOnboard").submit();
}