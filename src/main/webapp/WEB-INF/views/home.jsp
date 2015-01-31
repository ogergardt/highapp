<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div id="myCarousel" class="carousel slide">
                <div class="carousel-inner">
                  <div class="item active">
                    <img src="http://farm4.static.flickr.com/3213/2464885290_208ca5afa7_m.jpg" alt="">
                    <div class="carousel-caption">
                      <h4>Home Page</h4>
                      <p>The application home page</p>
                    </div>
                  </div>
                  <div class="item">
                    <img src="http://farm3.static.flickr.com/2305/2464064429_2310ab60b2_m.jpg" alt="">
                    <div class="carousel-caption">
                      <h4>The accounts page</h4>
                      <p>List account with pagination and sorting support.</p>
                    </div>
                  </div>
                  <div class="item">
                    <img src="http://farm3.static.flickr.com/2143/2769889963_7d51ce2702_m.jpg" alt="">
                    <div class="carousel-caption">
                      <h4>Create account operation</h4>
                      <p>Create account page with client side validation.</p>
                    </div>
                  </div>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
</div>

<div class="hero-unit">
	<h2>Hello, ${username}!</h2>
	<p>${message}</p>
	<ul>
		<li>Server time: ${serverTime}</li>
		<li>Language: ${locale}</li>
	</ul>
	
</div>
