<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>此页面用于javascriptAjax请求XML然后回应响应</title>
</head>
<script type="text/javascript">
	function loadXMLDoc() {

		var xmlhttp;

		var txt, x, i;

		//判断是否遵守的是WC3原则的浏览器
		if (window.XMLHttpRequest) {
			//以下为主流浏览器，且符合WC3原则浏览器： code for IE7+, Firefox, Chrome, Opera, Safari，
			xmlhttp = new XMLHttpRequest();
		} else {
			//以下为不符合WC3原则浏览器： code for IE6, IE5，
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		//xmlhttp回调函数，状态码属性一改变就会调用此方法
		xmlhttp.onreadystatechange = function() {

			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

				xmlDoc = xmlhttp.responseXML;

				txt = "";

				x = xmlDoc.getElementsByTagName("title");
				//x = xmlDoc.getElementsBytagName("author");

				for (i = 0; i < x.length; i++) {

					txt = txt + x[i].childNodes[0].nodeValue + "<br />";

				}
				document.getElementById("myDiv").innerHTML = txt;
			}
		}

		xmlhttp.open("GET", "title.xml", "true");
		xmlhttp.send();
	}
</script>

<body>

	<h2>My Book Collection:</h2>
	<div id="myDiv"></div>
	<button type="button" onclick="loadXMLDoc()">获得我的图书收藏列表</button>

</body>
</html>