<?php

/**
 *  IAM_CSVDump A class form performing a query dump and sending it to the browser or setting it or download.
 *  @package    iam_csvdump
 */

 /**
 *  IAM_CSVDump A class form performing a query dump and sending it to the browser or setting it or download.
 *  @author     Iván Ariel Melgrati <phpclasses@imelgrat.mailshell.com>
 *  @package    iam_csvdump
 *  @version 1.0
 *
 *  IAM_CSVDump A class form performing a query dump and sending it to the browser or setting it or download.
 *
 *  Browser and OS detection for appropriate handling of download and EOL chars.
 *
 *  Requires PHP v 4.0+ and MySQL 3.23+. Some portions taken from the CSV_UTIL_CLASS by Andrej Arn <andrej@blueshoes.org>.
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public
 *  License as published by the Free Software Foundation; either
 *  version 2 of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 */


 include '/interface/constants.php';


class iam_csvdump
{

    /**
    * @desc Takes an array and creates a csv string from it.
    *
    * @access public
    * @param  Array  $array (see below)
    * @param  String $separator Field separator ()default is ';')
    * @param  String $trim  If the cells should be trimmed , default is 'both'. It can also be 'left', 'right' or 'both'. 'none' makes it faster since omits many function calls.
    * @param  Boolean   $removeEmptyLines (default is TRUE. removes "lines" that have no value, would come out empty.)
    * @return String A CSV String. It returns an empty string if there Array is empty (NULL)
    * @todo Add param "fill to fit max length"?
    */
    public function arrayToCsvString($array, $separator=';', $trim='both', $removeEmptyLines=TRUE)
    {
    if (!is_array($array) || empty($array)) return '';

    switch ($trim) {
      case 'none':
        $trimFunction = FALSE;
        break;
      case 'left':
        $trimFunction = 'ltrim';
        break;
      case 'right':
        $trimFunction = 'rtrim';
        break;
      default: //'both':
        $trimFunction = 'trim';
        break;
    }
    $ret = array();
    reset($array);
    if (is_array(current($array))) {
      while (list(,$lineArr) = each($array)) {
        if (!is_array($lineArr)) {
          //Could issue a warning ...
          $ret[] = array();
        } else {
          $subArr = array();
          while (list(,$val) = each($lineArr)) {
            $val      = $this->_valToCsvHelper($val, $separator, $trimFunction);
            $subArr[] = $val;
          }
        }
        $ret[] = join($separator, $subArr);
      }

      return join("\n", $ret);
    } else {
      while (list(,$val) = each($array)) {
        $val   = $this->_valToCsvHelper($val, $separator, $trimFunction);
        $ret[] = $val;
      }

      return join($separator, $ret);
    }
    }

    /**
    * @desc Works on a string to include in a csv string.
    * @access private
    * @param  String $val
    * @param  String $separator
    * @param  Mixed  $trimFunction If the cells should be trimmed , default is 'both'. It can also be 'left', 'right' or 'both'. 'none' makes it faster since omits many function calls.
    * @return String
    * @see    arrayToCsvString()
    */
    public function _valToCsvHelper($val, $separator, $trimFunction)
    {
    if ($trimFunction) $val = $trimFunction($val);
    //If there is a separator (;) or a quote (") or a linebreak in the string, we need to quote it.
    $needQuote = FALSE;
    // Change to always quote
    $needQuote = TRUE;
    do {
      if (strpos($val, '"') !== FALSE) {
        $val = str_replace('"', '""', $val);
        $needQuote = TRUE;
        break;
      }
      if (strpos($val, $separator) !== FALSE) {
        $needQuote = TRUE;
        break;
      }
      if ((strpos($val, "\n") !== FALSE) || (strpos($val, "\r") !== FALSE)) { // \r is for mac
        $needQuote = TRUE;
        break;
      }
    } while (FALSE);

    if ($needQuote) {
      $val = '"' . $val . '"';
    }

    return $val;
    }

    /**
    * @desc Define EOL character according to target OS
    * @access private
    * @return String A String containing the End Of Line Sequence corresponding to the client's OS
    */
    public function _define_newline()
    {
         $unewline = "\r\n";

         if (strstr(strtolower($_SERVER["HTTP_USER_AGENT"]), 'win')) {
            $unewline = "\r\n";
         } elseif (strstr(strtolower($_SERVER["HTTP_USER_AGENT"]), 'mac')) {
            $unewline = "\r";
         } else {
            // $unewline = "\n";
         }

         return $unewline;
    }

    /**
    * @desc Define the client's browser type
    * @access private
    * @return String A String containing the Browser's type or brand
    */
    public function _get_browser_type()
    {
        $USER_BROWSER_AGENT="";

        if (preg_match('/OPERA/i', strtoupper($_SERVER["HTTP_USER_AGENT"]))) {
            $USER_BROWSER_AGENT='OPERA';
        } elseif (preg_match('/MSIE/i',strtoupper($_SERVER["HTTP_USER_AGENT"]))) {
            $USER_BROWSER_AGENT='IE';
        } elseif (preg_match('/OMNIWEB/i', strtoupper($_SERVER["HTTP_USER_AGENT"]))) {
            $USER_BROWSER_AGENT='OMNIWEB';
        } elseif (preg_match('/MOZILLA/i', strtoupper($_SERVER["HTTP_USER_AGENT"]))) {
            $USER_BROWSER_AGENT='MOZILLA';
        } elseif (preg_match('/FIREFOX/i', strtoupper($_SERVER["HTTP_USER_AGENT"]))) {
            $USER_BROWSER_AGENT='FIREFOX';
        } elseif (preg_match('/KONQUEROR/i', strtoupper($_SERVER["HTTP_USER_AGENT"]))) {
            $USER_BROWSER_AGENT='KONQUEROR';
        } elseif (preg_match('/CHROME/i', strtoupper($_SERVER["HTTP_USER_AGENT"]))) {
            $USER_BROWSER_AGENT='CHROME';
        } else {
            $USER_BROWSER_AGENT='OTHER';
        }

        return $USER_BROWSER_AGENT;
    }

    /**
    * @desc Define MIME-TYPE according to target Browser
    * @access private
    * @return String A string containing the MIME-TYPE String corresponding to the client's browser
    */
    public function _get_mime_type()
    {
        $USER_BROWSER_AGENT= $this->_get_browser_type();

        $mime_type = ($USER_BROWSER_AGENT == 'IE' || $USER_BROWSER_AGENT == 'OPERA')
                       ? 'application/octetstream'
                       : 'application/octet-stream';

        return $mime_type;
    }

    /**
    * @desc Generates a CSV File from an SQL String (and outputs it to the browser)
    * @access private
    * @param  String $dbname Name of the Database
    * @param  String $user User to Access the Database
    * @param  String $password Password to Access the Database
    * @param  String $host Name of the Host holding the DB
    */

    public function _db_connect($dbname="mysql", $user="root", $password="", $host="localhost")
    {
      $result = pg_connect("host=$host port=5432 dbname=$dbname user=$user password=$password");
      if (!$result) {     // If no connection, return 0

       return false;
      }

      return $result;
    }


    public function _db_connect_mysql($dbname = "mysql", $user = "root", $password = "", $host = "localhost")
    {
        $conn = @mysqli_connect($host, $user, $password, $dbname);
        if (!$conn) {
            return false; // Connection failed
        }
        return $conn; // Return the connection object
    }

    /**
    * @desc Generates a CSV File from an SQL String (and outputs it to the browser)
    * @access private
    * @param  String $query_string An SQL statement (usually a SELECT statement)
    * @param  String $dbname Name of the Database
    * @param  String $user User to Access the Database
    * @param  String $password Password to Access the Database
    * @param  String $host Name of the Host holding the DB
    */
    /******* #################################### SEE FONCTION BELOW *****/
    public function db_fetch_array ($result, $row = NULL, $result_type = PGSQL_ASSOC)
    {
       $return = @pg_fetch_array ($result, $row, $result_type);

       return $return;
    }

    public function _generate_csv($query_string, $dbname="mysql", $user="root", $password="", $host="localhost")
    {
      if(!$conn= $this->_db_connect($dbname, $user , $password, $host))
          die("Error. Cannot connect to Database.");
      else {
    $result = pg_query($conn, $query_string);
        if (!$result) {
        die("Could not perform the Query: ".pg_ErrorMessage($result));
        } else {
            $file = "";
            $crlf = $this->_define_newline();
        while ($str= @pg_fetch_array($result,NULL, PGSQL_NUM)) {
                $file .= $this->arrayToCsvString($str,",").$crlf;
            }
            echo $file;
        }
      }
    }

    public function _generate_csv_mysql($query_string, $dbname = "mysql", $user = "root", $password = "", $host = "localhost")
    {
    // Connect to the database
    $conn = $this->_db_connect_mysql($dbname, $user, $password, $host);
    if (!$conn) {
        die("Error. Cannot connect to Database.");
    }

    

    // Execute the query
    $result = @mysqli_query($conn, $query_string);
    if (!$result) {
        die("Could not perform the Query: " . mysqli_error($conn));
    }

    // Get Constants for changing flags to value

    $cardstatus_list = Constants::getCardStatus_List();

    $terminatecauseid = array();
    $terminatecauseid["1"] = array( gettext("ANSWER"), "1");
    $terminatecauseid["2"] = array( gettext("BUSY"), "2");
    $terminatecauseid["3"] = array( gettext("NOANSWER"), "3");
    $terminatecauseid["4"] = array( gettext("CANCEL"), "4");
    $terminatecauseid["5"] = array( gettext("CONGESTION"), "5");
    $terminatecauseid["6"] = array( gettext("CHANUNAVAIL"), "6");
    $terminatecauseid["7"] = array( gettext("DONTCALL"), "7");
    $terminatecauseid["8"] = array( gettext("TORTURE")	, "8");
    $terminatecauseid["9"] = array( gettext("INVALIDARGS"), "9");

    $list_calltype = array ();
    $list_calltype ["0"] = array (gettext("STANDARD"), "0" );
    $list_calltype ["1"] = array (gettext("SIP/IAX"), "1" );
    $list_calltype ["2"] = array (gettext("DIDCALL"), "2" );
    $list_calltype ["3"] = array (gettext("DID_VOIP"), "3" );
    $list_calltype ["4"] = array (gettext("CALLBACK"), "4" );
    $list_calltype ["5"] = array (gettext("PREDICT"), "5" );
    $list_calltype ["6"] = array (gettext("AUTO DIALER"), "6" );
    $list_calltype ["7"] = array (gettext("DID-ALEG"), "7" );

    $file = "";
    $crlf = $this->_define_newline();

    // Get column names to find the index of 'status'
    $fields = mysqli_fetch_fields($result);
    $headers = [];

    // added headers to the column
    foreach ($fields as $field) {
        $headers[] = $field->name;
    }

    // Add headers to the file content
    $file .= $this->arrayToCsvString($headers, ",") . $crlf;

    $status_index = -1;
    $terminatecauseid_index = -1;
    $list_calltype_index = -1;
    
    // searched for index of flags to change the value from flag to real value
    foreach ($fields as $index => $field) {
      
        if (strcasecmp($field->name, "status") == 0) {
            $status_index = $index;
        }
        if (strcasecmp($field->name, "terminatecauseid") == 0) {
            $terminatecauseid_index = $index;
        }
        if (strcasecmp($field->name, "sipiax") == 0) {
            $list_calltype_index = $index;
        }
    }

    // $file .= $this->arrayToCsvString($headers, ",") . $crlf;

    while ($row = @mysqli_fetch_array($result, MYSQLI_NUM)) {
        // Replace 'status' column value
        if ($status_index != -1 && isset($cardstatus_list[$row[$status_index]])) {
            $row[$status_index] = $cardstatus_list[$row[$status_index]][0]; // Use the status text
        }
    
        // Replace 'terminatecauseid' column value
        if ($terminatecauseid_index != -1 && isset($terminatecauseid[$row[$terminatecauseid_index]])) {
            $row[$terminatecauseid_index] = $terminatecauseid[$row[$terminatecauseid_index]][0]; // Use the terminatecause text
        }
     
    
        // Replace 'sipiax' column value
        if ($list_calltype_index != -1 && isset($list_calltype[$row[$list_calltype_index]])) {
            $row[$list_calltype_index] = $list_calltype[$row[$list_calltype_index]][0]; // Use the calltype text
        }
    
        // Convert the row to a CSV string and append it to the file content
        $file .= $this->arrayToCsvString($row, ",") . $crlf;
    }

    // Output the file content
    echo $file;

    // Free the result set and close the connection
    mysqli_free_result($result);
    mysqli_close($conn);
    }
    /*
        Function to Create XML String for the Data for Post Gre SQL
    */

    public function _generate_xml_postgre($query_string, $dbname="mysql", $user="root", $password="", $host="localhost")
    {
        /*if (strstr($_SERVER['HTTP_USER_AGENT'], 'MSIE') && isset($_SERVER['HTTPS'])) {
            header('Content-Type: text/plain');
        } else {
            header('Content-Type: application/download');
            header('Content-Disposition: attachment; filename=dump.xml');
        } */
        if (!$conn= $this->_db_connect($dbname, $user , $password, $host)) {
          die("Error. Cannot connect to Database.");
        } else {
            $result = pg_query($conn, $query_string);

            if (!$result) {
                die("Could not perform the Query: ".pg_ErrorMessage($result));
            } else {
                $file = "";
                $crlf = $this->_define_newline();
                $this->_generate_pgxml($result);
            }
        }
    }
    /*
        Function to Generate XML String for Post GreSQL
    */


    public function _generate_pgxml($result=NULL)
    {
        if (!$result) {
            return false;
        }
        echo "<?xml version=\"1.0\"";
        echo " encoding=".'"'."US-ASCII".'"';
        echo " ?>\n";
        echo "<data>\n";
        // Output header row
        $j = 0;
        echo "\t<header>\n";
        $totalFields = @pg_num_fields($result);
        for ($i=0; $i < $totalFields; $i++) {
            $name = htmlspecialchars(@pg_field_name($result, $i));
            $type = htmlspecialchars(@pg_field_type($result, $i));
            echo "\t\t<column name=\"{$name}\" type=\"{$type}\" />\n";
        }
        echo "\t</header>\n";

        echo "\t<records>\n";
        $totalRows = @pg_num_rows($result);
        for ($k=0; $k< $totalRows; $k++) {
            $j = 0;
            echo "\t\t<row>\n";
            for ($l = 0; $l < $totalFields; $l++) {
                $name = htmlspecialchars(@pg_field_name($result, $l));
                $v =  htmlspecialchars(@pg_fetch_result($result, $k, $l));
                if ($v != null) {
                    $v = htmlspecialchars($v);
                }
                echo "\t\t\t<column name=\"{$name}\"", ($v == null ? ' null="null"' : ''), ">{$v}</column>\n";
            }
            echo "\t\t</row>\n";
        }
        echo "\t</records>\n";
        echo "</data>\n";
    }

    public function _generate_xml_mysql($query_string, $dbname="mysql", $user="root", $password="", $host="localhost")
    {
        /*if (strstr($_SERVER['HTTP_USER_AGENT'], 'MSIE') && isset($_SERVER['HTTPS'])) {
            header('Content-Type: text/plain');
        } else {
            header('Content-Type: application/download');
            header('Content-Disposition: attachment; filename=dump.xml');
        } */
        if (!$conn= $this->_db_connect_mysql($dbname, $user , $password, $host)) {
            die("Error. Cannot connect to Database.");
        } else {
            $result = @mysql_query($query_string, $conn);
            if (!$result) {
              die("Could not perform the Query: ".mysql_error());
            } else {
                $file = "";
                $crlf = $this->_define_newline();

                $this->_generate_msqlxml($result);
            }
        }
    }

    public function _generate_msqlxml($result=NULL)
    {

        if (!$result) {
            return false;
        }
        echo "<?xml version=\"1.0\"";
        echo " encoding=".'"'."US-ASCII".'"';
        echo " ?>\n";
        echo "<data>\n";
        // Output header row
        $j = 0;
        echo "\t<header>\n";
        $totalFields = @mysql_num_fields($result);
        for ($i=0; $i<$totalFields; $i++) {
            $name = htmlspecialchars(@mysql_field_name($result, $i));
            $type = htmlspecialchars(@mysql_field_type($result, $i));
            echo "\t\t<column name=\"{$name}\" type=\"{$type}\" />\n";
        }
        echo "\t</header>\n";

        echo "\t<records>\n";
        $totalRows = @mysql_num_rows($result);
        while ($row = @mysql_fetch_array($result, MYSQL_NUM)) {
            $j = 0;
            echo "\t\t<row>\n";

            for ($l = 0; $l < $totalFields; $l++) {
                $name = htmlspecialchars(@mysql_field_name($result, $l));
                $v =  $row[$l];
                if ($v != null) {
                    $v = htmlspecialchars($v);
                }
                echo "\t\t\t<column name=\"{$name}\"", ($v == null ? ' null="null"' : ''), ">{$v}</column>\n";
            }
            echo "\t\t</row>\n";
        }
        echo "\t</records>\n";
        echo "</data>\n";
    }

    /**
    * @desc Generate the CSV File and send it to browser or download it as a file
    * @access public
    * @param String $query_string  An SQL statement (usually a SELECT statement)
    * @param String $filename  Filename to use when downloading the File. Default="dump". If set to "", the dump is displayed on the browser.
    * @param String $extension Extension to use when downloading the File. Default="csv"
    * @param  String $dbname Name of the Database to use
    * @param  String $user User to Access the Database
    * @param  String $password Password to Access the Database
    * @param  String $host Name of the Host holding the DB
    */
    public function dump($query_string, $filename="dump", $ext="csv", $dbname="mysql", $user="root", $password="", $host="localhost",$db_type="postgres")
    {
            $now = gmdate('D, d M Y H:i:s') . ' GMT';
            $USER_BROWSER_AGENT= $this->_get_browser_type();

            if ($filename!="") {
                 header('Content-Type: ' . $this->_get_mime_type());
                 header('Expires: ' . $now);
                 if ($USER_BROWSER_AGENT == 'IE') {
                      header('Content-Disposition: inline; filename="' . $filename . '.' . $ext . '"');
                      header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
                      header('Pragma: public');
                 } else {
                      header('Content-Disposition: attachment; filename="' . $filename . '.' . $ext . '"');
                      header('Pragma: no-cache');
                 }
                 /* Coding for the xml and csv file generation */
                 if ($ext=="csv") {
                     if ($db_type == "postgres") {
                        $this->_generate_csv($query_string, $dbname, $user, $password, $host);
                     } else {
                         $this->_generate_csv_mysql($query_string, $dbname, $user, $password, $host);
                     }
                 } elseif ($ext=="xml") {
                      if ($db_type == "postgres") {

                          $this->_generate_xml_postgre($query_string, $dbname, $user, $password, $host);
                      } else {

                          $this->_generate_xml_mysql($query_string, $dbname, $user, $password, $host);
                      }
                 }
            } else {
                 echo "<html><body><pre>";
                 echo htmlspecialchars($this->_generate_csv($query_string, $dbname, $user, $password, $host));
                 echo "</PRE></BODY></HTML>";
            }
    }
}
