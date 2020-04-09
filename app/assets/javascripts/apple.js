$(function () {

  
  // // クリックで画像を選択する場合
  $('#drop_area').on('click', function () {
    $('#input_file').click();
  });

  $('#drop_area').on('dragenter dragover', function (event) {
    event.stopPropagation();
    event.preventDefault();
    $('#drop_area').css('border', '1px solid #333');  // 枠を実線にする
  });
  $('#drop_area').on('dragleave', function (event) {
    event.stopPropagation();
    event.preventDefault();
    $('#drop_area').css('border', '1px dashed #aaa');  // 枠を点線に戻す
  });


  $('#drop_area').on('drop', function (event) {
    event.preventDefault();

    $('#input_file').each(function(i) {
      $('#input_file')[i].files = event.originalEvent.dataTransfer.files;
      handleFiles($('#input_file')[i].files);
    })
    
  });

    $('#input_file').change(function(){
      
      if ( !this.files.length ) {
        return;
      }
      $('#preview_field').text('');
   
      var $files = $(this).prop('files');
      var len = $files.length;
      for ( var i = 0; i < len; i++ ) {
        var file = $files[i];
        var fr = new FileReader();
   
        fr.onload = function(e) {
          var src = e.target.result;
          var img = '<img src="'+ src +'" width="150px">';
          var html =  `<li class="item-image-container__unit--preview">
                        <div class="item-image-container__unit--caption">
                          ${img}
                        </div>
                        <div class="image-option">
                          <div  class="image-option__list">
                            <div class="image-option__list--tag">編集</div>
                          </div>
                          <div class="image-option__list">
                            <a class="image-option__list--tag">削除</a>
                          </div>
                        </div>
                      </li>`
          $('#preview_field').append(html);
        }
   
        fr.readAsDataURL(file);
      }
   
      $('#preview_field').css('display','block');
    });

  })