//プロジェクトタイトルのリアルタイム文字数カウント
function ShowLength(str){
    document.getElementById("wordcnt").innerHTML = str.length + '/30';
}

//PCのときプロジェクトBASICにボーダーを追加する機能
function BorderDevice(){
    let pc = document.getElementsByClassName("project-label");
    if(window.matchMedia( "(min-width: 576px)" ).matches){
        for(let i = 0; i < pc.length; i++){
          pc.item(i).classList.add('border-right');
        }
    } else{
        for(let i = 0; i < pc.length; i++){
          pc.item(i).classList.remove('border-right');
        }
    }
}

//
$(function(){
    $fileField = $('#file')

    // 選択された画像を取得し表示
    $($fileField).on('change', $fileField, function(e) {
      file = e.target.files[0]
      reader = new FileReader(),
      $preview = $("#img_field");

      reader.onload = (function(file) {
        return function(e) {
          $preview.empty();
          $preview.append($('<img>').attr({
            src: e.target.result,
            width: "100%",
            class: "preview",
            title: file.name
          }));
        };
      })(file);
      reader.readAsDataURL(file);
    });
  });