{include file="header.tpl"}
<link href="templates/default/css/custom.css" rel="stylesheet" type="text/css">
{if ($popupwindow == 0)}
	<div id="left-sidebar">
		<div id="leftmenu-top" style="padding: 0 10px 0 15px;">
			<div id="leftmenu-down">
				<div id="leftmenu-middle">

					<ul id="nav" class="sidebar-scroll-stl">
						<div class="" style="display: flex;align-items: center;justify-content: center;">
							<img class="mb-5 mt-2" width="150" style="padding:20px 2px 4px 20px; margin-right: 15%;"
								src="../../common/images/logo/go-dash-logo.png" />
						</div>

						{if ($ACXCUSTOMER > 0) }
							<div class="toggle_menu">
								<li>

									<a href="javascript:;" class="toggle_menu" target="_self">
										<div>
											{* customer icon *}
											<div
												class="{if $section == "1"}menu-active{/if} d-flex justify-content-between mx-2">
												<div class="d-flex ">
													<div style="padding: 0px 10px 0px 8px;">
														<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
															viewBox="0 0 18 18"
															fill="{if $section == "1"}#014952{else}none{/if}">
															<path
																d="M0.211772 8.71919C0.324103 8.80344 0.4653 8.83961 0.604303 8.81975C0.743305 8.7999 0.868726 8.72563 0.952974 8.6133C1.39681 8.02153 1.97233 7.54121 2.63396 7.2104C3.29558 6.87958 4.02515 6.70736 4.76487 6.70736C5.50459 6.70736 6.23416 6.87958 6.89578 7.2104C7.55741 7.54121 8.13293 8.02153 8.57676 8.6133C8.66114 8.7255 8.78663 8.79959 8.92562 8.81928C9.06462 8.83897 9.20574 8.80265 9.31797 8.71831C9.35807 8.68881 9.39347 8.6534 9.42297 8.6133C9.8668 8.02153 10.4423 7.54121 11.104 7.2104C11.7656 6.87958 12.4951 6.70736 13.2349 6.70736C13.9746 6.70736 14.7042 6.87958 15.3658 7.2104C16.0274 7.54121 16.6029 8.02153 17.0468 8.6133C17.1311 8.72563 17.2567 8.79985 17.3957 8.81962C17.5348 8.8394 17.6761 8.80311 17.7884 8.71875C17.9007 8.63438 17.9749 8.50885 17.9947 8.36977C18.0145 8.23068 17.9782 8.08944 17.8938 7.97711C17.2273 7.08438 16.3178 6.40248 15.2741 6.01292C15.8304 5.58671 16.2392 4.9969 16.443 4.32638C16.6468 3.65586 16.6354 2.93832 16.4104 2.27461C16.1854 1.6109 15.758 1.03438 15.1885 0.626061C14.6189 0.217742 13.9357 -0.00184631 13.2349 -0.00184631C12.534 -0.00184631 11.8508 0.217742 11.2813 0.626061C10.7117 1.03438 10.2844 1.6109 10.0593 2.27461C9.83433 2.93832 9.82293 3.65586 10.0267 4.32638C10.2306 4.9969 10.6394 5.58671 11.1957 6.01292C10.3607 6.32404 9.60924 6.82451 9.00031 7.47503C8.39112 6.8244 7.63934 6.32392 6.80406 6.01292C7.36038 5.58671 7.76917 4.9969 7.97299 4.32638C8.17681 3.65586 8.16541 2.93832 7.94039 2.27461C7.71537 1.6109 7.28805 1.03438 6.71847 0.626061C6.14889 0.217742 5.46569 -0.00184631 4.76487 -0.00184631C4.06405 -0.00184631 3.38085 0.217742 2.81127 0.626061C2.24169 1.03438 1.81437 1.6109 1.58935 2.27461C1.36433 2.93832 1.35293 3.65586 1.55675 4.32638C1.76057 4.9969 2.16936 5.58671 2.72568 6.01292C1.68168 6.4025 0.772111 7.08476 0.105886 7.97799C0.0641707 8.03361 0.0338189 8.0969 0.0165639 8.16425C-0.000691045 8.2316 -0.00451136 8.30169 0.00532106 8.37052C0.0151535 8.43934 0.0384461 8.50556 0.073869 8.56539C0.109292 8.62521 0.156151 8.67747 0.211772 8.71919ZM13.2357 1.0601C13.6895 1.0601 14.1331 1.19466 14.5103 1.44674C14.8876 1.69883 15.1817 2.05714 15.3553 2.47635C15.529 2.89556 15.5744 3.35684 15.4859 3.80188C15.3973 4.24691 15.1788 4.65569 14.858 4.97654C14.5371 5.29739 14.1284 5.51589 13.6833 5.60441C13.2383 5.69294 12.777 5.6475 12.3578 5.47386C11.9386 5.30022 11.5803 5.00617 11.3282 4.62889C11.0761 4.25161 10.9416 3.80805 10.9416 3.3543C10.9416 2.74584 11.1833 2.1623 11.6135 1.73206C12.0438 1.30181 12.6273 1.0601 13.2357 1.0601ZM4.76487 1.0601C5.21862 1.0601 5.66218 1.19466 6.03946 1.44674C6.41673 1.69883 6.71079 2.05714 6.88443 2.47635C7.05807 2.89556 7.10351 3.35684 7.01498 3.80188C6.92646 4.24691 6.70796 4.65569 6.38711 4.97654C6.06626 5.29739 5.65747 5.51589 5.21244 5.60441C4.76741 5.69294 4.30613 5.6475 3.88692 5.47386C3.46771 5.30022 3.1094 5.00617 2.85731 4.62889C2.60523 4.25161 2.47067 3.80805 2.47067 3.3543C2.47067 2.74584 2.71238 2.1623 3.14263 1.73206C3.57287 1.30181 4.15641 1.0601 4.76487 1.0601ZM15.2749 15.1897C15.8313 14.7635 16.24 14.1737 16.4439 13.5032C16.6477 12.8326 16.6363 12.1151 16.4113 11.4514C16.1862 10.7877 15.7589 10.2112 15.1893 9.80285C14.6198 9.39453 13.9366 9.17494 13.2357 9.17494C12.5349 9.17494 11.8517 9.39453 11.2821 9.80285C10.7126 10.2112 10.2852 10.7877 10.0602 11.4514C9.83521 12.1151 9.82381 12.8326 10.0276 13.5032C10.2314 14.1737 10.6402 14.7635 11.1966 15.1897C10.3613 15.5007 9.60949 16.0012 9.00031 16.6518C8.39112 16.0012 7.63934 15.5007 6.80406 15.1897C7.36038 14.7635 7.76917 14.1737 7.97299 13.5032C8.17681 12.8326 8.16541 12.1151 7.94039 11.4514C7.71537 10.7877 7.28805 10.2112 6.71847 9.80285C6.14889 9.39453 5.46569 9.17494 4.76487 9.17494C4.06405 9.17494 3.38085 9.39453 2.81127 9.80285C2.24169 10.2112 1.81437 10.7877 1.58935 11.4514C1.36433 12.1151 1.35293 12.8326 1.55675 13.5032C1.76057 14.1737 2.16936 14.7635 2.72568 15.1897C1.68168 15.5793 0.772111 16.2615 0.105886 17.1548C0.0641706 17.2104 0.0338189 17.2737 0.0165639 17.341C-0.000691049 17.4084 -0.00451136 17.4785 0.00532106 17.5473C0.0151535 17.6161 0.0384461 17.6823 0.073869 17.7422C0.109292 17.802 0.156151 17.8543 0.211772 17.896C0.267393 17.9377 0.330685 17.968 0.398035 17.9853C0.465386 18.0026 0.535476 18.0064 0.604303 17.9965C0.67313 17.9867 0.739346 17.9634 0.799171 17.928C0.858996 17.8926 0.911258 17.8457 0.952974 17.7901C1.39681 17.1983 1.97233 16.718 2.63396 16.3872C3.29558 16.0564 4.02515 15.8841 4.76487 15.8841C5.50459 15.8841 6.23416 16.0564 6.89578 16.3872C7.55741 16.718 8.13293 17.1983 8.57676 17.7901C8.66114 17.9023 8.78663 17.9764 8.92562 17.9961C9.06462 18.0158 9.20574 17.9794 9.31797 17.8951C9.35807 17.8656 9.39347 17.8302 9.42297 17.7901C9.8668 17.1983 10.4423 16.718 11.104 16.3872C11.7656 16.0564 12.4951 15.8841 13.2349 15.8841C13.9746 15.8841 14.7042 16.0564 15.3658 16.3872C16.0274 16.718 16.6029 17.1983 17.0468 17.7901C17.1311 17.9024 17.2567 17.9766 17.3957 17.9964C17.5348 18.0162 17.6761 17.9799 17.7884 17.8955C17.9007 17.8112 17.9749 17.6856 17.9947 17.5466C18.0145 17.4075 17.9782 17.2662 17.8938 17.1539C17.2276 16.2613 16.3184 15.5794 15.2749 15.1897ZM4.76487 10.2369C5.21862 10.2369 5.66218 10.3714 6.03946 10.6235C6.41673 10.8756 6.71079 11.2339 6.88443 11.6531C7.05807 12.0723 7.10351 12.5336 7.01498 12.9787C6.92646 13.4237 6.70796 13.8325 6.38711 14.1533C6.06626 14.4742 5.65747 14.6927 5.21244 14.7812C4.76741 14.8697 4.30613 14.8243 3.88692 14.6506C3.46771 14.477 3.1094 14.183 2.85731 13.8057C2.60523 13.4284 2.47067 12.9848 2.47067 12.5311C2.47067 11.9226 2.71238 11.3391 3.14263 10.9088C3.57287 10.4786 4.15641 10.2369 4.76487 10.2369ZM13.2357 10.2369C13.6895 10.2369 14.1331 10.3714 14.5103 10.6235C14.8876 10.8756 15.1817 11.2339 15.3553 11.6531C15.529 12.0723 15.5744 12.5336 15.4859 12.9787C15.3973 13.4237 15.1788 13.8325 14.858 14.1533C14.5371 14.4742 14.1284 14.6927 13.6833 14.7812C13.2383 14.8697 12.777 14.8243 12.3578 14.6506C11.9386 14.477 11.5803 14.183 11.3282 13.8057C11.0761 13.4284 10.9416 12.9848 10.9416 12.5311C10.9416 11.9226 11.1833 11.3391 11.6135 10.9088C12.0438 10.4786 12.6273 10.2369 13.2357 10.2369Z"
																fill="{if $section == "1"}#014952{else}white{/if}" />
														</svg>
													</div>
													{* text *}
													<div id="menutitlesection"><strong
															class="{if $section == "1"}sidebar-item-li-selected{else}sidebar-item-li{/if}">{php}
															echo gettext("CUSTOMERS");{/php}</strong>
													</div>
												</div>
												{* arrow image *}
												<div id="menutitlebutton">
													<img id="img1" {if ($section == "1")}
														src="templates/{$SKIN_NAME}/images/minus-white.png" {else}
														src="templates/{$SKIN_NAME}/images/plus.png" {/if}
														onmouseover="this.style.cursor='hand';">
												</div>
											</div>
											{* end *}
										</div>
									</a>
								</li>
							</div>
							<div class="tohide" {if ($section =="1")} style="">
								{else}
									style="display:none;">
								{/if}
								<ul>
									<li>
										<ul>
											<li class="">
												<a class="sb-menu-item mx-4 {if $atmenu == 'addsearch'}active-sb-menu{/if}"
													href="A2B_entity_card.php?section=1&atmenu=addsearch">{php} echo
													gettext("Add :: Search");{/php}</a>
											</li>
											{php}
											if (has_rights (VOIP_SETTINGS) && !($popup_select>=1)) {
											{/php}
											<li class="">
												<a class="sb-menu-item mx-4 {if $atmenu == 'sip'}active-sb-menu{/if}"
													href="A2B_entity_friend.php?atmenu=sip&section=1">{php} echo gettext("VoIP
											Settings");{/php}</a>
											</li>
											{php}
											}
											if (has_rights (CALLER_ID) && !($popup_select>=1)) {
											{/php}
											<li class="">
												<a class="sb-menu-item mx-4 {if $atmenu == 'callerid'}active-sb-menu{/if}"
													href="A2B_entity_callerid.php?atmenu=callerid&section=1">{php} echo
													gettext("Caller-ID");{/php}</a>
											</li>
											{php}
											}
											if (has_rights (CREDIT_NOTIFICATION) && !($popup_select>=1)) {
											{/php}
											<li class="">
												<a class="sb-menu-item mx-4 {if $atmenu == 'creditnotification'}active-sb-menu{/if}"
													href="A2B_notifications.php?section=1&atmenu=creditnotification">{php} echo
													gettext("Credit Notification");{/php}</a>
											</li>
											{php}
											}
											if (has_rights (GROUPS) && !($popup_select>=1)) {
											{/php}
											<li class="">
												<a class="sb-menu-item mx-4 {if $atmenu == 'groups'}active-sb-menu{/if}"
													href="A2B_entity_card_group.php?section=1&atmenu=groups">{php} echo
													gettext("Groups");{/php}</a>
											</li>
											{php}
											}
											if (has_rights (CARD_SERIES) && !($popup_select>=1)) {
											{/php}
											<li class="">
												<a class="sb-menu-item mx-4 {if $atmenu == 'cardseries'}active-sb-menu{/if}"
													href="A2B_entity_card_seria.php?section=1&atmenu=cardseries">{php} echo
													gettext("Card series");{/php}</a>
											</li>
											{php}
											}
											if (has_rights (SPEED_DIAL) && !($popup_select>=1)) {
											{/php}
											<li class="">
												<a class="sb-menu-item mx-4 {if $atmenu == 'speeddial'}active-sb-menu{/if}"
													href="A2B_entity_speeddial.php?atmenu=speeddial&section=1">{php} echo
													gettext("Speed Dial");{/php}</a>
											</li>
											{php}
											}
											if (has_rights (HISTORY) && !($popup_select>=1)) {
											{/php}
											<li class="">
												<a class="sb-menu-item mx-4 {if $atmenu == 'cardhistory'}active-sb-menu{/if}"
													href="card-history.php?atmenu=cardhistory&section=1">{php} echo
													gettext("History");{/php}</a>
											</li>
											{php}
											}
											if (has_rights (STATUS) && !($popup_select>=1)) {
											{/php}
											<li class="">
												<a class="sb-menu-item mx-4 {if $atmenu == 'statuslog'}active-sb-menu{/if}"
													href="A2B_entity_statuslog.php?atmenu=statuslog&section=1">{php} echo
													gettext("Status");{/php}</a>
											</li>
											{php}
											}
											{/php}
											</ul>
									</li>
								</ul>
							</div>
						{/if}

						{if ($ACXADMINISTRATOR  > 0)}
							<div class="toggle_menu">
								<li>
									{* <a href="javascript:;" class="toggle_menu" target="_self"> <div> <div id="menutitlebutton"> <img id="img2"
		{if ($section == "2")}
		src="templates/{$SKIN_NAME}/images/minus.gif"
		{else}
		src="templates/{$SKIN_NAME}/images/plus.gif"
		{/if} onmouseover="this.style.cursor='hand';" ></div> <div id="menutitlesection"><strong class="sidebar-item-li">{php} echo gettext("AGENTS");{/php}</strong></div></div></a></li></div>
			<div class="tohide"
		{if ($section =="2")}
			style="">
		{else}
			style="display:none;">
		{/if}
			<ul>
				<li><ul>
					<li><a href="A2B_entity_agent.php?atmenu=user&section=2">{php} echo gettext("Add :: Search");{/php}</a></li>
					<li><a href="A2B_entity_signup_agent.php?atmenu=user&section=2">{php} echo gettext("Signup URLs");{/php}</a></li>
				</ul></li>
			</ul> *}
							</div>
						{/if}


						{if ($ACXADMINISTRATOR > 0)}
							<div class="toggle_menu">
								<li>
									<a href="javascript:;" class="toggle_menu" target="_self">
										<div class="{if $section == "2"}menu-active{/if} d-flex justify-content-between mx-2">
											<div class="d-flex">
												<div style="padding: 0px 10px 0px 8px;">
													<svg xmlns="http://www.w3.org/2000/svg" width="17" height="18"
														viewBox="0 0 17 18" fill="none">
														<path
															d="M9 17.25C4.5544 16.3237 1 12.3915 1 8.25V3.75L9 0.75L17 3.75V8.25C17 12.393 13.4456 16.3237 9 17.25ZM2.6 4.5V8.25C2.64572 9.9841 3.29629 11.6564 4.45214 13.0109C5.608 14.3654 7.20545 15.3275 9 15.75C10.7946 15.3275 12.392 14.3654 13.5479 13.0109C14.7037 11.6564 15.3543 9.9841 15.4 8.25V4.5L9 2.25L2.6 4.5Z"
															fill="{if $section == "2"}#014952{else}white{/if}" />
														<path
															d="M9.25 7.75C10.4236 7.75 11.375 6.91053 11.375 5.875C11.375 4.83947 10.4236 4 9.25 4C8.07639 4 7.125 4.83947 7.125 5.875C7.125 6.91053 8.07639 7.75 9.25 7.75Z"
															fill="{if $section == "2"}#014952{else}white{/if}" />
														<path
															d="M5 10.75C5.41896 11.4237 6.03325 11.987 6.78002 12.3823C7.52678 12.7777 8.37919 12.9908 9.25 13C10.1208 12.9908 10.9732 12.7777 11.72 12.3823C12.4667 11.987 13.081 11.4237 13.5 10.75C13.4788 9.328 10.6593 8.5 9.25 8.5C7.83305 8.5 5.02125 9.328 5 10.75Z"
															fill="{if $section == "2"}#014952{else}white{/if}" />
													</svg>
												</div>
												<div id="menutitlesection"><strong
														class="{if $section == "2"}sidebar-item-li-selected{else}sidebar-item-li{/if}">{php}
														echo gettext("ADMINS");{/php}</strong></div>
											</div>
											<div id="menutitlebutton">
												<img id="img3" {if ($section == "2")}
													src="templates/{$SKIN_NAME}/images/minus-white.png" {else}
													src="templates/{$SKIN_NAME}/images/plus.png" {/if}
													onmouseover="this.style.cursor='hand';">
											</div>
										</div>
									</a>
								</li>
							</div>
							<div class="tohide" {if ($section == "2")} style="">
								{else}
									style="display:none;">
								{/if}
								<ul>
									<li>
										<ul>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'addsearch'}active-sb-menu{/if}"
													href="A2B_entity_user.php?section=2&atmenu=addsearch">{php} echo
													gettext("Add :: Search");{/php}</a>
											</li>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'import'}active-sb-menu{/if}"
													href="A2B_entity_user.php?section=2&atmenu=import">{php} echo
													gettext("Access Control");{/php}</a>
											</li>
										</ul>
									</li>
								</ul>

							</div>
						{/if}

						{if ($ACXSUPPORT > 0)}
							<div class="toggle_menu">
								<li>
									<a href="javascript:;" class="toggle_menu" target="_self">
										<div>
											<div
												class="{if $section == "4"}menu-active{/if} d-flex justify-content-between mx-2">
												<div class="d-flex">
													<div style="padding: 0px 10px 0px 8px;">
														<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
															viewBox="0 0 18 18" fill="none">
															<path
																d="M8 0C3.5888 0 0 3.5888 0 8V11.3144C0 12.1336 0.7176 12.8 1.6 12.8H2.4C2.61217 12.8 2.81566 12.7157 2.96569 12.5657C3.11571 12.4157 3.2 12.2122 3.2 12V7.8856C3.2 7.67343 3.11571 7.46994 2.96569 7.31991C2.81566 7.16989 2.61217 7.0856 2.4 7.0856H1.6736C2.1184 3.9896 4.7824 1.6 8 1.6C11.2176 1.6 13.8816 3.9896 14.3264 7.0856H13.6C13.3878 7.0856 13.1843 7.16989 13.0343 7.31991C12.8843 7.46994 12.8 7.67343 12.8 7.8856V12.8C12.8 13.6824 12.0824 14.4 11.2 14.4H9.6V13.6H6.4V16H11.2C12.9648 16 14.4 14.5648 14.4 12.8C15.2824 12.8 16 12.1336 16 11.3144V8C16 3.5888 12.4112 0 8 0Z"
																fill="{if $section == "4"}#014952{else}white{/if}" />
														</svg>
													</div>
													<div id="menutitlesection"><strong
															class="{if $section == "4"}sidebar-item-li-selected{else}sidebar-item-li{/if}">{php}
															echo gettext("SUPPORT");{/php}</strong></div>
												</div>
												<div id="menutitlebutton">
													<img id="img4" {if ($section == "4")}
														src="templates/{$SKIN_NAME}/images/minus-white.png" {else}
														src="templates/{$SKIN_NAME}/images/plus.png" {/if}
														onmouseover="this.style.cursor='hand';">
												</div>
											</div>
										</div>
									</a>
								</li>
							</div>
							<div class="tohide" {if ($section =="4")} style="">
								{else}
									style="display:none;">
								{/if}
								<ul>
									<li>
										<ul>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'customertickets'}active-sb-menu{/if}"
													href="CC_ticket.php?section=4&atmenu=customertickets">{php} echo
													gettext("Customer Tickets");{/php}</a>
											</li>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'agenttickets'}active-sb-menu{/if}"
													href="A2B_ticket_agent.php?section=4&atmenu=agenttickets">{php} echo
													gettext("Agent Tickets");{/php}</a>
											</li>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'ticketcomponents'}active-sb-menu{/if}"
													href="CC_support_component.php?section=4&atmenu=ticketcomponents">{php} echo
													gettext("Ticket Components");{/php}</a>
											</li>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'supportboxes'}active-sb-menu{/if}"
													href="CC_support.php?section=4&atmenu=supportboxes">{php} echo
													gettext("Support Boxes");{/php}</a>
											</li>
										</ul>
									</li>
								</ul>
							</div>
						{/if}


						{if ($ACXCALLREPORT > 0)}
							<div class="toggle_menu">
								<li>
									<a href="javascript:;" class="toggle_menu" target="_self">
										<div>
											<div
												class="{if $section == "5"}menu-active{/if} d-flex justify-content-between mx-2">
												<div class="d-flex">
													<div style="padding: 0px 10px 0px 8px;">
														<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
															viewBox="0 0 18 18" fill="none">
															<path
																d="M9.5 2.3V0.5H18.5V2.3H9.5ZM9.5 5.9V4.1H18.5V5.9H9.5ZM9.5 9.5V7.7H18.5V9.5H9.5ZM15.755 18.5C13.88 18.5 12.0275 18.0914 10.1975 17.2742C8.3675 16.457 6.7025 15.2981 5.2025 13.7975C3.7025 12.2975 2.5439 10.6325 1.7267 8.8025C0.9095 6.9725 0.5006 5.12 0.5 3.245C0.5 2.975 0.59 2.75 0.77 2.57C0.95 2.39 1.175 2.3 1.445 2.3H5.09C5.3 2.3 5.4875 2.3714 5.6525 2.5142C5.8175 2.657 5.915 2.8256 5.945 3.02L6.53 6.17C6.56 6.41 6.5525 6.6125 6.5075 6.7775C6.4625 6.9425 6.38 7.085 6.26 7.205L4.0775 9.41C4.3775 9.965 4.7336 10.5014 5.1458 11.0192C5.558 11.537 6.0119 12.0356 6.5075 12.515C6.9725 12.98 7.46 13.4114 7.97 13.8092C8.48 14.207 9.02 14.5706 9.59 14.9L11.705 12.785C11.84 12.65 12.0164 12.5489 12.2342 12.4817C12.452 12.4145 12.6656 12.3956 12.875 12.425L15.98 13.055C16.19 13.115 16.3625 13.2239 16.4975 13.3817C16.6325 13.5395 16.7 13.7156 16.7 13.91V17.555C16.7 17.825 16.61 18.05 16.43 18.23C16.25 18.41 16.025 18.5 15.755 18.5ZM3.2225 7.7L4.7075 6.215L4.325 4.1H2.3225C2.3975 4.715 2.5025 5.3225 2.6375 5.9225C2.7725 6.5225 2.9675 7.115 3.2225 7.7ZM11.2775 15.755C11.8625 16.01 12.4589 16.2125 13.0667 16.3625C13.6745 16.5125 14.2856 16.61 14.9 16.655V14.675L12.785 14.2475L11.2775 15.755Z"
																fill="{if $section == "5"}#014952{else}white{/if}" />
														</svg>
													</div>
													<div id="menutitlesection"><strong
															class="{if $section == "5"}sidebar-item-li-selected{else}sidebar-item-li{/if}">{php}
															echo gettext("CALL REPORTS");{/php}</strong></div>
												</div>
												<div id="menutitlebutton">
													<img id="img5" {if ($section == "5")}
														src="templates/{$SKIN_NAME}/images/minus-white.png" {else}
														src="templates/{$SKIN_NAME}/images/plus.png" {/if}
														onmouseover="this.style.cursor='hand';">
												</div>
											</div>
										</div>
									</a>
								</li>
							</div>
							<div class="tohide" {if ($section =="5")} style="">
								{else}
									style="display:none;">
								{/if}
								<ul>
									<li>
										<ul>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'cdrs'}active-sb-menu{/if}"
													href="call-log-customers.php?nodisplay=1&posted=1&section=5&atmenu=cdrs">{php}
													echo gettext("CDRs");{/php}</a>
											</li>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'callcount'}active-sb-menu{/if}"
													href="call-count-reporting.php?nodisplay=1&posted=1&section=5&atmenu=callcount">{php}
													echo gettext("Call Count");{/php}</a>
											</li>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'trunk'}active-sb-menu{/if}"
													href="A2B_trunk_report.php?section=5&atmenu=trunk">{php} echo
													gettext("Trunk");{/php}</a>
											</li>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'dnid'}active-sb-menu{/if}"
													href="call-dnid.php?nodisplay=1&posted=1&section=5&atmenu=dnid">{php} echo
													gettext("DNID");{/php}</a>
											</li>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'pnl'}active-sb-menu{/if}"
													href="call-pnl-report.php?section=5&atmenu=pnl">{php} echo
													gettext("PNL");{/php}</a>
											</li>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'comparecalls'}active-sb-menu{/if}"
													href="call-comp.php?section=5&atmenu=comparecalls">{php} echo
													gettext("Compare Calls");{/php}</a>
											</li>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'dailytraffic'}active-sb-menu{/if}"
													href="call-daily-load.php?section=5&atmenu=dailytraffic">{php} echo
													gettext("Daily Traffic");{/php}</a>
											</li>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'monthlytraffic'}active-sb-menu{/if}"
													href="call-last-month.php?section=5&atmenu=monthlytraffic">{php} echo
													gettext("Monthly Traffic");{/php}</a>
											</li>
										</ul>
									</li>
								</ul>
							</div>
						{/if}


						{if ($ACXRATECARD > 0)}
							<div class="toggle_menu">
								<li>
									<a href="javascript:;" class="toggle_menu" target="_self">
										<div>
											<div
												class="{if $section == "6"}menu-active{/if} d-flex justify-content-between mx-2">
												<div class="d-flex">
													<div style="padding: 0px 10px 0px 8px;">
														<svg xmlns="http://www.w3.org/2000/svg" width="18" height="22"
															viewBox="0 0 18 22" fill="none">
															<path
																d="M13.235 12.1284C13.235 11.904 13.1458 11.6887 12.9871 11.5301C12.8285 11.3714 12.6132 11.2822 12.3888 11.2822H5.61959C5.39518 11.2822 5.17996 11.3714 5.02127 11.5301C4.86259 11.6887 4.77344 11.904 4.77344 12.1284C4.77344 12.3528 4.86259 12.568 5.02127 12.7267C5.17996 12.8854 5.39518 12.9745 5.61959 12.9745H12.3888C12.6132 12.9745 12.8285 12.8854 12.9871 12.7267C13.1458 12.568 13.235 12.3528 13.235 12.1284ZM13.235 16.6412C13.235 16.4168 13.1458 16.2016 12.9871 16.0429C12.8285 15.8842 12.6132 15.795 12.3888 15.795H5.61959C5.39518 15.795 5.17996 15.8842 5.02127 16.0429C4.86259 16.2016 4.77344 16.4168 4.77344 16.6412C4.77344 16.8656 4.86259 17.0808 5.02127 17.2395C5.17996 17.3982 5.39518 17.4874 5.61959 17.4874H12.3888C12.6132 17.4874 12.8285 17.3982 12.9871 17.2395C13.1458 17.0808 13.235 16.8656 13.235 16.6412Z"
																fill="{if $section == "6"}#014952{else}white{/if}" />
															<path fill-rule="evenodd" clip-rule="evenodd"
																d="M3.36038 0C2.53753 0 1.74838 0.326876 1.16653 0.90872C0.584689 1.49056 0.257812 2.27971 0.257812 3.10256V18.8974C0.257812 19.7203 0.584689 20.5094 1.16653 21.0913C1.74838 21.6731 2.53753 22 3.36038 22H14.6424C15.4653 22 16.2544 21.6731 16.8363 21.0913C17.4181 20.5094 17.745 19.7203 17.745 18.8974V6.45108C17.745 6.02123 17.6051 5.6038 17.3456 5.26082L13.9632 0.784102C13.7792 0.540542 13.5412 0.342974 13.2679 0.206922C12.9946 0.0708702 12.6935 4.11722e-05 12.3883 0H3.36038ZM1.95012 3.10256C1.95012 2.3241 2.58191 1.69231 3.36038 1.69231H11.5399V6.65303C11.5399 7.1201 11.9189 7.49918 12.386 7.49918H16.0527V18.8974C16.0527 19.6759 15.4209 20.3077 14.6424 20.3077H3.36038C2.58191 20.3077 1.95012 19.6759 1.95012 18.8974V3.10256Z"
																fill="{if $section == "6"}#014952{else}white{/if}" />
														</svg>
													</div>
													<div id="menutitlesection"><strong
															class="{if $section == "6"}sidebar-item-li-selected{else}sidebar-item-li{/if}">{php}
															echo gettext("RATES");{/php}</strong></div>
												</div>
												<div id="menutitlebutton">
													<img id="img6" {if ($section == "6")}
														src="templates/{$SKIN_NAME}/images/minus-white.png" {else}
														src="templates/{$SKIN_NAME}/images/plus.png" {/if}
														onmouseover="this.style.cursor='hand';">
												</div>
											</div>
										</div>
									</a>
								</li>
							</div>
							<div class="tohide" {if ($section =="6")} style="">
								{else}
									style="display:none;">
								{/if}
								<ul>
									<li>
										<ul>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'tariffgroup'}active-sb-menu{/if}"
													href="A2B_entity_tariffgroup.php?atmenu=tariffgroup&section=6">{php} echo
													gettext("Call Plan");{/php}</a>
											</li>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'tariffplan'}active-sb-menu{/if}"
													href="A2B_entity_tariffplan.php?atmenu=tariffplan&section=6">{php} echo
													gettext("RateCards");{/php}</a>
											</li>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'ratecardimport'}active-sb-menu{/if}"
													href="CC_ratecard_import.php?atmenu=ratecardimport&section=6"> {php} echo
													gettext("Import");{/php}</a>
											</li>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'ratecardmerge'}active-sb-menu{/if}"
													href="CC_ratecard_merging.php?atmenu=ratecardmerge&section=6"> {php} echo
													gettext("Merge");{/php}</a>
											</li>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'ratecardsimulator'}active-sb-menu{/if}"
													href="CC_entity_sim_ratecard.php?atmenu=ratecardsimulator&section=6"> {php}
													echo gettext("Simulator");{/php}</a>
											</li>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'rates'}active-sb-menu{/if}"
													href="A2B_entity_def_ratecard.php?atmenu=rates&section=6">{php} echo
													gettext("Rates");{/php}</a>
											</li>
										</ul>
									</li>
								</ul>
							</div>
						{/if}



						{if ($ACXTRUNK > 0)}
							<div class="toggle_menu">
								<li>
									<a href="javascript:;" class="toggle_menu" target="_self">
										<div>
											<div
												class="{if $section == "7"}menu-active{/if} d-flex justify-content-between mx-2">
												<div class="d-flex">
													<div style="padding: 0px 10px 0px 8px;">
														<svg xmlns="http://www.w3.org/2000/svg" width="18" height="16"
															viewBox="0 0 18 16" fill="none">
															<path
																d="M12 14.75V13.25C12 12.4544 11.6839 11.6913 11.1213 11.1287C10.5587 10.5661 9.79565 10.25 9 10.25H4.5C3.70435 10.25 2.94129 10.5661 2.37868 11.1287C1.81607 11.6913 1.5 12.4544 1.5 13.25V14.75"
																stroke="{if $section == "7"}#014952{else}white{/if}"
																stroke-width="1.5" stroke-linecap="round"
																stroke-linejoin="round" />
															<path
																d="M6.75 7.25C8.40685 7.25 9.75 5.90685 9.75 4.25C9.75 2.59315 8.40685 1.25 6.75 1.25C5.09315 1.25 3.75 2.59315 3.75 4.25C3.75 5.90685 5.09315 7.25 6.75 7.25Z"
																stroke="{if $section == "7"}#014952{else}white{/if}"
																stroke-width="1.5" stroke-linecap="round"
																stroke-linejoin="round" />
															<path
																d="M16.5 14.75V13.25C16.4995 12.5853 16.2783 11.9396 15.871 11.4142C15.4638 10.8889 14.8936 10.5137 14.25 10.3475M12 1.3475C12.6453 1.51273 13.2173 1.88803 13.6257 2.41423C14.0342 2.94044 14.2559 3.58762 14.2559 4.25375C14.2559 4.91988 14.0342 5.56706 13.6257 6.09327C13.2173 6.61947 12.6453 6.99477 12 7.16"
																stroke="{if $section == "7"}#014952{else}white{/if}"
																stroke-width="1.5" stroke-linecap="round"
																stroke-linejoin="round" />
														</svg>
													</div>
													<div id="menutitlesection"><strong
															class="{if $section == "7"}sidebar-item-li-selected{else}sidebar-item-li{/if}">{php}
															echo gettext("PROVIDERS");{/php}</strong></div>
												</div>
												<div id="menutitlebutton">
													<img id="img7" {if ($section == "7")}
														src="templates/{$SKIN_NAME}/images/minus-white.png" {else}
														src="templates/{$SKIN_NAME}/images/plus.png" {/if}
														onmouseover="this.style.cursor='hand';">
												</div>
											</div>
										</div>
									</a>
								</li>
							</div>
							<div class="tohide" {if ($section =="7")} style="">
								{else}
									style="display:none;">
								{/if}
								<ul>
									<li>
										<ul>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'providers'}active-sb-menu{/if}"
													href="A2B_entity_provider.php?atmenu=providers&section=7">{php} echo
													gettext("Providers");{/php}</a>
											</li>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'trunks'}active-sb-menu{/if}"
													href="A2B_entity_trunk.php?atmenu=trunks&section=7">{php} echo
													gettext("Trunks");{/php}</a>
											</li>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'prefixes'}active-sb-menu{/if}"
													href="A2B_entity_prefix.php?atmenu=prefixes&section=7">{php} echo
													gettext("Prefixes");{/php}</a>
											</li>
										</ul>
									</li>
								</ul>

							</div>
						{/if}

						{if ($ACXDID > 0)}
							<div class="toggle_menu">
								<li>
									<a href="javascript:;" class="toggle_menu" target="_self">
										<div>
											<div
												class="{if $section == "8"}menu-active{/if} d-flex justify-content-between mx-2">
												<div class="d-flex">
													<div style="padding: 0px 10px 0px 8px;">
														<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
															viewBox="0 0 18 18" fill="none">
															<path
																d="M5.07135 0.156688C3.89861 -0.139931 2.66949 -0.0140928 1.70649 0.522967C0.72545 1.06902 0.0375931 2.03752 0.00376405 3.33298C-0.0481071 5.35763 0.422117 8.07439 2.28948 11.263C4.13316 14.4124 6.16854 16.3 7.85774 17.4213C8.92448 18.1302 10.1029 18.1493 11.1098 17.6875C12.1022 17.2325 12.9073 16.3235 13.3256 15.1966C13.4298 14.9163 13.4716 14.6169 13.4482 14.3189C13.4249 14.021 13.3369 13.7316 13.1903 13.4708L12.1146 11.5585C11.7839 10.97 11.2517 10.5196 10.6152 10.2898C9.97875 10.06 9.28055 10.0661 8.64821 10.3069L7.89721 10.5934C7.53298 10.7316 7.19807 10.6676 7.00863 10.4811C6.37152 9.85748 5.91595 9.01144 5.7096 8.09911C5.64419 7.81148 5.77725 7.47217 6.09525 7.23285L6.77295 6.72275C7.32084 6.31082 7.69908 5.71387 7.83672 5.04387C7.97436 4.37387 7.86195 3.67686 7.52058 3.08355L6.42452 1.17912C6.27931 0.926992 6.08468 0.706542 5.85221 0.530892C5.61975 0.355243 5.35419 0.227983 5.07135 0.156688ZM1.1314 3.36332C1.15395 2.49369 1.59598 1.87236 2.25678 1.50383C2.93561 1.12519 3.86253 1.00947 4.79396 1.24541C4.93044 1.27976 5.05858 1.34113 5.17075 1.42587C5.28292 1.51061 5.37682 1.61699 5.44686 1.73866L6.54179 3.64308C6.74658 3.99892 6.8141 4.41696 6.73169 4.81885C6.64928 5.22074 6.42259 5.57888 6.09412 5.82616L5.41641 6.33625C4.83004 6.77668 4.42409 7.53171 4.60902 8.34629C4.85936 9.44963 5.41303 10.4957 6.21816 11.2833C6.80678 11.8585 7.64574 11.8922 8.29977 11.6428L9.05078 11.3563C9.43021 11.2116 9.84925 11.2078 10.2313 11.3456C10.6133 11.4834 10.9328 11.7536 11.1313 12.1068L12.2059 14.0203C12.3412 14.2607 12.3638 14.5483 12.2679 14.8067C11.9409 15.6887 11.3263 16.3505 10.6385 16.6662C9.96529 16.9752 9.20413 16.9662 8.48358 16.4865C6.93759 15.4595 5.02174 13.6989 3.26263 10.6968C1.50239 7.68564 1.08517 5.17562 1.13253 3.36332H1.1314ZM17.8351 0.984749C17.8874 0.932517 17.9289 0.870524 17.9572 0.802308C17.9855 0.734092 18.0001 0.66099 18 0.587175C17.9999 0.51336 17.9853 0.440278 17.9569 0.372102C17.9285 0.303926 17.8869 0.241991 17.8345 0.189833C17.7821 0.137675 17.7198 0.0963152 17.6514 0.0681157C17.5829 0.0399162 17.5096 0.025429 17.4355 0.0254811C17.3614 0.0255333 17.288 0.0401239 17.2196 0.0684198C17.1512 0.0967157 17.089 0.138163 17.0367 0.190395L11.2339 5.97222V1.71169C11.2339 1.5627 11.1745 1.41981 11.0687 1.31445C10.963 1.2091 10.8196 1.14991 10.6701 1.14991C10.5205 1.14991 10.3771 1.2091 10.2714 1.31445C10.1656 1.41981 10.1062 1.5627 10.1062 1.71169V7.32947C10.1062 7.47847 10.1656 7.62136 10.2714 7.72671C10.3771 7.83207 10.5205 7.89125 10.6701 7.89125H16.3082C16.4578 7.89125 16.6012 7.83207 16.7069 7.72671C16.8126 7.62136 16.8721 7.47847 16.8721 7.32947C16.8721 7.18048 16.8126 7.03759 16.7069 6.93224C16.6012 6.82688 16.4578 6.7677 16.3082 6.7677H12.0311L17.8351 0.985873V0.984749Z"
																fill="{if $section == "8"}#014952{else}white{/if}" />
														</svg>
													</div>
													<div id="menutitlesection"><strong
															class="{if $section == "8"}sidebar-item-li-selected{else}sidebar-item-li{/if}">{php}
															echo gettext("INBOUND DID");{/php}</strong></div>
												</div>
												<div id="menutitlebutton">
													<img id="img8" {if ($section == "8")}
														src="templates/{$SKIN_NAME}/images/minus-white.png" {else}
														src="templates/{$SKIN_NAME}/images/plus.png" {/if}
														onmouseover="this.style.cursor='hand';">
												</div>
											</div>
										</div>
									</a>
								</li>
							</div>
							<div class="tohide" {if ($section =="8")} style="">
								{else}
									style="display:none;">
								{/if}
								<ul>
									<li>
										<ul>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'did'}active-sb-menu{/if}"
													href="A2B_entity_did.php?atmenu=did&section=8">{php} echo gettext("Add ::
											Search");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'didgroup'}active-sb-menu{/if}"
													href="A2B_entity_didgroup.php?atmenu=didgroup&section=8">{php} echo
													gettext("Groups");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'diddestination'}active-sb-menu{/if}"
													href="A2B_entity_did_destination.php?atmenu=diddestination&section=8">{php}
													echo gettext("Destination");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'didimportcsv'}active-sb-menu{/if}"
													href="A2B_entity_did_import.php?atmenu=didimportcsv&section=8">{php} echo
													gettext("Import [CSV]");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'didimportdidx'}active-sb-menu{/if}"
													href="A2B_entity_didx.php?atmenu=didimportdidx&section=8">{php} echo
													gettext("Import [DIDX]");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'diduse'}active-sb-menu{/if}"
													href="A2B_entity_did_use.php?atmenu=diduse&section=8">{php} echo
													gettext("Usage");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'didbilling'}active-sb-menu{/if}"
													href="A2B_entity_did_billing.php?atmenu=didbilling&section=8">{php} echo
													gettext("Billing");{/php}</a></li>
										</ul>
									</li>
								</ul>

							</div>
						{/if}


						{if ($ACXOUTBOUNDCID > 0)}
							<div class="toggle_menu">
								<li>
									<a href="javascript:;" class="toggle_menu" target="_self">
										<div>
											<div
												class="{if $section == "9"}menu-active{/if} d-flex justify-content-between mx-2">
												<div class="d-flex">
													<div style="padding: 0px 10px 0px 8px;">
														<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
															viewBox="0 0 18 18" fill="none">
															<path
																d="M11.9981 0.750302C11.9981 0.551309 12.0771 0.360467 12.2178 0.219758C12.3585 0.0790496 12.5493 0 12.7483 0H17.2498C17.4487 0 17.6396 0.0790496 17.7803 0.219758C17.921 0.360467 18 0.551309 18 0.750302V5.25211C18 5.4511 17.921 5.64195 17.7803 5.78265C17.6396 5.92336 17.4487 6.00241 17.2498 6.00241C17.0508 6.00241 16.86 5.92336 16.7193 5.78265C16.5786 5.64195 16.4995 5.4511 16.4995 5.25211V2.56153L11.779 7.28393C11.6375 7.4206 11.448 7.49623 11.2513 7.49452C11.0545 7.49281 10.8664 7.4139 10.7273 7.27479C10.5882 7.13568 10.5093 6.94749 10.5076 6.75076C10.5059 6.55404 10.5815 6.36451 10.7181 6.223L15.4387 1.5006H12.7483C12.5493 1.5006 12.3585 1.42155 12.2178 1.28084C12.0771 1.14014 11.9981 0.949294 11.9981 0.750302ZM3.55631 0.180072C4.17223 -0.051504 4.85264 -0.0433797 5.46285 0.202837C6.07306 0.449053 6.5686 0.915415 6.85138 1.50961L7.72917 3.35235C7.91208 3.73701 7.98211 4.16568 7.93111 4.58856C7.88012 5.01144 7.71019 5.41117 7.44107 5.74131L6.02311 7.48201C6.15249 8.15738 6.39336 8.8065 6.73584 9.40278C7.08555 9.99104 7.5302 10.5174 8.05177 10.9604L10.3115 10.5462C10.678 10.4788 11.0554 10.5034 11.41 10.6179C11.7646 10.7324 12.0853 10.9331 12.3432 11.202L13.5571 12.4685C13.7967 12.7187 13.9845 13.0138 14.1097 13.3368C14.2348 13.6599 14.2947 14.0045 14.2861 14.3509C14.2774 14.6972 14.2004 15.0384 14.0593 15.3548C13.9182 15.6713 13.7159 15.9566 13.464 16.1945L13.0199 16.6147C11.3303 18.2098 8.69848 18.5505 6.81537 16.9853C5.40491 15.8119 3.71236 14.1642 2.43695 12.1639C1.02649 9.9475 0.366278 7.31694 0.0541764 5.33615C-0.301439 3.07624 1.13453 1.08944 3.16168 0.328632L3.55631 0.180072ZM7.85071 11.7602L7.41707 12.3725L7.41557 12.371L7.41106 12.368L7.39606 12.3575C7.33027 12.3104 7.26669 12.2603 7.2055 12.2074C6.50113 11.634 5.90373 10.9406 5.44092 10.1591C4.94637 9.30033 4.62233 8.35413 4.48661 7.37246L4.48511 7.35296V7.34545L5.22936 7.26742L4.48361 7.34245C4.46374 7.14474 4.5231 6.94722 4.64867 6.79323L6.2782 4.79143C6.36771 4.68148 6.42423 4.54842 6.44123 4.40766C6.45823 4.2669 6.43499 4.1242 6.37423 3.99611L5.49644 2.15187C5.37535 1.89754 5.16329 1.69786 4.90216 1.59229C4.64102 1.48672 4.34979 1.48291 4.08599 1.58164L3.68986 1.7317C2.21188 2.28692 1.31008 3.66147 1.53666 5.09905C1.83525 6.99131 2.45195 9.39078 3.70336 11.3566C4.86324 13.1768 6.42975 14.7119 7.77418 15.8284C8.98057 16.8308 10.7586 16.6837 11.9905 15.5222L12.4332 15.1021C12.5411 15.0002 12.6279 14.8779 12.6884 14.7424C12.7489 14.6068 12.782 14.4606 12.7857 14.3122C12.7895 14.1638 12.7639 14.0161 12.7103 13.8776C12.6568 13.7392 12.5763 13.6127 12.4737 13.5054L11.2598 12.2389C11.1739 12.1493 11.0672 12.0823 10.9491 12.0441C10.831 12.0058 10.7052 11.9975 10.5831 12.0198L7.98725 12.497C7.88861 12.5152 7.78733 12.5134 7.68939 12.4918C7.59146 12.4701 7.49886 12.4305 7.41707 12.3725L7.85221 11.7587L7.85071 11.7602Z"
																fill="{if $section == "9"}#014952{else}white{/if}" />
														</svg>
													</div>
													<div id="menutitlesection"><strong
															class="{if $section == "9"}sidebar-item-li-selected{else}sidebar-item-li{/if}">{php}
															echo gettext("OUTBOUND CID");{/php}</strong></div>
												</div>
												<div id="menutitlebutton">
													<img id="img9" {if ($section == "9")}
														src="templates/{$SKIN_NAME}/images/minus-white.png" {else}
														src="templates/{$SKIN_NAME}/images/plus.png" {/if}
														onmouseover="this.style.cursor='hand';">
												</div>
											</div>
										</div>
									</a>
								</li>
							</div>
							<div class="tohide" {if ($section =="9")} style="">
								{else}
									style="display:none;">
								{/if}
								<ul>
									<li>
										<ul>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'cid'}active-sb-menu{/if}"
													href="A2B_entity_outbound_cid.php?atmenu=cid&section=9">{php} echo
													gettext("Add");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'cidgroup'}active-sb-menu{/if}"
													href="A2B_entity_outbound_cidgroup.php?atmenu=cidgroup&section=9">{php} echo
													gettext("Groups");{/php}</a></li>
										</ul>
									</li>
								</ul>

							</div>
						{/if}




						{if ($ACXBILLING > 0)}
							<div class="toggle_menu">
								<li>
									<a href="javascript:;" class="toggle_menu" target="_self">
										<div>
											<div
												class="{if $section == "10"}menu-active{/if} d-flex justify-content-between mx-2">
												<div class="d-flex">
													<div style="padding: 0px 10px 0px 8px;">
														<svg xmlns="http://www.w3.org/2000/svg" width="16" height="18"
															viewBox="0 0 16 18" fill="none">
															<path
																d="M11.5662 1.5H4.43375C3.5645 1.5 3.13025 1.5 2.77925 1.62225C2.44833 1.73959 2.14892 1.93163 1.90425 2.18345C1.65959 2.43527 1.47626 2.74009 1.3685 3.07425C1.25 3.43575 1.25 3.88275 1.25 4.7775V15.2805C1.25 15.924 1.98875 16.266 2.456 15.8385C2.58709 15.7174 2.75902 15.6501 2.9375 15.6501C3.11598 15.6501 3.28791 15.7174 3.419 15.8385L3.78125 16.17C4.01091 16.3824 4.3122 16.5003 4.625 16.5003C4.9378 16.5003 5.23909 16.3824 5.46875 16.17C5.69841 15.9576 5.9997 15.8397 6.3125 15.8397C6.6253 15.8397 6.92659 15.9576 7.15625 16.17C7.38591 16.3824 7.6872 16.5003 8 16.5003C8.3128 16.5003 8.61409 16.3824 8.84375 16.17C9.07341 15.9576 9.3747 15.8397 9.6875 15.8397C10.0003 15.8397 10.3016 15.9576 10.5312 16.17C10.7609 16.3824 11.0622 16.5003 11.375 16.5003C11.6878 16.5003 11.9891 16.3824 12.2188 16.17L12.581 15.8385C12.7121 15.7174 12.884 15.6501 13.0625 15.6501C13.241 15.6501 13.4129 15.7174 13.544 15.8385C14.0113 16.266 14.75 15.924 14.75 15.2805V4.7775C14.75 3.88275 14.75 3.435 14.6315 3.075C14.5239 2.74068 14.3406 2.43567 14.0959 2.18371C13.8513 1.93175 13.5518 1.73962 13.2208 1.62225C12.8698 1.5 12.4355 1.5 11.5662 1.5Z"
																stroke="{if $section == "10"}#014952{else}white{/if}"
																stroke-width="1.5" />
															<path
																d="M6.875 8.25H11.75M4.25 8.25H4.625M4.25 5.625H4.625M4.25 10.875H4.625M6.875 5.625H11.75M6.875 10.875H11.75"
																stroke="{if $section == "10"}#014952{else}white{/if}"
																stroke-width="1.5" stroke-linecap="round" />
														</svg>
													</div>
													<div id="menutitlesection"><strong
															class="{if $section == "10"}sidebar-item-li-selected{else}sidebar-item-li{/if}">{php}
															echo gettext("BILLING");{/php}</strong></div>
												</div>
												<div id="menutitlebutton">
													<img id="img10" {if ($section == "10")}
														src="templates/{$SKIN_NAME}/images/minus-white.png" {else}
														src="templates/{$SKIN_NAME}/images/plus.png" {/if}
														onmouseover="this.style.cursor='hand';">
												</div>
											</div>
										</div>
									</a>
								</li>
							</div>
							<div class="tohide" {if ($section =="10")} style="">
								{else}
									style="display:none;">
								{/if}
								<ul>
									<li>
										<ul>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'voucher'}active-sb-menu{/if}"
													href="A2B_entity_voucher.php?atmenu=voucher&section=10">{php} echo
													gettext("Vouchers");{/php}</a></li>
													<li class="">
														<a class="sb-menu-item mx-4 {if $atmenu == 'import'}active-sb-menu{/if}"
															href="CC_card_import.php?section=10&atmenu=import">{php} echo
															gettext("Import");{/php}</a>
													</li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'moneysituation'}active-sb-menu{/if}"
													href="A2B_entity_moneysituation.php?atmenu=moneysituation&section=10">{php}
													echo gettext("Customers Balance");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'Transactions'}active-sb-menu{/if}"
													href="A2B_entity_transactions.php?atmenu=Transactions&section=10"> {php}
													echo gettext("Transactions");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'Billings'}active-sb-menu{/if}"
													href="A2B_entity_billing_customer.php?atmenu=Billings&section=10"> {php}
													echo gettext("Billings");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'Refills'}active-sb-menu{/if}"
													href="A2B_entity_logrefill.php?atmenu=Refills&section=10"> {php} echo
													gettext("Refills");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'payment'}active-sb-menu{/if}"
													href="A2B_entity_payment.php?atmenu=payment&section=10"> {php} echo
													gettext("Payments");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'E-Payment'}active-sb-menu{/if}"
													href="A2B_entity_paymentlog.php?atmenu=E-Payment&section=10"> {php} echo
													gettext("E-Payment Log");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'Charges'}active-sb-menu{/if}"
													href="A2B_entity_charge.php?atmenu=Charges&section=10"> {php} echo
													gettext("Charges");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'Remittance'}active-sb-menu{/if}"
													href="A2B_entity_remittance_request.php?atmenu=Remittance&section=10"> {php}
													echo gettext("Remittance Request");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'transactions_agent'}active-sb-menu{/if}"
													href="A2B_entity_transactions_agent.php?atmenu=transactions_agent&section=10">
													{php} echo gettext("Transactions");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'logrefill_agent'}active-sb-menu{/if}"
													href="A2B_entity_logrefill_agent.php?atmenu=logrefill_agent&section=10">
													{php} echo gettext("Refills");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'payment_agent'}active-sb-menu{/if}"
													href="A2B_entity_payment_agent.php?atmenu=payment_agent&section=10"> {php}
													echo gettext("Payments");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'paymentlog_agent'}active-sb-menu{/if}"
													href="A2B_entity_paymentlog_agent.php?atmenu=paymentlog_agent&section=10">
													{php} echo gettext("E-Payment Log");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'payment_configuration'}active-sb-menu{/if}"
													href="A2B_entity_payment_configuration.php?atmenu=payment_configuration&section=10">{php}
													echo gettext("Payment Methods");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'currencies'}active-sb-menu{/if}"
													href="A2B_currencies.php?atmenu=currencies&section=10">{php} echo
													gettext("Currency List");{/php}</a></li>
										</ul>
									</li>
								</ul>

							</div>
						{/if}



						{if ($ACXINVOICING > 0)}
							<div class="toggle_menu">
								<li>
									<a href="javascript:;" class="toggle_menu" target="_self">
										<div>
											<div
												class="{if $section == "11"}menu-active{/if} d-flex justify-content-between mx-2">
												<div class="d-flex">
													<div style="padding: 0px 10px 0px 8px;">
														<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
															viewBox="0 0 18 18" fill="none">
															<path
																d="M4.95156 11.475C4.27656 11.5875 3.37656 11.1375 3.03906 11.025L2.47656 12.0375C2.47656 12.0375 3.48906 12.4875 4.38906 12.6V13.5H5.51406V12.4875C6.52656 12.15 7.08906 11.25 7.20156 10.4625C7.20156 9.5625 6.52656 8.8875 5.06406 8.325C4.61406 8.1 3.82656 7.7625 3.82656 7.3125C3.82656 6.75 4.27656 6.4125 4.95156 6.4125C5.73906 6.4125 6.52656 6.75 6.52656 6.75L6.97656 5.7375C6.97656 5.7375 6.41406 5.5125 5.62656 5.2875V4.5H4.50156V5.2875C3.48906 5.5125 2.81406 6.1875 2.70156 7.2C2.70156 8.55 4.16406 9.1125 4.72656 9.3375C5.40156 9.5625 6.18906 10.0125 6.18906 10.35C6.18906 10.8 5.73906 11.3625 4.95156 11.475Z"
																fill="{if $section == "11"}#014952{else}white{/if}" />
															<path
																d="M0 2.25V15.75H18V2.25H0ZM16.875 14.625H1.125V3.375H16.875V14.625Z"
																fill="{if $section == "11"}#014952{else}white{/if}" />
															<path
																d="M9 5.625H15.75V6.75H9V5.625ZM9 7.875H15.75V9H9V7.875ZM9 10.125H12.375V11.25H9V10.125Z"
																fill="{if $section == "11"}#014952{else}white{/if}" />
														</svg>
													</div>
													<div id="menutitlesection"><strong
															class="{if $section == "11"}sidebar-item-li-selected{else}sidebar-item-li{/if}">{php}
															echo gettext("INVOICES");{/php}</strong></div>
												</div>
												<div id="menutitlebutton">
													<img id="img11" {if ($section == "11")}
														src="templates/{$SKIN_NAME}/images/minus-white.png" {else}
														src="templates/{$SKIN_NAME}/images/plus.png" {/if}
														onmouseover="this.style.cursor='hand';">
												</div>
											</div>
										</div>
									</a>
								</li>
							</div>
							<div class="tohide" {if ($section =="11")} style="">
								{else}
									style="display:none;">
								{/if}
								<ul>
									<li>
										<ul>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'receipts'}active-sb-menu{/if}"
													href="A2B_entity_receipt.php?atmenu=receipts&section=11">{php} echo
													gettext("Receipts");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'invoices'}active-sb-menu{/if}"
													href="A2B_entity_invoice.php?atmenu=invoices&section=11">{php} echo
													gettext("Invoices");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'configuration'}active-sb-menu{/if}"
													href="A2B_entity_invoice_conf.php?atmenu=configuration&section=11">{php}
													echo gettext("Configuration");{/php}</a></li>
										</ul>
									</li>
								</ul>
							</div>
						{/if}



						{if ($ACXPACKAGEOFFER > 0)}
							<div class="toggle_menu">
								<li>
									<a href="javascript:;" class="toggle_menu" target="_self">
										<div>
											<div
												class="{if $section == "12"}menu-active{/if} d-flex justify-content-between mx-2">
												<div class="d-flex">
													<div style="padding: 0px 10px 0px 8px;">
														<svg xmlns="http://www.w3.org/2000/svg" width="18" height="17"
															viewBox="0 0 18 17" fill="none">
															<path
																d="M10.9297 14.1426H13.5011V16.714H10.9297V14.1426ZM15.4297 14.1426H18.0011V16.714H15.4297V14.1426ZM10.9297 9.64258H13.5011V12.214H10.9297V9.64258ZM15.4297 9.64258H18.0011V12.214H15.4297V9.64258Z"
																fill="{if $section == "12"}#014952{else}white{/if}" />
															<path
																d="M9.64286 14.1429H1.28571V5.14286H16.7143V8.35714H18V5.14286C17.9997 4.80197 17.8641 4.47514 17.623 4.2341C17.382 3.99305 17.0552 3.85748 16.7143 3.85714H12.8571V1.28571C12.8568 0.944826 12.7212 0.617997 12.4802 0.376953C12.2391 0.135908 11.9123 0.000340378 11.5714 0H6.42857C6.08768 0.000340378 5.76085 0.135908 5.51981 0.376953C5.27877 0.617997 5.1432 0.944826 5.14286 1.28571V3.85714H1.28571C0.944826 3.85748 0.617997 3.99305 0.376953 4.2341C0.135908 4.47514 0.000340378 4.80197 0 5.14286V14.1429C0.000340378 14.4837 0.135908 14.8106 0.376953 15.0516C0.617997 15.2927 0.944826 15.4282 1.28571 15.4286H9.64286V14.1429ZM6.42857 1.28571H11.5714V3.85714H6.42857V1.28571Z"
																fill="{if $section == "12"}#014952{else}white{/if}" />
														</svg>
													</div>
													<div id="menutitlesection"><strong
															class="{if $section == "12"}sidebar-item-li-selected{else}sidebar-item-li{/if}">{php}
															echo gettext("PACKAGE OFFER");{/php}</strong></div>
												</div>
												<div id="menutitlebutton">
													<img id="img12" {if ($section == "12")}
														src="templates/{$SKIN_NAME}/images/minus-white.png" {else}
														src="templates/{$SKIN_NAME}/images/plus.png" {/if}
														onmouseover="this.style.cursor='hand';">
												</div>
											</div>
										</div>
									</a>
								</li>
							</div>
							<div class="tohide" {if ($section =="12")} style="">
								{else}
									style="display:none;">
								{/if}
								<ul>
									<li>
										<ul>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'package'}active-sb-menu{/if}"
													href="A2B_entity_package.php?atmenu=package&section=12">{php} echo
													gettext("Add");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'details'}active-sb-menu{/if}"
													href="A2B_detail_package.php?atmenu=details&section=12">{php} echo
													gettext("Details");{/php}</a></li>
										</ul>
									</li>
								</ul>

							</div>
						{/if}



						{if ($ACXCRONTSERVICE > 0)}
							<div class="toggle_menu">
								<li>
									<a href="javascript:;" class="toggle_menu" target="_self">
										<div>
											<div
												class="{if $section == "13"}menu-active{/if} d-flex justify-content-between mx-2">
												<div class="d-flex">
													<div style="padding: 0px 10px 0px 8px;">
														<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
															viewBox="0 0 18 18" fill="none">
															<path
																d="M9 0C4.04169 0 0 4.04169 0 9C0 13.959 4.04169 18 9 18C13.5381 18 17.3077 14.616 17.9135 10.233C17.9391 10.0948 17.9364 9.95292 17.9055 9.81583C17.8747 9.67874 17.8164 9.54933 17.7341 9.43544C17.6518 9.32156 17.5472 9.22556 17.4267 9.15326C17.3062 9.08096 17.1723 9.03387 17.0331 9.01483C16.8939 8.99579 16.7522 9.0052 16.6168 9.0425C16.4813 9.0798 16.3548 9.1442 16.2449 9.23181C16.1351 9.31942 16.0441 9.42841 15.9776 9.55219C15.9111 9.67597 15.8704 9.81196 15.858 9.95192C15.3921 13.3235 12.5107 15.9231 9 15.9231C5.16462 15.9231 2.07692 12.8361 2.07692 9C2.07692 5.16462 5.16462 2.07692 9 2.07692C11.2403 2.07692 13.2293 3.13962 14.4955 4.78108L13.2618 6.01477C13.158 6.11862 13.131 6.28546 13.1753 6.42531C13.2168 6.56515 13.3338 6.65515 13.4785 6.68492C15.3457 7.05185 17.4988 6.88985 17.5888 6.87946C17.68 6.86302 17.7635 6.81763 17.8269 6.75C17.8892 6.68908 17.9446 6.62538 17.9571 6.53331C17.9675 6.44331 18.1302 4.27154 17.7618 2.40162C17.7509 2.332 17.7208 2.26679 17.675 2.21325C17.6291 2.15972 17.5693 2.11995 17.5022 2.09838C17.361 2.05546 17.1948 2.08108 17.0917 2.18492L15.9667 3.30992C14.3155 1.29462 11.8018 0 9 0Z"
																fill="{if $section == "13"}#014952{else}white{/if}" />
														</svg>
													</div>
													<div id="menutitlesection"><strong
															class="{if $section == "13"}sidebar-item-li-selected{else}sidebar-item-li{/if}">{php}
															echo gettext("RECUR SERVICE");{/php}</strong></div>
												</div>
												<div id="menutitlebutton">
													<img id="img13" {if ($section == "13")}
														src="templates/{$SKIN_NAME}/images/minus-white.png" {else}
														src="templates/{$SKIN_NAME}/images/plus.png" {/if}
														onmouseover="this.style.cursor='hand';">
												</div>
											</div>
										</div>
									</a>
								</li>
							</div>
							<div class="tohide" {if ($section =="13")} style="">
								{else}
									style="display:none;">
								{/if}
								<ul>
									<li>
										<ul>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'account_service'}active-sb-menu{/if}"
													href="A2B_entity_service.php?atmenu=account_service&section=13">{php} echo
													gettext("Account Service");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'subscriptions_service'}active-sb-menu{/if}"
													href="A2B_entity_subscription.php?atmenu=subscriptions_service&section=13">{php}
													echo gettext("Subscriptions Service");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'subscriber_signup'}active-sb-menu{/if}"
													href="A2B_entity_subscriber_signup.php?atmenu=subscriber_signup&section=13">{php}
													echo gettext("Subscriptions SIGNUP");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'subscribers'}active-sb-menu{/if}"
													href="A2B_entity_subscriber.php?atmenu=subscribers&section=13">{php} echo
													gettext("Subscribers");{/php}</a></li>
											<li><a class="sb-menu-item mx-4 {if $atmenu == 'autofill_report'}active-sb-menu{/if}"
													href="A2B_entity_autorefill.php?atmenu=autofill_report&section=13">{php}
													echo gettext("AutoRefill Report");{/php}</a></li>
										</ul>
									</li>
								</ul>
							</div>
						{/if}


						{* {if ($ACXCALLBACK  > 0)}
		<div class="toggle_menu"><li>
		<a href="javascript:;" class="toggle_menu" target="_self"> <div> <div id="menutitlebutton"> <img id="img14"
		{if ($section == "14")}
		src="templates/{$SKIN_NAME}/images/minus.gif"
		{else}
		src="templates/{$SKIN_NAME}/images/plus.gif"
		{/if} onmouseover="this.style.cursor='hand';" ></div> <div id="menutitlesection"><strong class="sidebar-item-li">{php} echo gettext("CALLBACK");{/php}</strong></div></div></a></li></div>
			<div class="tohide"
		{if ($section =="14")}
			style="">
		{else}
			style="display:none;">
		{/if}
			<ul>
				<li><ul>
					<li><a href="A2B_entity_callback.php?section=14">{php} echo gettext("Add");{/php}</a></li>
					<li><a href="A2B_entity_server_group.php?section=14">{php} echo gettext("Server Group");{/php}</a></li>
					<li><a href="A2B_entity_server.php?section=14">{php} echo gettext("Server");{/php}</a></li>
				</ul></li>
			</ul>
		</div>
		{/if} *}

						{if ($ACXPREDICTIVEDIALER > 0)}
							<div class="toggle_menu">
								<li>
									<a href="javascript:;" class="toggle_menu" target="_self">
										<div>
											<div
												class="{if $section == "15"}menu-active{/if} d-flex justify-content-between mx-2">
												<div class="d-flex">
													<div style="padding: 0px 10px 0px 8px;">
														<svg xmlns="http://www.w3.org/2000/svg" width="18" height="14"
															viewBox="0 0 18 14" fill="none">
															<path
																d="M16.0312 0.362504C15.8378 0.237383 15.6167 0.161688 15.3872 0.142072C15.1576 0.122455 14.9268 0.159519 14.715 0.250004L7.77375 2.98375C7.60942 3.05063 7.43367 3.08502 7.25625 3.085H2.8125C2.43954 3.085 2.08185 3.23316 1.81813 3.49688C1.55441 3.76061 1.40625 4.11829 1.40625 4.49125V4.60375H0V7.97875H1.40625V8.125C1.41506 8.49208 1.5671 8.84116 1.82988 9.09763C2.09265 9.35409 2.44531 9.49761 2.8125 9.4975L4.5 13.075C4.61427 13.3159 4.79416 13.5197 5.01903 13.663C5.2439 13.8063 5.50462 13.8832 5.77125 13.885H6.48C6.85101 13.882 7.20581 13.7326 7.4671 13.4692C7.7284 13.2058 7.87501 12.8498 7.875 12.4788V9.6325L14.715 12.3663C14.8832 12.4332 15.0627 12.4676 15.2438 12.4675C15.5247 12.463 15.7982 12.377 16.0312 12.22C16.2163 12.0951 16.3689 11.9279 16.4765 11.7322C16.5841 11.5366 16.6436 11.3182 16.65 11.095V1.52125C16.649 1.29233 16.5921 1.06713 16.4842 0.865191C16.3764 0.663256 16.2209 0.490697 16.0312 0.362504ZM6.46875 4.49125V8.125H2.8125V4.49125H6.46875ZM6.46875 12.4788H5.76L4.37625 9.4975H6.46875V12.4788ZM8.29125 8.29375C8.15768 8.22549 8.0184 8.16903 7.875 8.125V4.4125C8.01702 4.3832 8.15628 4.3418 8.29125 4.28875L15.2438 1.52125V11.0613L8.29125 8.29375ZM16.6838 4.885V7.6975C17.0567 7.6975 17.4144 7.54935 17.6781 7.28562C17.9418 7.0219 18.09 6.66421 18.09 6.29125C18.09 5.91829 17.9418 5.56061 17.6781 5.29688C17.4144 5.03316 17.0567 4.885 16.6838 4.885Z"
																fill="{if $section == "15"}#014952{else}white{/if}" />
														</svg>
													</div>
													<div id="menutitlesection"><strong
															class="{if $section == "15"}sidebar-item-li-selected{else}sidebar-item-li{/if}">{php}
															echo gettext("CAMPAIGNS");{/php}</strong></div>
												</div>
												<div id="menutitlebutton">
													<img id="img15" {if ($section == "15")}
														src="templates/{$SKIN_NAME}/images/minus-white.png" {else}
														src="templates/{$SKIN_NAME}/images/plus.png" {/if}
														onmouseover="this.style.cursor='hand';">
												</div>
											</div>
										</div>
									</a>
								</li>
							</div>
							<div class="tohide" {if ($section =="15")} style="">
								{else}
									style="display:none;">
								{/if}
								<ul>
									<li>
										<a class="sb-menu-item mx-4 {if $atmenu == 'promotion'}active-sb-menu{/if}"
											href="A2B_entity_promotion.php?atmenu=promotion&section=15">{php} echo gettext("Promotion");{/php}
										</a>
									</li>
								</ul>
							</div>
						{/if}



						{* {if ($ACXMAINTENANCE  > 0)}
		<div class="toggle_menu"><li>
		<a href="javascript:;" class="toggle_menu" target="_self"> <div> <div id="menutitlebutton"> <img id="img16"
		{if ($section == "16")}
		src="templates/{$SKIN_NAME}/images/minus.gif"
		{else}
		src="templates/{$SKIN_NAME}/images/plus.gif"
		{/if} onmouseover="this.style.cursor='hand';" ></div> 
		<div id="menutitlesection"><strong class="sidebar-item-li">{php} echo gettext("MAINTENANCE");{/php}</strong></div>
		</div></a></li></div>
			<div class="tohide"
		{if ($section =="16")}
			style="">
		{else}
			style="display:none;">
		{/if}
			<ul>
				<li><ul>
					<li><a href="A2B_entity_alarm.php?section=16"> {php} echo gettext("Alarms");{/php}</a></li>
					<li><a href="A2B_entity_log_viewer.php?section=16">{php} echo gettext("Users Activity");{/php}</a></li>
					<li><a href="A2B_entity_backup.php?form_action=ask-add&section=16">{php} echo gettext("Database Backup");{/php}</a></li>
					<li><a href="A2B_entity_restore.php?section=16">{php} echo gettext("Database Restore");{/php}</a></li>
					<li><a href="CC_musiconhold.php?section=16">{php} echo gettext("MusicOnHold");{/php}</a></li>
					<li><a href="CC_upload.php?section=16">{php} echo gettext("Upload File");{/php}</a></li>
					<li><a href="A2B_logfile.php?section=16">{php} echo gettext("Watch Log files");{/php}</a></li>
					<li><a href="A2B_data_archiving.php?section=16">{php} echo gettext("Archiving");{/php}</a></li>
					<li><a href="A2B_asteriskinfo.php?section=16">{php} echo "Asterisk Info";{/php}</a></li>
					<li><a href="A2B_phpsysinfo.php?section=16">{php} echo "phpSysInfo";{/php}</a></li>
					<li><a href="A2B_phpinfo.php?section=16">{php} echo "phpInfo";{/php}</a></li>
					<li><a href="A2B_entity_monitor.php?section=16"> {php} echo gettext("Monitoring");{/php}</a></li>
				</ul></li>
			</ul>
		</div>

		{/if}
	 *}
						{* {if ($ACXMAIL  > 0)}
		<!-- Disabled Mail feature -->
		<div class="toggle_menu"><li>
		<a href="javascript:;" class="toggle_menu" target="_self"> <div> <div id="menutitlebutton"> <img id="img17"
		{if ($section == "17")}
		src="templates/{$SKIN_NAME}/images/minus.gif"
		{else}
		src="templates/{$SKIN_NAME}/images/plus.gif"
		{/if} onmouseover="this.style.cursor='hand';" ></div> <div id="menutitlesection"><strong class="sidebar-item-li">{php} echo gettext("MAIL");{/php}</strong></div></div></a></li></div>
			<div class="tohide"
		{if ($section =="17")}
			style="">
		{else}
			style="display:none;">
		{/if}
			<ul>
				<li><ul>
					<li><a href="A2B_entity_mailtemplate.php?atmenu=mailtemplate&section=17&languages=en">{php} echo gettext("Mail templates");{/php}</a></li>
					<li><a href="A2B_mass_mail.php?section=17">{php} echo gettext("Mass Mail");{/php}</a></li>
				</ul></li>
			</ul>
		</div>
		{/if}
	 *}

						{if ($ACXSETTING > 0)}
							<div class="toggle_menu">
								<li>
									<a href="javascript:;" class="toggle_menu" target="_self">
										<div>
											<div
												class="{if $section == "18"}menu-active{/if} d-flex justify-content-between mx-2">
												<div class="d-flex">
													<div style="padding: 0px 10px 0px 8px;">
														<svg xmlns="http://www.w3.org/2000/svg" width="18" height="20"
															viewBox="0 0 18 20" fill="none">
															<path fill-rule="evenodd" clip-rule="evenodd"
																d="M9 7.5C8.20435 7.5 7.44129 7.81607 6.87868 8.37868C6.31607 8.94129 6 9.70435 6 10.5C6 11.2956 6.31607 12.0587 6.87868 12.6213C7.44129 13.1839 8.20435 13.5 9 13.5C9.79565 13.5 10.5587 13.1839 11.1213 12.6213C11.6839 12.0587 12 11.2956 12 10.5C12 9.70435 11.6839 8.94129 11.1213 8.37868C10.5587 7.81607 9.79565 7.5 9 7.5ZM7.2 10.5C7.2 10.0226 7.38964 9.56477 7.72721 9.22721C8.06477 8.88964 8.52261 8.7 9 8.7C9.47739 8.7 9.93523 8.88964 10.2728 9.22721C10.6104 9.56477 10.8 10.0226 10.8 10.5C10.8 10.9774 10.6104 11.4352 10.2728 11.7728C9.93523 12.1104 9.47739 12.3 9 12.3C8.52261 12.3 8.06477 12.1104 7.72721 11.7728C7.38964 11.4352 7.2 10.9774 7.2 10.5Z"
																fill="{if $section == "18"}#014952{else}white{/if}" />
															<path fill-rule="evenodd" clip-rule="evenodd"
																d="M8.97789 0.5C8.58442 0.5 8.25637 0.5 7.98757 0.518605C7.71281 0.530642 7.44183 0.590361 7.18559 0.695349C6.89048 0.823804 6.62231 1.01216 6.39641 1.24966C6.1705 1.48716 5.99128 1.76916 5.86898 2.07953C5.74077 2.40512 5.70629 2.7493 5.69214 3.12326C5.69073 3.26002 5.65631 3.39416 5.59213 3.5131C5.52794 3.63205 5.43609 3.73188 5.32519 3.80326C5.21102 3.86884 5.08288 3.90282 4.95281 3.90201C4.82273 3.90119 4.69498 3.86561 4.58156 3.7986C4.26678 3.62372 3.96615 3.48326 3.63368 3.43674C3.31708 3.39293 2.99538 3.41516 2.68695 3.50214C2.37851 3.58913 2.08938 3.73918 1.83607 3.94372C1.62189 4.125 1.43756 4.34218 1.2905 4.58651C1.14019 4.82279 0.975722 5.1214 0.779426 5.47954L0.75732 5.52046C0.560139 5.8786 0.396559 6.17721 0.278074 6.43209C0.154283 6.69814 0.0570194 6.96046 0.0216507 7.2507C-0.0627034 7.92325 0.11032 8.60351 0.502665 9.14186C0.70692 9.42186 0.973069 9.62558 1.2737 9.82465C1.38579 9.89436 1.47917 9.99293 1.54506 10.1111C1.61096 10.2292 1.6472 10.3631 1.65038 10.5C1.6472 10.6369 1.61096 10.7708 1.54506 10.8889C1.47917 11.0071 1.38579 11.1056 1.2737 11.1753C0.973069 11.3744 0.707804 11.5781 0.502665 11.8581C0.308241 12.1246 0.165614 12.4288 0.0829297 12.7533C0.000245318 13.0778 -0.0208777 13.4162 0.0207666 13.7493C0.0570195 14.0395 0.153399 14.3019 0.27719 14.5679C0.396559 14.8228 0.560139 15.1214 0.75732 15.4795L0.779426 15.5205C0.975722 15.8786 1.14019 16.1772 1.2905 16.4135C1.44701 16.6581 1.61501 16.8786 1.83607 17.0553C2.08931 17.2601 2.37841 17.4103 2.68685 17.4974C2.99529 17.5846 3.31702 17.6069 3.63368 17.5633C3.96615 17.5167 4.26678 17.3772 4.58156 17.2014C4.69485 17.1345 4.82244 17.0989 4.95236 17.0981C5.08229 17.0973 5.21027 17.1312 5.32431 17.1967C5.43582 17.2676 5.52825 17.3672 5.59279 17.4863C5.65734 17.6053 5.69184 17.7397 5.69303 17.8767C5.70629 18.2507 5.74077 18.5949 5.86987 18.9205C5.99197 19.2309 6.17101 19.5131 6.39676 19.7507C6.62252 19.9884 6.89056 20.1769 7.18559 20.3056C7.44201 20.4172 7.70727 20.4609 7.98757 20.4805C8.25637 20.5 8.58442 20.5 8.97789 20.5H9.02211C9.41558 20.5 9.74363 20.5 10.0124 20.4814C10.2936 20.4609 10.558 20.4172 10.8144 20.3047C11.1095 20.1762 11.3777 19.9878 11.6036 19.7503C11.8295 19.5128 12.0087 19.2308 12.131 18.9205C12.2592 18.5949 12.2937 18.2507 12.3079 17.8767C12.3091 17.7398 12.3435 17.6055 12.4077 17.4864C12.4719 17.3673 12.5638 17.2673 12.6748 17.1958C12.7891 17.1304 12.9172 17.0965 13.0473 17.0975C13.1774 17.0985 13.3051 17.1342 13.4184 17.2014C13.7332 17.3763 14.0339 17.5167 14.3663 17.5623C15.0056 17.6511 15.6522 17.469 16.1639 17.0563C16.385 16.8777 16.553 16.6581 16.7095 16.4135C16.8598 16.1772 17.0243 15.8786 17.2206 15.5205L17.2427 15.4795C17.4399 15.1214 17.6034 14.8228 17.7219 14.5679C17.8457 14.3019 17.943 14.0386 17.9783 13.7493C18.0627 13.0768 17.8897 12.3965 17.4973 11.8581C17.2931 11.5781 17.0269 11.3744 16.7263 11.1753C16.6142 11.1056 16.5208 11.0071 16.4549 10.8889C16.389 10.7708 16.3528 10.6369 16.3496 10.5C16.3496 10.2414 16.484 9.98465 16.7263 9.82465C17.0269 9.62558 17.2922 9.42186 17.4973 9.14186C17.6918 8.87536 17.8344 8.57119 17.9171 8.2467C17.9998 7.92222 18.0209 7.58377 17.9792 7.2507C17.9372 6.96485 17.8505 6.68826 17.7228 6.43209C17.5718 6.12302 17.4117 5.819 17.2427 5.52046L17.2206 5.47954C17.0591 5.17636 16.8886 4.87854 16.7095 4.58651C16.5625 4.34244 16.3781 4.12557 16.1639 3.94465C15.9107 3.73995 15.6216 3.58973 15.3131 3.50258C15.0047 3.41544 14.683 3.39306 14.3663 3.43674C14.0339 3.48326 13.7332 3.62279 13.4184 3.7986C13.3051 3.86545 13.1775 3.90094 13.0476 3.90175C12.9177 3.90256 12.7898 3.86867 12.6757 3.80326C12.5645 3.73211 12.4723 3.63237 12.4078 3.51341C12.3433 3.39446 12.3086 3.2602 12.307 3.12326C12.2937 2.7493 12.2592 2.40512 12.1301 2.07953C12.008 1.76907 11.829 1.48695 11.6032 1.24929C11.3775 1.01163 11.1094 0.823083 10.8144 0.694419C10.558 0.582791 10.2927 0.53907 10.0124 0.519535C9.74363 0.5 9.41558 0.5 9.02211 0.5H8.97789ZM7.69313 1.98372C7.76121 1.95395 7.86466 1.92698 8.07776 1.91116C8.29616 1.89535 8.57911 1.89535 9 1.89535C9.42089 1.89535 9.70384 1.89535 9.92224 1.91116C10.1353 1.92698 10.2388 1.95395 10.3069 1.98372C10.5783 2.10186 10.7932 2.32791 10.9055 2.61349C10.9409 2.70279 10.97 2.84326 10.9815 3.17535C11.0081 3.91209 11.3697 4.62186 12.0116 5.01163C12.6536 5.40233 13.4184 5.37628 14.0383 5.03209C14.3177 4.87674 14.4477 4.83302 14.5396 4.82093C14.8301 4.78054 15.124 4.86319 15.3566 5.0507C15.415 5.09814 15.4893 5.17907 15.6086 5.36512C15.7316 5.55674 15.873 5.81442 16.0835 6.19767C16.2939 6.58093 16.4345 6.83953 16.5309 7.04605C16.6255 7.24791 16.6547 7.35581 16.6635 7.43302C16.7019 7.73867 16.6233 8.04784 16.4451 8.29256C16.3885 8.36977 16.2877 8.46651 16.0207 8.64326C15.4265 9.03581 15.0233 9.72046 15.0233 10.5C15.0233 11.2795 15.4265 11.9642 16.0207 12.3567C16.2877 12.5335 16.3885 12.6302 16.4451 12.7074C16.6237 12.9521 16.7015 13.2609 16.6635 13.567C16.6547 13.6442 16.6246 13.753 16.5309 13.954C16.4345 14.1614 16.2939 14.4191 16.0835 14.8023C15.873 15.1856 15.7307 15.4433 15.6086 15.6349C15.4893 15.8209 15.415 15.9019 15.3566 15.9493C15.124 16.1368 14.8301 16.2195 14.5396 16.1791C14.4477 16.167 14.3186 16.1233 14.0383 15.9679C13.4193 15.6237 12.6536 15.5977 12.0116 15.9874C11.3697 16.3781 11.0081 17.0879 10.9815 17.8247C10.97 18.1567 10.9409 18.2972 10.9055 18.3865C10.8499 18.5277 10.7685 18.656 10.6658 18.7641C10.5631 18.8721 10.4411 18.9578 10.3069 19.0163C10.2388 19.046 10.1353 19.073 9.92224 19.0888C9.70384 19.1047 9.42089 19.1047 9 19.1047C8.57911 19.1047 8.29616 19.1047 8.07776 19.0888C7.86466 19.073 7.76121 19.046 7.69313 19.0163C7.55891 18.9578 7.43695 18.8721 7.33423 18.7641C7.23152 18.656 7.15006 18.5277 7.09451 18.3865C7.05914 18.2972 7.02996 18.1567 7.01847 17.8247C6.99194 17.0879 6.6303 16.3781 5.98835 15.9884C5.34641 15.5977 4.58156 15.6237 3.96173 15.9679C3.68231 16.1233 3.55233 16.167 3.46037 16.1791C3.16985 16.2195 2.87597 16.1368 2.64336 15.9493C2.585 15.9019 2.51072 15.8209 2.39136 15.6349C2.22504 15.3625 2.06669 15.0849 1.91653 14.8023C1.70609 14.4191 1.5655 14.1605 1.46912 13.954C1.3745 13.7521 1.34533 13.6442 1.33648 13.567C1.29809 13.2613 1.37665 12.9522 1.55488 12.7074C1.61147 12.6302 1.71228 12.5335 1.97931 12.3567C2.5735 11.9642 2.97671 11.2795 2.97671 10.5C2.97671 9.72046 2.5735 9.03581 1.97931 8.64326C1.71228 8.46651 1.61147 8.36977 1.55488 8.29256C1.37665 8.04784 1.29809 7.73867 1.33648 7.43302C1.34533 7.35581 1.37539 7.24698 1.46912 7.04605C1.5655 6.8386 1.70609 6.58093 1.91653 6.19767C2.12697 5.81442 2.26933 5.55674 2.39136 5.36512C2.51072 5.17907 2.585 5.09814 2.64336 5.0507C2.87597 4.86319 3.16985 4.78054 3.46037 4.82093C3.55233 4.83302 3.68143 4.87674 3.96173 5.03209C4.58068 5.37628 5.34641 5.40233 5.98835 5.01163C6.6303 4.62186 6.99194 3.91209 7.01847 3.17535C7.02996 2.84326 7.05914 2.70279 7.09451 2.61349C7.20681 2.32791 7.42167 2.10186 7.69313 1.98372Z"
																fill="{if $section == "18"}#014952{else}white{/if}" />
														</svg>
													</div>
													<div id="menutitlesection"><strong
															class="{if $section == "18"}sidebar-item-li-selected{else}sidebar-item-li{/if}">{php}
															echo gettext("SYSTEM SETTINGS");{/php}</strong></div>
												</div>
												<div id="menutitlebutton">
													<img id="img18" {if ($section == "18")}
														src="templates/{$SKIN_NAME}/images/minus-white.png" {else}
														src="templates/{$SKIN_NAME}/images/plus.png" {/if}
														onmouseover="this.style.cursor='hand';">
												</div>
											</div>
										</div>
									</a>
								</li>
							</div>
							<div class="tohide" {if ($section =="18")} style="">
								{else}
									style="display:none;">
								{/if}
								<ul>
									<li>
										<ul>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'config'}active-sb-menu{/if}"
													href="A2B_entity_config.php?form_action=list&atmenu=config&section=18">
													{php} echo gettext("Global List");{/php}
												</a>
											</li>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'configgroup'}active-sb-menu{/if}"
													href="A2B_entity_config_group.php?form_action=list&atmenu=configgroup&section=18">
													{php} echo gettext("Group List");{/php}
												</a>
											</li>
											<li>
												<a class="sb-menu-item mx-4 {if $atmenu == 'addconfig'}active-sb-menu{/if}"
													href="A2B_entity_config_generate_confirm.php?section=18">
													{php} echo gettext("Add agi-conf");{/php}
												</a>
											</li>
											<li>
												<a class="mx-4" href="phpconfig.php?dir=/etc/asterisk&section=18">
													{php} echo gettext("Config Editor");{/php}
												</a>
											</li>
											{if ($ASTERISK_GUI_LINK)}
												<li>
													<a class="mx-4"
														href="http://{$HTTP_HOST}:8088/asterisk/static/config/index.html"
														target="_blank">
														{php} echo gettext("Asterisk GUI");{/php}
													</a>
												</li>
											{/if}
										</ul>
									</li>
								</ul>

							</div>
						{/if}


					</ul>


				</div>
			</div>
		</div>



		{*
	<table width="100%" cellspacing="15">
	<tr>
		<td>
			<a href="PP_intro.php?ui_language=english" target="_parent"><img src="templates/{$SKIN_NAME}/images/flags/gb.gif" border="0" title="English" alt="English"></a>
			<a href="PP_intro.php?ui_language=brazilian" target="_parent"><img src="templates/{$SKIN_NAME}/images/flags/br.gif" border="0" title="Brazilian" alt="Brazilian"></a>
			<a href="PP_intro.php?ui_language=romanian" target="_parent"><img src="templates/{$SKIN_NAME}/images/flags/ro.gif" border="0" title="Romanian"alt="Romanian"></a>
			<a href="PP_intro.php?ui_language=french" target="_parent"><img src="templates/{$SKIN_NAME}/images/flags/fr.gif" border="0" title="French" alt="French"></a>
			<a href="PP_intro.php?ui_language=spanish" target="_parent"><img src="templates/{$SKIN_NAME}/images/flags/es.gif" border="0" title="Spanish" alt="Spanish"></a>
			<a href="PP_intro.php?ui_language=greek" target="_parent"><img src="templates/{$SKIN_NAME}/images/flags/gr.gif" border="0" title="Greek" alt="Greek"></a>
			<a href="PP_intro.php?ui_language=italian" target="_parent"><img src="templates/{$SKIN_NAME}/images/flags/it.gif" border="0" title="Italian" alt="Italian"></a>
		</td>
	</tr>
	</table>
	*}
		<div id="osx-modal-content">
			<div id="osx-modal-title">Dear A2Billing Administrator</div>
			<div id="osx-modal-data">
				<h2>Licence Violation!</h2>
				<p>Thank you for using A2Billing. However, we have detected that you have edited the Author’s names,
					Copyright or licensing information in the A2Billing Management Interface.</p>
				<p>The <a href="http://www.fsf.org/licensing/licenses/agpl-3.0.html" target="_blank">AGPL 3</a> license
					under which you are allowed to use A2Billing requires that the original copyright and license must be
					displayed and kept intact. Without this information being displayed, you do not have a right to use the
					software.</p>
				<p>However, if it is important to you that the Author’s names, Copyright and License information is not
					displayed, possibly for publicity purposes; then we can offer you additional permissions to use and
					convey A2Billing, with these items removed, for a fee that will be used to help sponsor the continued
					development of A2Billing.</p>
				<p>For more information, please go to <a target="_blank"
						href="http://www.asterisk2billing.org/pricing/rebranding/">http://www.asterisk2billing.org/pricing/rebranding/</a>.
				</p>
				<p>Yours,<br />
					The A2Billing Team<br />
					Star2Billing S.L</p>
				<p><button class="simplemodal-close">Close</button></p>
			</div>
		</div>


	</div>

	<div id="main-content" style="overflow-y: auto;height: 100vh;">

	{else}
		<div>
		{/if}
		{if ($popupwindow == 0)}
			{* <div id="top_menu">
		<ul id="menu_horizontal">
			<li class="topmenu-left-button" style="border:none;">
				<div style="width:100%;height:100%;text-align:center;" >
					<a href="PP_intro.php">
							<font color="#016774"><strong> {php} echo gettext("HOME");{/php}</strong></font>&nbsp;
						<img style="vertical-align:bottom;" src="templates/{$SKIN_NAME}/images/house.png">
					</a>
				</div>
			</li>
			{if ($ACXDASHBOARD > 0) }
			<li class="topmenu-left-button" >
				<div style="width:100%;height:100%;text-align:center;" >
					<a href="dashboard.php" >
						<font color="#016774"><strong> {php} echo gettext("DASHBOARD");{/php}</strong></font>&nbsp;
						<img style="vertical-align:bottom;" src="templates/{$SKIN_NAME}/images/chart_bar.png">
					</a>
				</div>
			</li>
			{/if}
			<li class="topmenu-left-button">
				<div style="width:100%;height:100%;text-align:center;" >
					 <a href="A2B_notification.php" >
						<font color="#016774"><strong > {php} echo gettext("NOTIFICATION");{/php}</strong></font>&nbsp;
					<img style="vertical-align:bottom;" src="templates/{$SKIN_NAME}/images/email.png">
					{if ($NEW_NOTIFICATION > 0) }
						<strong style="font-size:8px; color:red;"> NEW</strong>
					{else}
						<strong style="font-size:8px;">&nbsp;</strong>
					{/if}
					  </a>
				</div>
			</li>
			<li class="topmenu-right-button" style="border-right:none;border-left:1px solid #aaaaaa">
				<div style="width:90%;height:100%;text-align:center;" >
					<a href="logout.php?logout=true" target="_top"><font color="#016774"><b>&nbsp;&nbsp;{php} echo gettext("LOGOUT");{/php}</b></font>
					<img style="vertical-align:bottom;" src="templates/{$SKIN_NAME}/images/logout.png"> </a>
				</div>
			</li>
		</ul>

	</div> *}
			<div class="px-4 py-2 header" style="display: flex; align-items: center;margin : 0 0 8px 0">
				<div style="flex-grow: 1;">
					<p class="mx-2" style="font-size: 14px; font-weight: 600; color: #014952 ;" id="greeting"></p>
					<h2 class="navbar-heading">Welcome to dashboard</h2>
				</div>
				<a href="A2B_notification.php">
					<svg xmlns="http://www.w3.org/2000/svg" width="35" height="34" viewBox="0 0 35 34" fill="none">
						<path
							d="M33.846 17C33.846 26.2501 26.3257 33.75 17.0475 33.75C7.7693 33.75 0.249023 26.2501 0.249023 17C0.249023 7.7499 7.7693 0.25 17.0475 0.25C26.3257 0.25 33.846 7.7499 33.846 17Z"
							fill="#4CEADB" stroke="#E2E8F0" stroke-width="0.5" />
						<path
							d="M24.268 22.9344L23.7039 22.0625C23.5911 21.8937 23.5347 21.725 23.5347 21.5281V15.6781C23.5347 14.0187 22.8296 12.4719 21.5321 11.3187C20.4885 10.3906 19.1347 9.79999 17.6962 9.68749V9.12499C17.6962 8.78749 17.4141 8.47812 17.0475 8.47812C16.709 8.47812 16.3988 8.75937 16.3988 9.12499V9.65937C16.3423 9.65937 16.2859 9.65937 16.2295 9.68749C12.9577 10.0531 10.5039 12.6687 10.5039 15.7906V21.5281C10.4757 21.8094 10.4192 21.95 10.3628 22.0344L9.82694 22.9344C9.6577 23.2156 9.6577 23.5531 9.82694 23.8344C9.99617 24.0875 10.2782 24.2562 10.5885 24.2562H16.427V24.875C16.427 25.2125 16.709 25.5219 17.0757 25.5219C17.4141 25.5219 17.7244 25.2406 17.7244 24.875V24.2562H23.5347C23.8449 24.2562 24.127 24.0875 24.2962 23.8344C24.4655 23.5531 24.4655 23.2156 24.268 22.9344ZM11.2654 22.9906L11.4628 22.6531C11.6321 22.3719 11.7167 22.0344 11.7731 21.6406V15.7906C11.7731 13.3156 13.7475 11.2344 16.3706 10.9531C17.9782 10.7844 19.5577 11.2625 20.7142 12.275C21.7295 13.175 22.2937 14.3844 22.2937 15.6781V21.5281C22.2937 21.95 22.4065 22.3437 22.6603 22.7375L22.8296 22.9906H11.2654V22.9906Z"
							fill="#016774" />
					</svg>
				</a>
				{* <div class="btn-group">
  <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">  </button>
  <div class="dropdown-menu dropdown-menu-right mt-4">
  <div>
    <a href="A2B_entity_password.php?atmenu=password&form_action=ask-edit" class="mx-4 my-2 header-dropdown-menu" type="button">Change Password</a>
  </div>
  <div>
	<a href="logout.php?logout=true" class="mx-4 my-2 header-dropdown-menu" type="button">Logout</a>
	</div>
	</div>
</div> *}
				<div class="xn-nav-container">
					<div class="xn-menu">
						<div class="xn-menu-item">
							<a class="xn-menu-link btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false" href="#"></a>
							<div class="xn-dropdown-menu">
								<div class="xn-dropdown-item"><a
										href="A2B_entity_password.php?atmenu=password&form_action=ask-edit"
										class="mx-4 my-2 header-dropdown-menu" type="button">Change Password</a></div>
								<div class="xn-dropdown-item"><a href="logout.php?logout=true"
										class="mx-4 my-2 header-dropdown-menu" type="button">Logout</a></div>
							</div>
						</div>
					</div>
				</div>
			</div>

		{/if}



		{if ($LCMODAL  > 0)}
			<script type="text/javascript">
				loadLicenceModal();
			</script>
		{/if}

		<script>
			// Get all menu items
			const menuItems = document.querySelectorAll('.xn-menu-item');

			menuItems.forEach(item => {
				const link = item.querySelector('.xn-menu-link');
				link.addEventListener('click', (e) => {
					e.preventDefault(); // Prevent default link behavior

					// Toggle 'active' class on the parent .xn-menu-item
					item.classList.toggle('active');

					// Close other open dropdowns
					menuItems.forEach(otherItem => {
						if (otherItem !== item) {
							otherItem.classList.remove('active');
						}
					});
				});
			});

			// Close the dropdown if clicked outside
			document.addEventListener('click', (e) => {
				if (!e.target.closest('.xn-menu-item')) {
					menuItems.forEach(item => {
						item.classList.remove('active');
					});
				}
			});
		</script>

{$MAIN_MSG}