<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Proba</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        body {
            padding-top: 60px;
            padding-bottom: 40px;
        }
    </style>

</head>
<body>
<tiles:insertAttribute name="header" />


<div class="container-fluid">
    <div class="row-fluid">
        <div class="span2">
            <div class="well sidebar-nav">
                <ul id="shop-menu" class="nav nav-list">
                    <li class="nav-header">Shop</li>
                    <li><a href="#">Books</a></li>
                    <li><a href="#">Music</a></li>
                    <li><a href="#">Movies</a></li>
                </ul>
                <ul id="catalog-menu" style="display: none" class="nav nav-list">
                    <li class="nav-header">Catalog</li>
                    <li><a href="#">All</a></li>
                    <li><a href="/products/new">New</a></li>
                </ul>
            </div>
        </div>
        <div class="well span6">
            <tiles:insertAttribute name="content"/>
        </div>
        <div class="span4">
            <div class="well">
                <h4>Your Cart</h4>
                <table id="cart" class="table">
                    <c:forEach var="item" items="${items}">
                        <tr>
                            <td><a href="#"><i class="icon-remove-sign"></i></a> ${item.product.name}</td>
                            <td>${item.amount}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
    <hr>


    <footer>
        <p>&copy; Things that matter 2012</p>
    </footer>
</div>
<script src="js/jquery.js"></script>
<script src="assets/js/bootstrap.js"></script>


<script type="text/javascript">
    $(document).ready(function () {
        $("a.buy").click(function () {
            var link = $(this);
            $.ajax({ url: link.attr("href"),
                success: function (feed) {
                    $("#cart > tbody").html("");
                    $.each(feed.items, function (index, item) {
                        $('#cart > tbody:last').append("<tr><td><a href='#'><i class='icon-remove-sign'></i></a> " +
                                item.product.name + "</td><td>" + item.amount + "</td></tr>")
                    });
                },
                error: function (xhr) {
                    alert("error")
                }
            });
            return false;
        });


        $("#catalog").click(function() {
            $("ul#shop-menu").hide();
            $("ul#catalog-menu").show();
            $("li.shop").removeClass("active");
            $("li.catalog").addClass("active");
        })


        $("#shop").click(function() {
            $("ul#shop-menu").show();
            $("ul#catalog-menu").hide();
            $("li.catalog").removeClass("active");
            $("li.shop").addClass("active");
        })
    });
</script>
</body>
</html>
