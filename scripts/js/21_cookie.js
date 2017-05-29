function set_cookie(cookie_identifier,cvalue,days) {
    var date = new Date();
    date.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires=" + date.toGMTString();
    document.cookie = cookie_identifier + "=" + cvalue + ";" + expires + ";path=/";
}

function get_cookie(cookie_identifier) {
    var key = cookie_identifier + "=";
    var decoded_cookie = decodeURIComponent(document.cookie);
    var ca = decoded_cookie.split(';');
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(key) == 0) {
            return c.substring(key.length, c.length);
        }
    }
    return "";
}

function check_cookie(cookie_identifier = "poptinis_21") {
    var value=get_cookie(cookie_identifier);
    if (value.length > 0) {
        if (value == "true") {
            //user has confirmed they are 21+ in the past, let them on in!
            return;
        } else {

        }
    } else {
       response = prompt("Are you 21","");
       if (response != null) {
            // if (response == "true") {
            //     set_cookie(cookie_identifier, "true", 7);
            // }
            // else (response == "false") {
            //     set_cookie(cookie_identifier, "false", 1);
            // }
       }
    }
}
