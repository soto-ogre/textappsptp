$(function() {
  // disable auto discover
  Dropzone.autoDiscover = false;

   $(".dropzone").dropzone({
    autoProcessQueue:false, 
    dictDefaultMessage: 'アップロードするファイルをここへドロップしてください',
    previewsContainer:".preview",
    thumbnailHeight:"120",
    thumbnailWidth:"120",
    thumbnailMethod:"contain",
    maxFiles:"10",
    addRemoveLinks:true,
    dictRemoveFile:'削除'
  });

  $('submit').click(function(){
    e.preventDefault();
    myDropzone.processQueue()
  })

});
