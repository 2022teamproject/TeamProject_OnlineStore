<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table {
	margin: 0 auto;
}
</style>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- ������ ���ó�¥ ���� -->
<script type="text/javascript">
	window.onload = function() {
		today = new Date();
		console.log("today.toISOString() >>>" + today.toISOString());
		today = today.toISOString().slice(0, 10);
		console.log("today >>>> " + today);
		bir = document.getElementById("todayin");
		bir.value = today;
	}
</script>
<!-- ���̵� �ߺ�üũ -->
<script type="text/javascript">
	$('idCheck').click(function() {
		var userid={"userid":userid=$('#userid').val()};
		var data=JSON.stringify(sellerid);
		var $.ajax({
			url :"idCheck",
			method:"POST",
			data:{data:data},
			dataType: "json"
		});
		request.done(function (data) {
			console.log(data.result)
			if(data.result=="Y"){
			$('#idCheck').attr('idCheck','Y');
			alert('��� ������ ���̵��Դϴ�.');
			} else{
				$('#idCheck').attr('idCheck','N');
				alert('����� �� ���� ���̵��Դϴ�.');
			}
			
		});
		request.fail(function (jqXHR, mtextStatus) {
			alert("request failed:"+textStatus);
		});
	});
</script>
<!-- ��ȿ���˻� -->
<script type="text/javascript">
	$('loginn').click(function {
		var f = document.form;

		//���̵� ��ȿ��
		var vid = /^[A-Za-z0-9]{4,12}$/;
		var cid = f.userid.value;
		if (cid == "") {
			alert("���̵�� ������ �� �����ϴ�.");
			f.userid.select();
			return false;
		}
		if (!vid.test(cid)) {
			alert("���̵�� �����ڿ� �������� 4~12�ڸ��� �Է��ؾ��մϴ�.");
			f.userid.select();
			return false;
		}

		//�н����� ��ȿ��
		var vpw = /^[A-Za-z0-9]{6,12}$/;
		var cpw = f.userpw.value;
		if (cpw == "") {
			alert("��й�ȣ�� ������ �� �����ϴ�.");
			f.userpw.select();
			return false;
		}
		if (!vpw.test(cpw)) {
			alert("��й�ȣ�� �����ڿ� ���� 6~12�ڸ��� �Է��ؾ��մϴ�.");
			f.userpw.select();
			return false;
		}

		//��й�ȣȮ��
		var p1 = f.userpw.value;
		var p2 = f.userpw2.value;
		if (p1 != p2) {
			alert("��й�ȣ�� ��ġ ���� �ʽ��ϴ�");
			return false;
		}
		//��ȭ��ȣ ��ȿ��
		var vmobile = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
		var cmobile = f.smobile.value;
		if (!vmobile.test(cmobile)) {
			alert("��ȭ��ȣ �Է� ������ �����ּ���.");
			f.smobile.select();
			return false;
		}
		
		//�̸��� ��ȿ��
		$("#umail3").change(function(){
            $("#umail2").val( $("#umail3").val() );
        });
		}
	
		$('form').submit(function() {
			var uemail1 = $('loginn[name=uemail1]').val();
			var uemail2 = $('loginn[name=uemail2]').val();
			var uemail = uemail1 + '@' + uemail2;
			$('loginn[name=uemail]').val(uemail);
			return false;
		});
	});
	f.submit;
</script>
<title>�α���</title>
</head>

<body>
	<form name="ff" action="loginCheck" method="post">
	<input type="datetime" name="nowtime" id="nowtime" readonly>
	<br>
	<br>
	<br>
	<br>
		<table width="400" align="center">
			<tr>
				<th>���̵�</th>
				<td><input type="text" name="userid" id="id"></td>
			</tr>
			<tr>
				<th>��й�ȣ</th>
				<td><input type="password" name="userpw" id="pw"></td>
			</tr>
			<tr>
				<td></td>
				<td align="center" colspan="2"><input type="submit" value="�α���">
					&emsp; <input type="reset" value="���"></td>
			</tr>
			<tr>
				<td colspan="3"><a href="loginn">ȸ������</a>&emsp;&emsp;
				<a href="/shop/seller/index">�Ǹ��� �α���</td>
		    </tr>
		</table>
	</form>
</body>
</body>
</html>