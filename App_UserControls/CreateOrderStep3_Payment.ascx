<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateOrderStep3_Payment.ascx.cs" Inherits="ZASshop.NET.App_UserControls.CreateOrderStep3_Payment" EnableViewState="false" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Panel runat="server">
<script type="text/javascript" src="/App_Firma/js/jquery-ui-1.11.4.min.js"></script>
<link href="/App_Firma/js/jquery-ui-1.11.4.min.css" rel="stylesheet" type="text/css" media="screen" />


<script type="text/javascript">

    $.datepicker.regional['cs'] = {
        closeText: 'Cerrar',
        prevText: '<%: ZASutility.MyUtility.GetLangResource("Previous")%>',
        nextText: '<%: ZASutility.MyUtility.GetLangResource("Next")%>',
        currentText: 'Hoy',
        monthNames: ['<%: ZASutility.MyUtility.GetLangResource("January")%>', '<%: ZASutility.MyUtility.GetLangResource("February")%>', '<%: ZASutility.MyUtility.GetLangResource("March")%>', '<%: ZASutility.MyUtility.GetLangResource("April")%>', '<%: ZASutility.MyUtility.GetLangResource("May")%>', '<%: ZASutility.MyUtility.GetLangResource("June")%>', '<%: ZASutility.MyUtility.GetLangResource("July")%>', '<%: ZASutility.MyUtility.GetLangResource("August")%>', '<%: ZASutility.MyUtility.GetLangResource("September")%>', '<%: ZASutility.MyUtility.GetLangResource("October")%>', '<%: ZASutility.MyUtility.GetLangResource("November")%>', '<%: ZASutility.MyUtility.GetLangResource("December")%>'],
        monthNamesShort: ['<%: ZASutility.MyUtility.GetLangResource("JanuaryShort")%>', '<%: ZASutility.MyUtility.GetLangResource("FebruaryShort")%>', '<%: ZASutility.MyUtility.GetLangResource("MarchShort")%>', '<%: ZASutility.MyUtility.GetLangResource("AprilShort")%>', '<%: ZASutility.MyUtility.GetLangResource("MayShort")%>', '<%: ZASutility.MyUtility.GetLangResource("JuneShort")%>', '<%: ZASutility.MyUtility.GetLangResource("JulyShort")%>', '<%: ZASutility.MyUtility.GetLangResource("AugustShort")%>', '<%: ZASutility.MyUtility.GetLangResource("SeptemberShort")%>', '<%: ZASutility.MyUtility.GetLangResource("OctoberShort")%>', '<%: ZASutility.MyUtility.GetLangResource("NovemberShort")%>', '<%: ZASutility.MyUtility.GetLangResource("DecemberShort")%>'],
        dayNames: ['<%: ZASutility.MyUtility.GetLangResource("Sunday")%>', '<%: ZASutility.MyUtility.GetLangResource("Mondey")%>', '<%: ZASutility.MyUtility.GetLangResource("Tuesday")%>', '<%: ZASutility.MyUtility.GetLangResource("Wednesday")%>', '<%: ZASutility.MyUtility.GetLangResource("Thursday")%>', '<%: ZASutility.MyUtility.GetLangResource("Friday")%>', '<%: ZASutility.MyUtility.GetLangResource("Saturday")%>'],
        dayNamesShort: ['<%: ZASutility.MyUtility.GetLangResource("SundayShort")%>', '<%: ZASutility.MyUtility.GetLangResource("MondeyShort")%>', '<%: ZASutility.MyUtility.GetLangResource("TuesdayShort")%>', '<%: ZASutility.MyUtility.GetLangResource("WednesdayShort")%>', '<%: ZASutility.MyUtility.GetLangResource("ThursdayShort")%>', '<%: ZASutility.MyUtility.GetLangResource("FridayShort")%>', '<%: ZASutility.MyUtility.GetLangResource("SaturdayShort")%>'],
        dayNamesMin: ['<%: ZASutility.MyUtility.GetLangResource("SundayShort")%>', '<%: ZASutility.MyUtility.GetLangResource("MondeyShort")%>', '<%: ZASutility.MyUtility.GetLangResource("TuesdayShort")%>', '<%: ZASutility.MyUtility.GetLangResource("WednesdayShort")%>', '<%: ZASutility.MyUtility.GetLangResource("ThursdayShort")%>', '<%: ZASutility.MyUtility.GetLangResource("FridayShort")%>', '<%: ZASutility.MyUtility.GetLangResource("SaturdayShort")%>'],
        weekHeader: 'Sm',
        dateFormat: 'dd.mm.yy',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    };
    $.datepicker.setDefaults($.datepicker.regional['cs']);

    var ulozenka = {
          init: function (){

            if( $("span[dopravne_ext='10']").find("input").is(':checked')) {
                $(".ulozenka-selector-branch-desc").val("Uloženka");

                 $(".ulozenka-selector-branch-desc").val("Uloženka");
                 $("span[dopravne_ext='10']").append(" <a class='_pobockaUlozenka ulozenka-selector-branch-name'>Vyberte pobočku</a>");

                    if( localStorage.getItem("ulozenka-country") ) {

                          $(".ulozenka-selector-branch-country").val( localStorage.getItem("ulozenka-country") );
                          $(".ulozenka-selector-branch-name").val( localStorage.getItem("ulozenka-name") );
                          $(".ulozenka-selector-branch-id").val( localStorage.getItem("ulozenka-id") );
                          $("._pobockaUlozenka").html( localStorage.getItem("ulozenka-name") + " (změnit)" );
                    }

            }

            if( $("span[dopravne_ext='10']").find("input").is(':checked') && $("._pobockaUlozenka").text() === "Vyberte pobočku") {
                                $(".ulozenka-selector-branch-desc").val("Uloženka");
                                 ulozenka.open();
            }

            $("._closeUlozenka").click( function (){
                            $(".backModal").hide();
                            $("#ulozenka").hide();
                        });

            $("._pobockaUlozenka").click( function (){
                             ulozenka.open();
                         });

          },
          getSelect: function () {
              if($("#ulozenka-branch-select-options").find("#branches_lists").length < 1) {
                var response = "";
                var UlozenkaUrl = '<%: "https://api.ulozenka.cz/v2/branches?shopId=" + ZASutility.MyUtility.GetSession("ulozenka_id") %>';
                  var request = new XMLHttpRequest();
                  optionsDiv = document.getElementById('ulozenka-branch-select-options');
                  request.open("GET", UlozenkaUrl , true);
                  request.setRequestHeader('Accept', 'application/json')
                  request.onreadystatechange = function () {
                      if (request.readyState == 4) {
                          if (request.status == 200 || request.status == 0) {
                              response = JSON.parse(request.responseText);
                              branches = response.data;
                              var sortable = [];
                              for (i = 0; i < branches.length; i++) {
                                  branch = branches[i];
                                  sortable.push([branch.id, "" + branch.name + ""])
                              }
                              sortable.sort(function (a, b) {
                                  return a[1].localeCompare(b[1]);
                              })
                              sortedBranches = sortable;
                              select = document.createElement("select");
                              select.setAttribute('name', "ulozenka_branches");
                              select.setAttribute('id', "branches_lists");
                              select.setAttribute('class', "js-example-basic-multiple'");
                              $("#ulozenka-branch-select-options").html("");
                              optionsDiv.appendChild(select);
                              option = document.createElement("option");
                              option.innerHTML = 'Zvolte si výdejní místo';
                              select.appendChild(option);
                              for (i = 0; i < sortedBranches.length; i++) {
                                  branch = sortedBranches[i];
                                  option = document.createElement("option");
                                  option.setAttribute('value', branch[0]);
                                  option.innerHTML = branch[1];
                                  select.appendChild(option);
                              }

                              $("#branches_lists").select2({ width: '100%' }).data('select2').$dropdown.addClass('myDropDownBranch');

                          } else {
                              optionsDiv.innerHTML = "Nepodařilo se načíst seznam poboček.";
                          }
                      }
                      ulozenka.selectEvent();
                  }
                  request.send();

              }
          },
          selectEvent: function (){
              
              $("#branches_lists").change( function (){
                  $("._pobockaUlozenka").html( $(this).find("option:selected").text() + " (změnit)" );

                  localStorage.setItem("ulozenka-id", this.value );
                  localStorage.setItem("ulozenka-name", $(this).find("option:selected").text() );
                  localStorage.setItem("ulozenka-country", "CS" );

                  $(".ulozenka-selector-branch-id").val( this.value );
                  $(".ulozenka-selector-branch-name").val( $(this).find("option:selected").text() );
                  $(".ulozenka-selector-branch-country").val( "CS" );
              });
          },
          open: function (){
               $("#ulozenka").show();
               $(".backModal").show();
          }
    };

    var zasilkovna = {
      init: function () {
            bindOpenWidgetElements();

            if( $("span[dopravne_ext='20']").find("input").is(':checked')) {            

                $(".packeta-selector-branch-desc").val("Zásilkovna");

                $("span[dopravne_ext='20']").append(" <a class='_pobocka packeta-selector-branch-name'>Vyberte pobočku</a>");
                if( localStorage.getItem("zasilkovna-id") ) {
                    $(".packeta-selector-branch-name").val( localStorage.getItem("zasilkovna-name") );
                    $(".packeta-selector-branch-id").val( localStorage.getItem("zasilkovna-id") );
                    $("._pobocka").html( localStorage.getItem("zasilkovna-name") + " (změnit)" );
                }

            };

            if( $("span[dopravne_ext='20']").find("input").is(':checked') && $("._pobocka").text() === "Vyberte pobočku" ) {
                $(".packeta-selector-branch-desc").val("Zásilkovna");
                $("._zasilkovnaOpen").click();

            };

            $("._pobocka").click( function (){
                        $("._zasilkovnaOpen").click();
            });

      }
    }

    var parcelshop = {
      init: function () {
            if( $("span[dopravne_ext='30']").find("input").is(':checked')) {
                $(".parcelshop-selector-branch-desc").val("PPL Parcelshop");
                $("span[dopravne_ext='30']").append(" <a class='_pobockaPPL modal-button parcelshop-selector-branch-name'>Vyberte pobočku</a>");
                if( localStorage.getItem("parcelshop-id") ) {                    
                    $(".parcelshop-selector-branch-name").val( localStorage.getItem("parcelshop-name") );
                    $(".parcelshop-selector-branch-id").val( localStorage.getItem("parcelshop-id") );                    
                    $("._pobockaPPL").html( localStorage.getItem("parcelshop-name") + " (změnit)" );
                }
                // Get the modal elements
                        var modalOverlay = document.querySelector(".modal-overlay");
                        var modalBox = document.querySelector(".modal-box");
                        var closeButton = document.querySelector("#close-modal-button");

                        // Get the button that opens the modal
                        var modalButton = document.querySelector(".modal-button");

                        // When the user clicks the button, show the modal
                        modalButton.addEventListener("click", function () {
                            $('body').css('overflow', 'hidden');
                            modalOverlay.style.display = "block";
                            modalBox.style.display = "block";

                            // Create a link element to load the main.css file
                            var link = document.createElement("link");
                            link.rel = "stylesheet";
                            link.href = "https://www.ppl.cz/sources/map/main.css";
                            
                            // Create a script element to load the main.js file
                            var script = document.createElement("script");
                            script.src = "https://www.ppl.cz/sources/map/main.js";

                            // Add the script+href link to the document head
                            document.head.appendChild(link);
                            document.head.appendChild(script);
                        });

                        // When the user clicks the close button, hide the modal
                        closeButton.addEventListener("click", function () {
                            $('body').css('overflow', 'auto');
                            modalOverlay.style.display = "none";
                            modalBox.style.display = "none";
                        });
                        
                        document.addEventListener("ppl-parcelshop-map",(event) => {
                            // Zde je mozne ziskat data parcelshopu skrze atribut event.detail
                            $('body').css('overflow', 'auto');
                            modalOverlay.style.display = "none";
                            modalBox.style.display = "none";
                            localStorage.setItem("parcelshop-id", event.detail.code );
                            localStorage.setItem("parcelshop-name", event.detail.title );
                            $(".parcelshop-selector-branch-name").val( event.detail.title );
                            $(".parcelshop-selector-branch-id").val( event.detail.code );
                            $("._pobockaPPL").html( event.detail.title + " (změnit)" );
                        }
                        );
            };
            if( $("span[dopravne_ext='30']").find("input").is(':checked') && $("._pobockaPPL").text() === "Vyberte pobočku" ) {
                $(".packeta-selector-branch-desc").val("PPL Parcelshop");
                // Get the modal elements
                        var modalOverlay = document.querySelector(".modal-overlay");
                        var modalBox = document.querySelector(".modal-box");
                        var closeButton = document.querySelector("#close-modal-button");

                        $('body').css('overflow', 'hidden');
                        modalOverlay.style.display = "block";
                        modalBox.style.display = "block";

                        // Create a link element to load the main.css file
                        var link = document.createElement("link");
                        link.rel = "stylesheet";
                        link.href = "https://www.ppl.cz/sources/map/main.css";
                            
                        // Create a script element to load the main.js file
                        var script = document.createElement("script");
                        script.src = "https://www.ppl.cz/sources/map/main.js";

                        // Add the script+href link to the document head
                        document.head.appendChild(link);
                        document.head.appendChild(script);                                                

            };
      }
    }

    function pageLoad() {
        $( ".form-datepicker" ).datepicker({
            dateFormat: 'dd.mm.yy',
            showOn: "both",
            buttonImage: "/App_Firma/Images/calendar.png",
            buttonImageOnly: true,
            buttonText: '<%: ZASutility.MyUtility.GetLangResource("SelectDate")%>',
            minDate: 0
        });

        $("._validate").click( function (e){

            if( !($("span[dopravne_ext='10']").find("input").is(':checked') || $("span[dopravne_ext='20']").find("input").is(':checked') || $("span[dopravne_ext='30']").find("input").is(':checked'))) {

                $(".ulozenka-selector-branch-desc, .packeta-selector-branch-desc, .parcelshop-selector-branch-desc").val("");
                $(".ulozenka-selector-branch-id, .packeta-selector-branch-id, .parcelshop-selector-branch-id").val("");
                $(".ulozenka-selector-branch-name, .packeta-selector-branch-name, .parcelshop-selector-branch-name").val("");
                $(".ulozenka-selector-branch-country, .packeta-selector-branch-country, .parcelshop-selector-branch-country").val("");

                 $("._continue").trigger("click");

            } else if( $("span[dopravne_ext='10']").find("input").is(':checked') && $("._pobockaUlozenka").text() === "Vyberte pobočku") {

                        $(".ulozenka-selector-branch-desc").val("Uloženka");
                        $("._zasilkovnaUlozenka").show();
                        setTimeout( function (){
                            ulozenka.open();
                             $("._zasilkovnaUlozenka").hide();
                        }, 2000);

            } else if( $("span[dopravne_ext='20']").find("input").is(':checked') && $("._pobocka").text() === "Vyberte pobočku") {

                        $(".packeta-selector-branch-desc").val("Zásilkovna");
                        $("._zasilkovnaUlozenka").show();
                        setTimeout( function (){
                                              $("._zasilkovnaOpen").click();
                                                 $("._zasilkovnaUlozenka").hide();
                                            }, 2000);
            } else if( $("span[dopravne_ext='30']").find("input").is(':checked') && $("._pobockaPPL").text() === "Vyberte pobočku") {

                        $(".parcelshop-selector-branch-desc").val("PPL Parcelshop");
                        setTimeout( function (){
                            $("._pobockaPPL").click();
                            $("._zasilkovnaUlozenka").hide();                             
                        }, 2000);
            } else {
                $("._continue").trigger("click");
            }

        });
        if( $("span[dopravne_ext='10']").length > 0) {
           ulozenka.getSelect();
           ulozenka.init();
        }

        if( $("span[dopravne_ext='20']").length > 0) {
            zasilkovna.init();
        }

        if( $("span[dopravne_ext='30']").length > 0) {
            parcelshop.init();
        }

    }

</script>

<br />
<div class="pageCustomError _zasilkovnaUlozenka"><p>Prosím vyberte pobočku</p></div>
<asp:Panel ID="pErrorMessage" runat="server" CssClass="pageCustomError" Visible="false" />

<div class="row">
    <div class="col-md-6">
        <!-- doprava -->

        <div class="orderWayDel order-box">
            <h2 class="h1"><asp:Literal ID="lAlreadyRegistered" runat="server" Text="<%$ Resources: Resource, WayOfDelivery %>" /></h2>
            <p><asp:Literal ID="lAlreadyRegisteredDescription" runat="server" Text="<%$ Resources: Resource, WayOfDeliveryDesc %>" /></p>
            <div class="RegForm">
                <div class="formRow">
                    <!-- delivery -->
                    <div class="payment order-payment">
                        <asp:RadioButtonList ID="rblWayOfDelivery" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rblWayOfDelivery_SelectedIndexChanged" />
                        <asp:PlaceHolder ID="phWayOfDelivery" runat="server" />
                    </div>
                    <!-- /delivery -->
                </div>


            </div>

        </div>
        <!-- FIXME inputy zasilkovna ulozenka -->
        <a class="packeta-selector-open _zasilkovnaOpen">Zásilkovna</a>

        <input runat="server" id="uz_branch_desc" type="hidden" class="packeta-selector-branch-desc ulozenka-selector-branch-desc parcelshop-selector-branch-desc" />
        <input runat="server" id="uz_branch_id" type="hidden" class="packeta-selector-branch-id ulozenka-selector-branch-id parcelshop-selector-branch-id" />
        <input runat="server" id="uz_branch_name" type="hidden" class="packeta-selector-branch-name ulozenka-selector-branch-name parcelshop-selector-branch-name" />
        <input runat="server" id="uz_branch_country" type="hidden" class="packeta-selector-branch-country ulozenka-selector-branch-country parcelshop-selector-branch-country" />
        <!-- /doprava -->
    </div>
    <div class="col-md-6">
        <!-- platba -->
        <div class="orderWayPay order-box">
            <h2 class="h1"><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources: Resource, WayOfPayment %>" /></h2>
            <p><asp:Literal ID="Literal2" runat="server" Text="<%$ Resources: Resource, WayOfPaymentDesc %>" /></p>

            <div class="RegForm">
                <div class="formRow">
                    <!-- payment -->
                    <div class="payment order-payment">
                        <asp:RadioButtonList ID="rblWayOfPayment" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rblWayOfPayment_SelectedIndexChanged" />

                        <asp:PlaceHolder ID="phWayOfPayment" runat="server" />
                    </div>
                    <!-- /payment -->
                </div>


            </div>

        </div>
        <!-- /platba -->
    </div>
</div>



<!-- bonus -->
<asp:Panel ID="PaymentByBonusPanel" runat="server" CssClass="orderWayPay order-box">
    <h2 class="h1"><asp:Literal ID="Literal3" runat="server" Text="<%$ Resources: Resource, WayOfPaymentByBonus %>" /></h2>
    <p><asp:Literal ID="Literal4" runat="server" Text="<%$ Resources: Resource, WayOfPaymentByBonusDesc %>" /></p>

    <div class="RegForm">
	    <div class="formRow">
			<!-- payment -->
			<div class="payment">
                <asp:CheckBox ID="cbxPaymentByBonusBonus" runat="server" />
                <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources: Resource, WayOfPaymentByBonusAgree %>" />:
                <strong><asp:Literal ID="lPaymentByBonusBonus" runat="server" /></strong>

			</div>
			<!-- /payment -->
		</div>


    </div>

</asp:Panel>
<!-- /bonus -->

<!-- slevovy kod -->
<div class="orderWayDel order-box">
    <h2 class="h1"><asp:Literal ID="Literal8" runat="server" Text="<%$ Resources: Resource, DiscountCodeLabel %>" /></h2>
    <p>
        <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources: Resource, DiscountCodeDesc1 %>" />
        <br />
        <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources: Resource, DiscountCodeDesc2 %>" />
    </p>

    <div class="RegFormDiscount">
        <div class="message_discount"><div><%: ZASutility.MyUtility.GetLangResource("WrongDiscountCodeSeted",String.Empty,"Zadali jste špatný slevový kód.") %></div></div>
        <zas:ZasTextBox ID="DiscountCode" runat="server" DetailMode="Insert" Width="" CssClass="form-control hidden discountCodeContainer" />
        <input type="text" class="discountCode" />
    </div>


</div>
<!-- /slevovy kod -->

<!-- ostatni -->
<asp:Panel ID="Panel2" runat="server" CssClass="orderReg stats order-box">
        <h2 class="h1"><asp:Literal ID="Literal6" runat="server" Text="<%$ Resources: Resource, OtherOrderData %>" /></h2>
        <p><asp:Literal ID="Literal7" runat="server" Text="<%$ Resources: Resource, OtherOrderDataDesc %>" /></p>

        <asp:Panel ID="panelKomplet" runat="server" CssClass="RegForm">
            <span class="formLabel help">
                <asp:Label ID="lKomplet" runat="server" Text='Chci dodat kompletní objednávku'></asp:Label>
				<span class="questionmark"></span>
            </span>
            <asp:CheckBox ID="cbxKomplet" runat="server" />
            <ajax:BalloonPopupExtender ID="pce_Komplet" runat="server"
                TargetControlID="lKomplet" BalloonPopupControlID="lKompletToolTip"
                Position="Auto" BalloonStyle="Rectangle" BalloonSize="Small" UseShadow="false" ScrollBars="Auto"
                CustomCssUrl="" CustomClassName=""
                DisplayOnMouseOver="false" DisplayOnFocus="false" DisplayOnClick="true" />
            <asp:Label ID="lKompletToolTip" runat="server" Text="<%$ Resources: Resource, CreateOrderKompletToolTip %>"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="panelOrderNumber" runat="server" CssClass="RegForm">
            <span class="formLabel help">
                <asp:Label ID="lOrderNumber" runat="server" Text='Vaše číslo objednávky:'></asp:Label>
				<span class="questionmark"></span>
            </span>
            <zas:ZasTextBox ID="cislo_obj" runat="server" DetailMode="Insert" MaxLength="20" CssClass="form-control" />
            <ajax:BalloonPopupExtender ID="bpe_OrderNumber" runat="server"
                TargetControlID="lOrderNumber" BalloonPopupControlID="lOrderNumberToolTip"
                Position="Auto" BalloonStyle="Rectangle" BalloonSize="Small" UseShadow="false" ScrollBars="Auto"
                CustomCssUrl="" CustomClassName=""
                DisplayOnMouseOver="false" DisplayOnFocus="false" DisplayOnClick="true" />
            <asp:Label ID="lOrderNumberToolTip" runat="server" Text="<%$ Resources: Resource, CreateOrderYoursOrderNumberToolTip %>"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="panelDateOfDelivery" runat="server" CssClass="RegForm">
            <span class="formLabel help">
                <asp:Label ID="lDateOfDelivery" runat="server" Text='Požadované datum dodání:'></asp:Label>
				<span class="questionmark"></span>
            </span>
            <zas:ZasTextBox ID="dat_dodani" runat="server" DetailMode="Insert" Width="100" MaxLength="10" Type="Date" CssClass="form-control form-datepicker" />
            <asp:Image ID="iDateOfDelivery" runat="server" ImageUrl="~/App_Firma/Images/calendar.png" Visible="false" />
            <ajax:CalendarExtender ID="ceDateOfDelivery" runat="server"
                TargetControlID="dat_dodani"
                CssClass="MyCalendar"
                Format="dd.MM.yyyy" TodaysDateFormat="dd. MMMM yyyy" EndDate="1/1/2999"
                PopupButtonID="iDateOfDElivery"
                PopupPosition="BottomLeft"
                Enabled="false" />
            <ajax:FilteredTextBoxExtender ID="ftbeDateOfDelivery" runat="server" TargetControlID="dat_dodani" FilterType="Custom, Numbers" ValidChars="." />
            <ajax:BalloonPopupExtender ID="bpe_DateOfDelivery" runat="server"
                TargetControlID="lDateOfDelivery" BalloonPopupControlID="lDateOfDeliveryToolTip"
                Position="Auto" BalloonStyle="Rectangle" BalloonSize="Small" UseShadow="false" ScrollBars="Auto"
                CustomCssUrl="" CustomClassName=""
                DisplayOnMouseOver="false" DisplayOnFocus="false" DisplayOnClick="true" />
            <asp:RequiredFieldValidator ID="rfvDateOfDelivery" runat="server" Enabled="false"
                ErrorMessage="<%$ Resources: Resource, RequiredItem %>" ValidationGroup="continue"
                ControlToValidate="dat_dodani" />

            <asp:Label ID="lDateOfDeliveryToolTip" runat="server" Text="<%$ Resources: Resource, CreateOrderDateOfDeliveryToolTip %>"></asp:Label>
            <asp:Label ID="extCondDateOfDelivery" runat="server" Visible="false" />
        </asp:Panel>

        <asp:Panel ID="panelDescription" runat="server" CssClass="RegForm">
            <span class="formLabel">
                <asp:Label ID="lDescription" runat="server" Text="<%$ Resources: Resource, 	CreateOrderYoursDescription %>"></asp:Label>
            </span>
            <zas:ZasTextBox ID="poznamka" runat="server" DetailMode="Insert" MaxLength="255" Type="Text" TextMode="MultiLine" Rows="3" Columns="40" CssClass="form-control" />
        </asp:Panel>
</asp:Panel>
<!-- /ostatni -->

<div class="cartButtons order-buttons">
    <asp:HyperLink ID="hpBack" runat="server" NavigateUrl="<%$ Resources: Resource, PageDefaultForUrl %>" Text="Zpět k nákupu"  CssClass="btn btn-default" />
    <asp:Button ID="btnBackBottom" runat="server"
        Text="<%$ Resources: Resource, StepBack %>" CssClass="button btn btn-default"
        OnClick="btnBack_Click" />    

    <asp:Button ID="btnContinueBottom" runat="server"
        Text="<%$ Resources: Resource, BtnContinue %>" CssClass="button btn btn-basic _continue" ValidationGroup="continue"
        OnClick="btnContinue_Click" />
</div>
</asp:Panel>

<script>
            var packetaSelectorOpen = '.packeta-selector-open';
            var packetaSelectorBranchName = '.packeta-selector-branch-name';
            var packetaSelectorBranchId = '.packeta-selector-branch-id';
            var packetaPrimaryButtonColor = '#39b54a';
            var packetaBackgroundColor = '#ffffff';
            var packetaFontColor = '#555555';
            var packetaFontFamily = 'Arial';
</script>
<!-- packeta key-->
<script src="/App_Firma/js/packetaWidget.min.js" data-api-key='<%: ZASutility.MyUtility.GetSession("zasilkovna_api_key") %>'></script>