<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>此页面用于javascriptAjax请求java或servlet然后回应响应</title>
</head>
<script type="text/javascript"></script>
<script>
	/* $(document).ready(function() {
		$("a").click(function() {

			$.ajax({
				type : "post",
				url : "testAjax.jsp",
				data : $('#htmlContainer').serialize(),//发送请求
				success : function(data, success) {
					alert(data);
				}
			})
		})
	});
	 */
	function loadXMLDoc() {

		//声明接收数据变量
		var xmlhttp;

		// 对象用于和服务器交换数据
		if (window.XMLHttpRequest) {

			//接收服务器交换的数据
			xmlhttp = new XMLHttpRequest();

		} else {

			//针对一定的浏览器
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		//onreadystatechange 用于存储函数每当 readyState属性改变时，就会调用该函数
		xmlhttp.onreadystatechange = function() {

			//xmlhttp.readyState == 4 表示 XMLHttpRequest的状态从0到4,4表示请求已完成，响应已就绪，
			//xmlhttp.status==200 表示OK，并且进入该判断

			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("myDiv").innerHTML = xmlhttp.responseText;
			}
		}

		//请求类型默认为 GET, 文件路径,同步或异步既true或false 
		xmlhttp.open("GET", "uas", true);

		//将请求发送到服务器。
		xmlhttp.send();
	}
</script>

<body>
	<h2>AJAX</h2>
	<input type="submit" onclick="loadXMLDoc()" value="请求数据">
	<!-- 	</button>
 -->
	<div id="myDiv"></div>


</body>
</html>