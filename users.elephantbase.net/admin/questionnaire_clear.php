<?php
  require_once "./admin.php";

  list($uid) = uc_user_login($userdata->username, $_POST["password"]);
  if ($uid > 0) {
    $mysql_link = new MysqlLink;
    $mysql_link->query("TRUNCATE TABLE {$mysql_tablepre}qn_user");
    $mysql_link->query("TRUNCATE TABLE {$mysql_tablepre}qn_answer");
    $mysql_link->query("TRUNCATE TABLE {$mysql_tablepre}qn_comments");
    $mysql_link->close();
    header("Location: close.htm#�ʾ����������");
  } else {
    header("Location: close.htm#�������");
  }
?>