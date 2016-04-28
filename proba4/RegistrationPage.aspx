<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="proba4.RegistrationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Welcome</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/MineStyleSheet.css" rel="stylesheet" />
    <link rel="shortcut icon" href="img/favicon(1).ico" />
    <link href="css/StyleSheet1.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <script src="js/JavaScript.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="js/jquery-2.1.3.min.js"></script>
    <script src="js/bootstrap.js"></script>

    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 239px;
            text-align: right;
        }
        .auto-style4 {
            width: 293px;
            text-align: center;
        }
    </style>
    <script>
        $(window).scroll(function () {
            var wScroll = $(this).scrollTop();

            $('.logo').css({
                'transform': 'translate(0px, -' + wScroll / 5 + '%)'
            });

            $('.lemon').css({
                'transform': 'translate(0px, -' + wScroll / 10 + '%)'
            });
            if (wScroll > $('.images').offset().top - ($(window).height() / 1.3)) {
                $('.columns').each(function (i) {
                    setTimeout(function () {
                        $('.columns').eq(i).addClass('is-showing');
                    }, 10 * (i + 1));
                });
            }
            if (wScroll > $('.mywindow').offset().top - $(window).height()) {
                $('.mywindow').css({ 'background-position': 'center' + (wScroll - $('.mywindow').offset().top) + 'px' })

                var opacity = (wScroll - $('.mywindow').offset().top + 400) / (wScroll / 5)
                $('.mywindow').css({ 'opacity': opacity });
            }
        })
    </script>

</head>
<body>
    <header>
        <div class="box3">
            <div class="lemon2">
            </div>
            <div class="logo2">
            </div>
        </div>
    </header>

    <form id="form1" runat="server" class="box2">
    <div>
        <strong>Registration Page
        </strong>
        <table>
            <br /><br />
            <tr>
                <td class="boxTab">Name</td>
                <td class="boxTab2">
                    <asp:TextBox ID="TextBoxName" runat="server" Width="200px" style ="border-radius: 5px 5px 5px 5px; opacity:1; box-shadow: 3px 2px 12px 3px #acadad; width: 180px; height: 26px; padding: 10px; margin:2px;"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="TextBoxName" ErrorMessage="Please enter user name" style="text-align: right; color: white; text-shadow:2px 2px 2px #504e4e; padding-left:5px; font-size: medium; font-weight:bold; "></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="boxTab">Surname</td>
                <td class="boxTab2">
                    <asp:TextBox ID="TextBoxSurname" runat="server" Width="200px" style ="border-radius: 5px 5px 5px 5px; opacity:1; box-shadow: 3px 2px 12px 3px #acadad; width: 180px; height: 26px; padding: 10px; margin:2px;"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSurname" runat="server" ControlToValidate="TextBoxSurname" ErrorMessage="Please enter surname" style="text-align: right; color: white; text-shadow:2px 2px 2px #504e4e; padding-left:5px; font-size: medium; font-weight:bold; "></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="boxTab">E-mail</td>
                <td class="boxTab2">
                    <asp:TextBox ID="TextBoxEmail" runat="server" TextMode="Email" Width="200px" style ="border-radius: 5px 5px 5px 5px; opacity:1; box-shadow: 3px 2px 12px 3px #acadad; width: 180px; height: 26px; padding: 10px; margin:2px;"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Please enter e-mail" style="text-align: right; color: white; text-shadow:2px 2px 2px #504e4e; padding-left:5px; font-size: medium; font-weight:bold; "></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="You must enter the valid e-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" style="text-align: right; color: white; text-shadow:2px 2px 2px #504e4e; padding-left:5px; font-size: medium; font-weight:bold; "></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="boxTab">Password</td>
                <td class="boxTab2">
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" Width="200px" style ="border-radius: 5px 5px 5px 5px; opacity:1; box-shadow: 3px 2px 12px 3px #acadad; width: 180px; height: 26px; padding: 10px; margin:2px;"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Please enter password" style="text-align: right; color: white; text-shadow:2px 2px 2px #504e4e; padding-left:5px; font-size: medium; font-weight:bold; "></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="boxTab">Confirm password</td>
                <td class="boxTab2">
                    <asp:TextBox ID="TextBoxConfirmPassword" runat="server" TextMode="Password" Width="200px" style ="border-radius: 5px 5px 5px 5px; opacity:1; box-shadow: 3px 2px 12px 3px #acadad; width: 180px; height: 26px; padding: 10px; margin:2px;"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPassword" runat="server" ControlToValidate="TextBoxConfirmPassword" ErrorMessage="Please confirm your password" style="text-align: right; color: white; text-shadow:2px 2px 2px #504e4e; padding-left:5px; font-size: medium; font-weight:bold; "></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidatorConfirmPassword" runat="server" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxConfirmPassword" ErrorMessage="Both paswords must be the same"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="boxTab">Country</td>
                <td class="boxTab2">
                    <asp:DropDownList ID="DropDownListCountry" runat="server" Width="200px" style ="border-radius: 5px 5px 5px 5px; opacity:1; box-shadow: 3px 2px 12px 3px #acadad; width: 180px; height: 26px; margin:2px;">
                        <asp:ListItem>Select country</asp:ListItem>
                        <asp:ListItem>United States</asp:ListItem>
                        <asp:ListItem>United Kingdom</asp:ListItem>
                        <asp:ListItem>Germany</asp:ListItem>
                        <asp:ListItem>Italy</asp:ListItem>
                        <asp:ListItem Value="Poland"></asp:ListItem>
                        <asp:ListItem>Norway</asp:ListItem>
                        <asp:ListItem>Sweden</asp:ListItem>
                        <asp:ListItem>Canada</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCountry" runat="server" ControlToValidate="DropDownListCountry" ErrorMessage="Enter country" style="text-align: right; color: white; text-shadow:2px 2px 2px #504e4e; padding-left:5px; font-size: medium; font-weight:bold; "></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="boxTab">&nbsp;</td>
                <td class="boxTab2">
                    <asp:Button ID="ButtonSubmit" runat="server" CssClass="buttonSubmit" OnClick="AddButton_click" Text="Submit" />
                    <input id="Reset1" class="buttonSubmit" type="reset" value="Reset" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="boxTab">&nbsp;</td>
                <td class="boxTab2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
                
        </table>
    
    </div>
    </form>
    <footer>
        <div class="row footer-stuff">
            <div class="columns six">
                <strong>FIND US ON</strong><br />
                <a href="#">
                    <img src="/img/IntagramIcon.png" style="width: 40px; height: 40px;" alt="Instagram" /></a>
                <a href="#">
                    <img src="/img/FacebookIcon.png" style="width: 40px; height: 40px;" alt="Facebook" /></a>
                <a href="#">
                    <img src="/img/PinterestIcon.png" style="width: 40px; height: 40px;" alt="Pinterest" /></a>
                <a href="#">
                    <img src="/img/GoogleIcon.png" style="width: 40px; height: 40px;" alt="Google" /></a>
                <a href="#">
                    <img src="/img/TwitterIcon.png" style="width: 40px; height: 40px;" alt="Tweeter" /></a>
                <p style="font-size: 11px;">
                &copy; 2016 ByteMe
            </div>

            <div class="columns six">
                <p><strong>Do you have an account?</strong> Register right now!</p>
                <form class="row2">
                        <div class="promo2">
                            <a class="window-cta3" href="#">login</a>
                            <a class="window-cta3" href="#">register</a>
                        </div>
                </form>
            </div>
        </div>
    </footer>
</body>
</html>
