<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    
      var windowPosition = function(){
        //ローカルストレージからデータを取得
        var windowPosition;
        windowPosition = localStorage.getItem('windowPosition');
        windowPosition = window.localStorage.getItem('windowPosition');
        windowPosition = localStorage.windowPosition;
        //読み込んだ表示位置を復元
        $(window).scrollTop(windowPosition);
        //読み込んだらローカルストレージをクリア
        localStorage.clear();
        window.localStorage.clear();
        //submitした時の表示位置をローカルストレージに保存
        $('input[type="submit"]').click(function(){
          windowPosition = $(window).scrollTop();
          localStorage.setItem('windowPosition', windowPosition);
          window.localStorage.setItem('windowPosition', windowPosition);
          localStorage.windowPosition = windowPosition;
        });
      }();
   