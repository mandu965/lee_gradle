 // http://blog.alexmaccaw.com/css-transitions
 
 $.fn.emptyCheck = function () {
	  alert(1);
	  /*var value = obj.val();
	  if( value == "" || value == null || value == undefined || 
			  ( value != null && typeof value == "object" && !obj.keys(value).length ) ){
		  return true;
	  }else{ 
		  return false ;
		}*/

  };

  
  function paging_script(pageIndex, pageSize, form, url) {
	  var form_id = '#'+form;
	  $(form_id).find("#pageIndex").val(pageIndex);
	  $(form_id).find("#pageSize").val(pageSize);
	  $(form_id).attr('action', url).submit();
	  return false;
  };