<?php
  require_once "./common.php";

  $type = $_GET["type"];

  $mysql_link = new MysqlLink;

  if ($type == "w" || $type == "m" || $type == "q") {
    jsWrite("<table>");
    $th0 = "<th nowrap><font size=\\\"2\\\">";
    $th1 = "</font></th>";
    $th10 = $th1 . $th0;
    jsWrite("<tr>{$th0}排名{$th10}用户名{$th10}成绩{$th1}</tr>");
    $td0 = "<td align=\\\"center\\\" nowrap><font size=\\\"2\\\">";
    $td1 = "</font></td>";
    $td10 = $td1 . $td0;
    $result = $mysql_link->query("SELECT username, score, rank FROM {$mysql_tablepre}rank{$type} " .
        "LEFT JOIN " . UC_DBTABLEPRE . "members USING (uid) ORDER BY rank LIMIT 10");
    while ($line = mysql_fetch_assoc($result)) {
      $score = $line["score"];
      jsWrite(sprintf("<tr>{$td0}%d{$td10}%s{$td10}%s{$td1}</tr>",
            $line["rank"], htmlentities($line["username"], ENT_COMPAT, "GB2312"),
            $score > 900 ? "900+" : strval($score)));
    }
    jsWrite("</table>");
  }

  $mysql_link->close();
?>