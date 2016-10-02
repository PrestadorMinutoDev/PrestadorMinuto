/**
 * Created by treinamento on 27/09/16.
 */

$(function() {
    $("#addMore").click(function(e) {
        e.preventDefault();
        $("#fieldList").append("<li>&nbsp;</li>");
        $("#fieldList").append("<li><input type='text' name='phone' placeholder='Name' /></li>");
    });
});