//プロジェクトタイトルのリアルタイム文字数カウント
function ShowLength(str) {
  document.getElementById('wordcnt').innerHTML = str.length + '/30';
}

//PCのときプロジェクトBASICにボーダーを追加する機能
function BorderDevice() {
  let pc = document.getElementsByClassName('project-label');
  if (window.matchMedia('(min-width: 576px)').matches) {
    for (let i = 0; i < pc.length; i++) {
      pc.item(i).classList.add('border-right');
    }
  } else {
    for (let i = 0; i < pc.length; i++) {
      pc.item(i).classList.remove('border-right');
    }
  }
}

//リターンがlimitかどうか
function LimitClick() {
  let limit = document.getElementById('togglelimit');
  if (limit.style.display == 'none') {
    limit.style.display = 'inline';
  } else {
    limit.style.display = 'none';
  }
}

//画像のプレビュー
$(document).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function(e) {
        $('#avatar_img_prev').attr('src', e.target.result);
      };
      reader.readAsDataURL(input.files[0]);
    }
  }

  $('#post_img').change(function() {
    $('#avatar_img_prev').removeClass('d-none');
    $('.avatar_present_img').remove();
    readURL(this);
  });
});

//Reward/Edit時に商品がLimitからUnlimitedに変わったことを反映させる機能
function CheckLimit() {
  if (!document.getElementById('customCheck1').checked) {
    document.getElementById('togglelimit').value = 0;
  }
}
