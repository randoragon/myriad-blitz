/// @description flip_encode(val,key);
/// @param val
/// @param key

//Key's characters all have to be u(0-255).

var input=string(argument[0]);
var key=string(argument[1]);
var key_length=string_length(key);

var cipher_key;
for(var i=0; i<key_length; i++) {
cipher_key[i]=string_ord_at(key,i);
}

var output="";
for(var i=1; i<=string_length(input); i++) {
output+=chr((string_ord_at(input,i)+cipher_key[i%key_length])%255);
}

return output;

