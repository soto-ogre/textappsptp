

$(function(){
  $(document).on('change', '[name*="category_id"]', function(){
    
    var val = $(this).prop('selectedIndex');
    console.log(val)
    if (window.location.href.match(/\memos\/new/)){
      switch(val) {
        case 0:
        $('textarea').val('#text').change();
        $('.markdown-preview').show();
        break;
        case 1:
        $('textarea').val(`{title:}
{subtitle:}
{c:BPM=97　capo:3}
[N.C.]----|
[C]君を忘れな[G]い　曲が[Am]りくねった道を行[Em]く
産ま[F]れたての太陽[C]と　夢[F]を渡る黄色い砂(す[G]な)
[C]二度と戻れな[G]い　くす[Am]ぐり合って転げた[Em]日 
きっと　[F]想像し[G]た以上に　[C]騒が[Am]しい未来が[F]僕[G]を待って[C]る`).change();
        $('.markdown-preview').hide();
        break;
      }
    }
  });

  marked_js_render();
  $("textarea").each(function () {
    $(this).bind('keyup', replaceMarkdown(this));
  });
  function replaceMarkdown(elm) {
    var v, old = elm.value;
    return function () {
      if (old != (v = elm.value)) {
        old = v;
        str = $(this).val();
        $("#marked-area").html(marked(str));
      }

      $.ajax({
        url: '/memos/new',  
        type: 'GET',
        dataType: 'html',
        async: true,
        data: {
          str: str,
        },
      });
    }

    
    }
});





function marked_js_render(){
  // marked.js + highlight.js
  var renderer = new marked.Renderer()

  // code syntax hilightの編集
  renderer.code = function (code, language) {
      return '<pre' + '><code class="hljs">' + hljs.highlightAuto(code).value + '</code></pre>';
  };
  // tableタグ
  renderer.table = function(header, body) {
      if (body) body = '<tbody>' + body + '</tbody>';
  
      return '<table class="table table-hover">'
      + '<thead>'
      + header
      + '</thead>'
      + body
      + '</table>';
  };
  marked.setOptions({
      renderer: renderer,
  });
}
