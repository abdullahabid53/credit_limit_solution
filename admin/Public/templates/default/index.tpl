<!DOCTYPE html>
<html lang="en">

<head>
	<title>..:: {$CCMAINTITLE} ::..</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link href="templates/default/css/custom.css" rel="stylesheet" type="text/css">
	{* <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> *}
	{if ($CSS_NAME!="" && $CSS_NAME!="default")}
		<link href="templates/default/css/{$CSS_NAME}.css" rel="stylesheet" type="text/css">
	{else}
		<link href="templates/default/css/main.css" rel="stylesheet" type="text/css">
		<link href="templates/default/css/menu.css" rel="stylesheet" type="text/css">
		<link href="templates/default/css/style-def.css" rel="stylesheet" type="text/css">
	{/if}
	<script type="text/javascript" src="./javascript/jquery/jquery-1.2.6.min.js"></script>
	{* <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> *}
</head>

<body class="main-body" style="
;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">


	{literal}
		<script LANGUAGE="JavaScript">
			<!--
		function test() {
			if (document.form.pr_login.value == "" || document.form.pr_password.value == "") {
				alert("You must enter an user and a password!");
				return false;
			} else {
				return true;
			}
		}
		-->
		</script>

	{/literal}
	<div class="container-fluid">
		<form name="form" method="POST" action="PP_intro.php" onsubmit="return test()">
			<input type="hidden" name="done" value="submit_log">


			<div id="login-wrapper" class="login-border-up">
				<div class="login-border-down">
					{* <div class="login-border-center"> *}
						<table border="0" cellpadding="3" cellspacing="12" style="width: 100%;">
							<tr>
								{* <td class="login-title" colspan="2">
									{php} echo gettext("AUTHENTICATION");{/php}
								</td> *}
							</tr>
							<tr>
								{* <td ><img src="templates/{$SKIN_NAME}/images/kicons/lock_bg.png"></td> *}
								<td align="center" " style=" display:
									flex;justify-content:center;align-items:center;flex-wrap: wrap;padding: 25px 0 0
									0;flex-direction:column">
									<table width="90%">

										<img style="width: 65%;" src="../../common/images/logo/go-logo.png"><br>
										{* <br> *}
										<tr align="center">
											<div class="input-group" style="width:85%;margin-top:20px">
											<input required="" type="text" name="pr_login"
											style="width: -webkit-fill-available" class="login-input">
												<label class="login-label">User</label>
											</div>
											{* <br>
													<br> *}
										</tr>
										<tr align="center">
											<div class="input-group" style="width:85%;margin-top:15px">
												<input required="" type="password" name="pr_password"
													style="width: -webkit-fill-available" class="login-input">
												<label class="login-label">Password</label>
											</div>
										</tr>
										<tr>
											<td colspan="2"> &nbsp;</td>
										</tr><br>
										{* <br>
												<label for="name">Name:</label>	<br>
												<input type="text" id="name" name="name" required><br><br> *}

										{* <tr align="right" >
												<td>
													<select name="ui_language"  id="ui_language" class="icon-menu form_input_select">
														<option style="background-image:url(templates/{$SKIN_NAME}/images/flags/gb.gif);" value="english" {php} if(LANGUAGE=="english") echo "selected";{/php} >English</option>
														<option style="background-image:url(templates/{$SKIN_NAME}/images/flags/br.gif);" value="brazilian" {php} if(LANGUAGE=="brazilian") echo "selected";{/php}>Brazilian</option>
														<option style="background-image:url(templates/{$SKIN_NAME}/images/flags/ro.gif);" value="romanian" {php} if(LANGUAGE=="romanian") echo "selected";{/php} >Romanian</option>
														<option style="background-image:url(templates/{$SKIN_NAME}/images/flags/fr.gif);" value="french" {php} if(LANGUAGE=="french") echo "selected";{/php} >French</option>
														<option style="background-image:url(templates/{$SKIN_NAME}/images/flags/gr.gif);" value="greek" {php} if(LANGUAGE=="greek") echo "selected";{/php} >Greek</option>
													</select>
												</td>
												<tr > *}
										<td colspan="2"> &nbsp;</td>
							</tr>



							</tr>

						</table>

						<input type="submit" name="submit" value="{php} echo gettext(" LOGIN");{/php}"
							class="login-button" id="loginbutton">
						</td>
						</tr>
						</table>
					{* </div> *}
				</div>

				<div
					style="color:#BC2222;font-family:Arial,Helvetica,sans-serif;font-size:11px;font-weight:bold;padding-left:10px;">
					{if ($error == 1)}
					{php} echo gettext("AUTHENTICATION REFUSED, please check your user/password!");{/php}
					{elseif ($error==2)}
					{php} echo gettext("INACTIVE ACCOUNT, Please activate your account!");{/php}
					{elseif ($error==3)}
					{php} echo gettext("BLOCKED ACCOUNT, Please contact the administrator!");{/php}
					{/if}
				</div>

				{* <div id="footer_index"><div style=" border: solid 1px #F4F4F4; text-align:center;">{$COPYRIGHT}</div></div> *}

			</div>
		</form>
	</div>
	{literal}

	<script LANGUAGE="JavaScript">
		document.form.pr_login.focus();
		$("#ui_language").change(function() {
			self.location.href = "index.php?ui_language=" + $("#ui_language option:selected").val();
		});
	</script>
{/literal}
