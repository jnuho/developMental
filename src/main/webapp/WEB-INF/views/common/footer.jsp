<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <style>
    #common-footer{
      background-size: cover !important;
      background-position: center center !important;
      height: 30vh !important;
      display: flex !important;
      margin-bottom: 0px;
      font-size: 15px;
    }
  </style>

  <footer class="my-0 pt-5 pb-0" id="common-footer">
    <div class="container py-0">
      <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-2">
          <div class="col-md">
            <p class='text-secondary'>
              <a class="navbar-brand " href="${path}" >
                <img src="${path}/resources/images/icons8-broken-robot-48.png">
              </a>
              <span class="d-block mb-3 text-muted">&copy; 2019.11.12</span>
            </p>
            <ul class="list-unstyled text-small">
            </ul>
          </div>
        </div>
        <div class="col-2 col-md">
          <p class='text-secondary'>Help</p>
          <ul class="list-unstyled">
            <li><a class="text-secondary" href="#">Resource</a></li>
            <li><a class="text-secondary" href="#">Resource name</a></li>
            <li><a class="text-secondary" href="#">Another resource</a></li>
            <li><a class="text-secondary" href="#">Final resource</a></li>
          </ul>
        </div>
        <div class="col-2 col-md">
          <p class='text-secondary'>About Us</p>
          <ul class="list-unstyled">
            <li><a class="text-secondary" href="#">Team</a></li>
            <li><a class="text-secondary" href="#">Locations</a></li>
            <li><a class="text-secondary" href="#">Privacy</a></li>
            <li><a class="text-secondary" href="#">Terms</a></li>
          </ul>
        </div>
        <div class="col-2 col-md">
          <p class='text-secondary'>Contact Us</p>
          <ul class="list-unstyled">
            <li><a class="text-secondary" href="#">010-1234-1234</a></li>
            <li><a class="text-secondary" href="#">120 East 12th Street, Manhattan, 1003, NY USA</a></li>
            <li>
              <div class="row social-list">
                <div class="col-sm-3 col-xs-2 col-sm-offset-0 col-xs-offset-2 px-0">
                  <a href="" class="">
                    <span class="fa-stack fa-lg text-secondary" href="">
                      <i class="fa fa-linkedin fa-stack-1x"></i>
                    </span>
                  </a>
                </div>
                <div class="col-sm-3 col-xs-2 px-0">
                  <a href="" class="">
                    <span class="fa-stack fa-lg text-secondary">
                      <i class="fa fa-instagram fa-stack-1x"></i>
                    </span>
                  </a>
                </div>
                <div class="col-sm-3 col-xs-2 px-0">
                  <a href="" class="">
                    <span class="fa-stack fa-lg text-secondary">
                      <i class="fa fa-twitter fa-stack-1x"></i>
                    </span>
                  </a>
                </div>
                <div class="col-sm-3 col-xs-2 px-0">
                  <a href="" class="">
                    <span class="fa-stack fa-lg text-secondary">
                      <i class="fa fa-facebook-official fa-stack-1x"></i>
                    </span>
                  </a>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer>
  <!-- <div class="container footer my-5 w-100 form">
  </div> -->

  <!-- back to top -->
  <a id="back-to-top" href="#" class="btn btn-outline-dark back-to-top py-1 px-2" role="button">
    <i class="fa fa-chevron-up">&nbsp;&nbsp;Top</i>
  </a>

  <!-- Bootstrap JS -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

  <script>
    $(function(){
      $(window).scroll(function () {
        if ($(this).scrollTop() > 40) {
          $('#back-to-top').fadeIn();
        } else {
          $('#back-to-top').fadeOut();
        }
      });

      $('#back-to-top').click(function() {
        $('body,html').animate({
          scrollTop: 0
        }, 300);
        return false;
      });

    });
  </script>
  </div>



  <!-- Credit links for icon image -->
  <style> .free-icons{display:none} </style>
  <div class="free-icons">
    <a target="_blank" href="https://icons8.com/icons/set/pixel-heart">Pixel Heart</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
    <a target="_blank" href="https://icons8.com/icons/set/time">Time</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
    <a target="_blank" href="https://icons8.com/icons/set/database-export">Database Export</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
    <a target="_blank" href="https://icons8.com/icons/set/queue">Queue</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
    <a target="_blank" href="https://icons8.com/icons/set/open-box">Open Box</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
    <a target="_blank" href="https://icons8.com/icons/set/back">Back</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
    <a target="_blank" href="https://icons8.com/icons/set/database">Database</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
    <a target="_blank" href="https://icons8.com/icons/set/business-contact">Contact Details</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
    <a target="_blank" href="/icons/set/doughnut-chart--v2">Doughnut Chart icon</a> by <a target="_blank" href="https://icons8.com">Icons8</a>

    <div>Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
  </div>

</body>
</html>