<html>

<head>
<meta http-equiv="Content-Type"
content="text/html; charset=gb_2312-80">
<meta name="GENERATOR" content="Microsoft FrontPage Express 2.0">
<title>�û��б� - ������������</title>
</head>

<body bgcolor="#3869B6" topmargin="0" leftmargin="0"
bottommargin="0" rightmargin="0">

<table border="0" cellpadding="8" cellspacing="0" width="100%">
    <tr>
        <td>��</td>
        <td width="750" bgcolor="#FFFFFF"><table border="0"
        cellspacing="0" width="100%">
            <tr>
                <td background="../images/topbg.gif"><table
                border="0" width="100%">
                    <tr>
                        <td valign="bottom" nowrap><table
                        border="0">
                            <tr>
                                <td nowrap><img
                                src="../images/wizard.jpg"
                                width="64" height="64"><!--webbot
                                bot="HTMLMarkup" startspan -->&nbsp;<!--webbot
                                bot="HTMLMarkup" endspan --><font
                                color="#FFFFFF" size="6"
                                face="����">������ʦ�û�����</font></td>
                            </tr>
                        </table>
                        </td>
                        <td align="right" valign="bottom"><table
                        border="0">
                            <tr>
                                <td><p align="right"><font
                                size="5">����</font></p>
                                </td>
                            </tr>
                            <tr>
                                <td><p align="right"><img
                                src="../images/elephantbase.gif"
                                width="88" height="31"></p>
                                </td>
                            </tr>
                            <tr>
                                <td><p align="right"><font
                                color="#FFFFFF" size="2"
                                face="Arial"><strong>www.elephantbase.net</strong></font></p>
                                </td>
                            </tr>
                        </table>
                        </td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr>
                <td>��</td>
            </tr>
        </table>
        <table border="0" cellpadding="4" cellspacing="0"
        width="100%" bgcolor="#F0F0F0">
            <tr>
                <td background="../images/headerbg.gif"><font
                size="3"><strong>������������<script
                language="JavaScript"><!--
function sendmail(username, email, password) {
  var arrBody = [];
  arrBody.push(username + "�����ã�");
  arrBody.push("");
  arrBody.push("�������������ѱ�����Ϊ��" + password);
  arrBody.push("�������ô������¼��������ʦ�û����ģ�");
  arrBody.push("��������http://users.elephantbase.net/login.htm");
  arrBody.push("������¼�ɹ��������ϰ�����ĵ���");
  arrBody.push("");
  arrBody.push("������л��ʹ��������ʦ��");
  arrBody.push("");
  arrBody.push("������ʦ�û�����");
  location.href = "mailto:" + email + "?subject=�������� - ����������ʦ�û�����&body=" + arrBody.join("%0D%0A");
}
// --></script></strong></font></td>
            </tr>
            <tr>
                <td><p align="center"><!--webbot
                bot="HTMLMarkup" startspan --><?php
  require_once "./admin.php";

  $mysql_link = new MysqlLink;

  $username = $_GET["username"];
  if ($username) {
    $sql = sprintf("DELETE FROM {$mysql_tablepre}password WHERE username = '%s'",
        $mysql_link->escape($username));
    $mysql_link->query($sql);
    echo "<font size=\"2\" color=\"blue\">�û� " .
        htmlentities($username, ENT_COMPAT, "GB2312") . " ����������������ɾ��</font><br>";
  }

  $result = $mysql_link->query("SELECT username, email, password, eventip, eventtime FROM {$mysql_tablepre}password");
  $line = mysql_fetch_assoc($result);
  if ($line) {
    echo "<table border=\"1\">";
    $th0 = "<th><font size=\"2\">";
    $th1 = "</font></th>";
    $th10 = $th1 . $th0;
    echo "<tr>{$th0}�û���{$th10}Email{$th10}����{$th10}����IP{$th10}����ʱ��{$th10}&nbsp;{$th1}</tr>";
    $td0 = "<td align=\"center\"><font size=\"2\">&nbsp;";
    $td1 = "&nbsp;</font></td>";
    $td10 = $td1 . $td0;
    while ($line) {
      $username = $line["username"];
      $email = $line["email"];
      $password = $line["password"];
      echo sprintf("<tr>{$td0}%s{$td10}%s{$td10}%s{$td10}%s{$td10}%s{$td10}" .
          "<a href=\"#\" onclick=\"sendmail('%s', '%s', '%s')\">�����ʼ�</a> " .
          "<a href=\"getpassword.php?username=%s\">ɾ������</a>{$td1}</tr>",
          $mysql_link->escape($username), $mysql_link->escape($email), $password,
          $line["eventip"], date("Y-m-d H:i:s", $line["eventtime"]),
          htmlentities($username, ENT_COMPAT, "GB2312"), htmlentities($email, ENT_COMPAT, "GB2312"),
          $password, urlencode($username));
      $line = mysql_fetch_assoc($result);
    }
    echo "</table>";
  } else {
    echo "<font size=\"2\" color=\"red\">û��������������</font>";
  }
  $mysql_link->close();
?><!--webbot
                bot="HTMLMarkup" endspan --></p>
                </td>
            </tr>
            <tr>
                <td bgcolor="#E0E0E0"><p align="right"><a
                href="http://www.elephantbase.net/"
                target="_blank"><font color="#000060" size="2">��Ȩ����</font><font
                color="#000060">&copy;</font><font
                color="#000060" size="2" face="Times New Roman">2004-2009
                </font><font color="#000060" size="2">����ٿ�ȫ��</font></a><font
                color="#000060" size="2"> </font><a
                href="http://www.miibeian.gov.cn/"
                target="_blank"><font color="#000060" size="2">��</font><font
                color="#000060" size="2" face="Times New Roman">ICP</font><font
                color="#000060" size="2">��</font><font
                color="#000060" size="2" face="Times New Roman">05047724</font></a></p>
                </td>
            </tr>
        </table>
        </td>
        <td>��</td>
    </tr>
</table>
</body>
</html>