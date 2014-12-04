package 
{
	import flash.net.Socket;
	import flash.events.*;
	//import flash.display.Sprite;
	
	public class ClientService  implements Service
	{
		private var serverSocket:Socket;
		private var connected:Boolean;
		private var ip:String;
		private var port:int;
		
		public function ClientService(ip:String,port:int)
		{
			this.ip = ip;
			this.port = port;
			
			serverSocket = new Socket();
			/*serverSocket.addEventListener(Event.CONNECT, connectHandler);			
			serverSocket.addEventListener(Event.CLOSE, closeHandler);
			serverSocket.addEventListener(ErrorEvent.ERROR, errorHandler);
			serverSocket.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			serverSocket.addEventListener(ProgressEvent.SOCKET_DATA, dataHandler);*/
		}
		
		public function connect():Boolean
		{
			// TODO Auto Generated method stub
			var connected:Boolean; 
			try{
				serverSocket.connect(ip,port);
				connected = serverSocket.connected;
			}catch(err:Error){
				serverSocket == null;
				connected = false;
			}
			return connected;
		}
		
		public function disconnect():void
		{
			// TODO Auto Generated method stub
			serverSocket.close();
		}
		
		public function getMsg():String
		{
			// TODO Auto Generated method stub
			var result:String = serverSocket.readUTFBytes( serverSocket.bytesAvailable);
			serverSocket.flush();
			return result;
		}
		
		public function sendMsg(Msg:String):void
		{
			// TODO Auto Generated method stub
			serverSocket.writeUTFBytes(Msg);
			serverSocket.flush(); 	
		}
		
		public function valifyOrAdd(username:String, password:String):Boolean
		{
			// TODO Auto Generated method stub
			return false;
		}
		
		public function get socket():Socket{
			return serverSocket;
		}

		
	}
}