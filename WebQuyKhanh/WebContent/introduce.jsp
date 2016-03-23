<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="author" content="Minh Duc" />
	<title>Trung Tâm Du Học và Nhật Ngữ Quý Khanh</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/mycss/styleintroduce.css">
	<script src="js/jquery-2.2.0.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#myCarousel-post").carousel({
				interval:5000
			})
			$("#myCarousel-post").on("slid.bs.carousel",function(){

			});
	});
	</script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#myCarousel-teacher").carousel({
				interval:3000
			})
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function(){
			var documentEl = $(document);
			var parallaxBg= $(".parallax-bg");

			documentEl.on("scroll",function(){
				var currScrollPos= $(documentEl).scrollTop();
				parallaxBg.css("scroll","0"+ -currScrollPos/4 + "px");
				console.log("Scroll :" +currScrollPos);
			});
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function(){
			var documentEl = $(document);
			var mCircles= $(".m-circle");
			var mRectangles= $(".m-rectangle");
			var mTexts= $(".m-text");
			for(var i=0; i<mCircles.length; i++){
				$(mCircles[i]).hide();
				$(mRectangles[i]).hide();
			}
			for(var i=0; i<mTexts.length; i++){
				$(mTexts[i]).hide();
			}
			var flagCircle=true;
			var flagText=true;
			documentEl.on("scroll",function(){
				var currScrollPos= $(documentEl).scrollTop();
				if(currScrollPos>=265 && flagCircle==true){
					for(var i=0; i<mCircles.length; i++){
						$(mCircles[i]).fadeIn(2000);
						$(mRectangles[i]).fadeIn(2000);
					}
					flag=false;
				}
				if(currScrollPos>=1420 && flagText==true){
					for(var i=0; i<mTexts.length; i++){
						$(mTexts[i]).fadeIn(2000);
					}
				}
			});
		});
	</script>

</head>
<body>
	<div class="container">
		<div class="row" style="margin-top:10px; margin-bottom:10px">
			<img class="img-circle" src="image/iconqk.jpg" width="100px"; height="100px"; alt="hinh">
			<h1 class="m-title">Trung Tâm Du Học và Nhật Ngữ Quý Khanh</h1>
		</div>
	</div>
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
		  </ol>

		  <!-- Wrapper for slides -->
		  <div class="carousel-inner" role="listbox">
		    <div class="item active">
		      <img src="image/image1.jpg" alt="hinh">
		      <div class="carousel-caption">
		      </div>
		    </div>
		    <div class="item">
		      <img src="image/phusi2.jpg" alt="hinh">
		      <div class="carousel-caption">
		      </div>
		    </div>
		    <div class="item">
		      <img src="image/image2.jpg" alt="hinh">
		      <div class="carousel-caption">
		      </div>
		    </div>
		  </div>

		  <!-- Controls -->
		  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-12" style="text-align:center; margin-top:10px">
				<a class="btn btn-primary m-btn" href="home.html">Trang Chủ</a>
				<a class="btn btn-primary m-btn" href="#">Học từ vựng</a>
			</div>			
		</div>
	</div>
	<div class="container" style="margin-top:20px;">
		<div class="row parallax-bg" style="margin-bottom:50px;">
			<div class="col-lg-12">
				<div class="col-lg-4">
					<div class="m-circle">
						<a href="#"><h4>Du Học Nhật Ngữ Quý Khanh</h4></a>
					</div>
					<div class="m-rectangle">
						
					</div>
				</div>
				<div class="col-lg-4">
					<div class="m-circle ">
						<a href="#"><h4>Tư Vấn - Dịch Thuật Quý Khanh</h4></a>
					</div>
					<div class="m-rectangle">
			
					</div>
				</div>
				<div class="col-lg-4">
					<div class="m-circle ">
						<a href="#"><h4>Liên Kết Đào Tạo</h4></a>
					</div>
					<div class="m-rectangle">
						
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="row" style="margin-top:50px; margin-bottom:50px">
			<div id="myCarousel-post" class="carousel slide" data-ride="carousel">
			  <div class="carousel-inner" role="listbox">
			    <div class="item active">
			    	<div class="row">
				      	<div class="col-lg-4"><a href="#"><img src="image/image1.jpg" alt="hinh"></a></div>
				      	<div class="col-lg-4"><a href="#"><img src="image/image1.jpg" alt="hinh"></a></div>
				      	<div class="col-lg-4"><a href="#"><img src="image/image1.jpg" alt="hinh"></a></div>
			      	</div>
			    </div>
			    <div class="item">
			      	<div class="row">
			      		<div class="col-lg-4"><a href="#"><img src="image/phusi2.jpg" alt="hinh"></a></div>
			      		<div class="col-lg-4"><a href="#"><img src="image/phusi2.jpg" alt="hinh"></a></div>
			      		<div class="col-lg-4"><a href="#"><img src="image/phusi2.jpg" alt="hinh"></a></div>
			      	</div>
			    </div>
			    <div class="item">
			    	<div class="row">
			      		<div class="col-lg-4"><a href="#"><img src="image/image2.jpg" alt="hinh"></a></div>
			      		<div class="col-lg-4"><a href="#"><img src="image/image2.jpg" alt="hinh"></a></div>
			      		<div class="col-lg-4"><a href="#"><img src="image/image2.jpg" alt="hinh"></a></div>
			      	</div>
			    </div>
			  </div>

			  <!-- Controls -->
			  <a class="left carousel-control" href="#myCarousel-post" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="right carousel-control" href="#myCarousel-post" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
		</div>
		<hr>
		<div class="row" style="margin-top:50px; margin-bottom:50px">
			<div id="myCarousel-teacher" class="carousel slide" data-ride="carousel">
			  <div class="carousel-inner" role="listbox">
			    <div class="item active">
			    	<div class="row">
				      	<div class="col-lg-3">
				      		<div class="teacher-info">
				      			<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
				      		</div>
				      		<a href="#"><img src="image/avata-Katie.png" alt="hinh"></a>
				      		<h6>Teacher name</h6>
				      	</div>
				      	<div class="col-lg-3">
				      		<div class="teacher-info">
				      			<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
				      		</div>
				      		<a href="#"><img src="image/avata-Katie.png" alt="hinh"></a>
				      		<h6>Teacher name</h6>
				      	</div>
				      	<div class="col-lg-3">
				      		<div class="teacher-info">
				      			<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
				      		</div>
				      		<a href="#"><img src="image/avata-Katie.png" alt="hinh"></a>
				      		<h6>Teacher name</h6>
				      	</div>
				      	<div class="col-lg-3">
				      		<div class="teacher-info">
				      			<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
				      		</div>
				      		<a href="#"><img src="image/avata-Katie.png" alt="hinh"></a>
				      		<h6>Teacher name</h6>
				      	</div>
			      	</div>
			    </div>
			    <div class="item">
			      	<div class="row">
			      		<div class="col-lg-3">
			      			<div class="teacher-info">
			      				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>			      				
			      			</div>
			      			<a href="#"><img src="image/avata-Steve.png" alt="hinh"></a>
			      			<h6>Teacher name</h6>
			      		</div>
			      		<div class="col-lg-3">
			      			<div class="teacher-info">
			      				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>			      				
			      			</div>
			      			<a href="#"><img src="image/avata-Steve.png" alt="hinh"></a>
			      			<h6>Teacher name</h6>
			      		</div>
			      		<div class="col-lg-3">
			      			<div class="teacher-info">
			      				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>			      				
			      			</div>
			      			<a href="#"><img src="image/avata-Steve.png" alt="hinh"></a>
			      			<h6>Teacher name</h6>
			      		</div>
			      		<div class="col-lg-3">
			      			<div class="teacher-info">
			      				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>			      				
			      			</div>
			      			<a href="#"><img src="image/avata-Steve.png" alt="hinh"></a>
			      			<h6>Teacher name</h6>
			      		</div>
			      	</div>
			    </div>
			    <div class="item">
			    	<div class="row">
			      		<div class="col-lg-3">
			      			<div class="teacher-info">
			      				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>	
			      			</div>
			      			<a href="#"><img src="image/avata-mitchell.png" alt="hinh"></a>
			      			<h6>Teacher name</h6>
			      		</div>
			      		<div class="col-lg-3">
			      			<div class="teacher-info">
			      				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>	
			      			</div>
			      			<a href="#"><img src="image/avata-mitchell.png" alt="hinh"></a>
			      			<h6>Teacher name</h6>
			      		</div>
			      		<div class="col-lg-3">
			      			<div class="teacher-info">
			      				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>	
			      			</div>
			      			<a href="#"><img src="image/avata-mitchell.png" alt="hinh"></a>
			      			<h6>Teacher name</h6>
			      		</div>
			      		<div class="col-lg-3">
			      			<div class="teacher-info">
			      				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>	
			      			</div>
			      			<a href="#"><img src="image/avata-mitchell.png" alt="hinh"></a>
			      			<h6>Teacher name</h6>
			      		</div>
			      	</div>
			    </div>
			  </div>

			  <!-- Controls -->
			  <a class="left carousel-control" href="#myCarousel-teacher" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="right carousel-control" href="#myCarousel-teacher" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
		</div>
		<hr>
		<div class="row" style="margin-top:50px; margin-bottom:50px">
			<div class="col-lg-12 m-div">
				<div class="m-text">
					<h3>Thông tin liên hệ</h3>
					<h5>230 Nguyễn Tri Phương - Thanh Khê - Đà Nẵng</h5>
				</div>
				<div class="m-text">
					<h3>Điện Thoại</h3>
					<h5>0511 6282 666</h5>
				</div>
				<div class="m-text">
					<h3>Email</h3>
					<h5>duhocquykhanh@gmail.com</h5>
				</div>
			</div>
		</div>
		<div class="row">
			<iframe src="https://www.google.com/maps/d/u/0/embed?mid=zbL1GksznTqg.kr35Pcwz-gSo" width="100%" height="480"></iframe>	
		</div>
	</div>

</body>
</html>