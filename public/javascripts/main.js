jQuery(document).ready(function(){

  function notebook_url() {
    var re = new RegExp(/(\/notebooks\/(\d+))/);
    var m = re.exec(document.location.href);
    return m[1];
  }

  if ( jQuery("#new_note").length ) {
    jQuery("#new_note").click(function(){
      url = notebook_url()+"/notes/new";
      jQuery.get(url, function(data) {
        jQuery("#notebook_content .content").prepend(data);
        jQuery("#note_form").ajaxForm({
                target:        '#note_form',
                success: function(responseText, statusText) {
                  add_note_edit_btn();
                }
          });
      });
    })
  }
  
  function add_note_edit_btn() {
    if ( jQuery("#notebook_content").length ) {
      jQuery("#notebook_content .content .note").each(function() {
        if ( ! jQuery(this).find(".edit_note_btn").length )
          jQuery(this).prepend("<a class='edit_note_btn'><img src='/images/page_white_edit.png' /></a>");
      });
      jQuery("#notebook_content .content .note").hover(
        function() {
          jQuery(this).find(".edit_note_btn").show();
        },
        function() {
          jQuery(this).find(".edit_note_btn").hide();
        }
      );
      jQuery("#notebook_content .content .edit_note_btn").click(function(){
        target = jQuery(this).closest(".note");
        note_id = jQuery(target).attr('id').replace('note_', '');
        url = notebook_url()+"/notes/"+note_id+"/edit";
        jQuery.get(url, function(data) {
          jQuery(target).html(data);
          jQuery("#note_form").ajaxForm({
                  success: function(responseText, statusText) {
                    jQuery(target).replaceWith(responseText);
                    add_note_edit_btn();
                  }
            });
        });      
      });
    }
  }
  
  add_note_edit_btn();

});