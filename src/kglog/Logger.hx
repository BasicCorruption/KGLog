package kglog;

class Logger {
  /**
   * Path of the log directory.
   */
  public static var logDir:String;
  
  /**
   * Name of the log file.
   */
  public static var logFile:String = "yyyy-mm-dd@hh:mm:ss.log";
  
  /**
   * This function literally does nothing
   */
  public function new():Void {}
  
  /**
   * Configures the logger.
   * @param  LogDir  Path of the program's log file.
   */
  public static function config(LogDir:String):Void {
    logDir = LogDir;
    
    var now = Date.now();
    var sDate = now.getFullYear() + "-" + now.getMonth() + "-" + now.getDate();
    var sTime = now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds();
    logFile = sDate + "@" + sTime + ".log";
    var p = Path.join([logDir, logFile]);
    File.saveContent(p, sDate + sTime);
  }
  
  /**
   * Send a string of text to the program's log file
   * and to the console.
   * @param  Text  String of text to log.
   */
  public static function simpleLog(Text:String):Void {
    Console.log(Text);
    
    var p = Path.join([logDir, logFile]);
    File.saveContent(p, Text);
  }
}
