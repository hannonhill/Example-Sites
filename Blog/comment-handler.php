<?php
include('ws_util.php');

$name     = trim($_POST['Name']);
$message  = trim($_POST['Message']);
$pageID   = trim($_POST['PageID']);
$blockID  = trim($_POST['BlockID']);
$redirect = trim($_POST['Redirect']);

$client = new SoapClient ( "http://localhost:8080/ws/services/AssetOperationService?wsdl", array ('trace' => 1 ) );
$auth   = array ('username' => 'USERNAME', 'password' => 'PASSWORD');
$id     = array ('type' => 'block_XML', 'id' => $blockID);
$params = array ('authentication' => $auth, 'identifier' => $id);

// Read asset
$reply = $client->read($params);

if ( $reply->readReturn->success == 'true' )
{

	$asset = (array) $reply->readReturn->asset->xmlBlock;
	//print_r($asset);

	// Set data
	$xml = new SimpleXMLElement($asset['xml']);
	if ( $xml->children() )
	{
		$comment = $xml->addChild('comment');
		$comment->addAttribute('pageID', $pageID);
		$comment->addAttribute('time', time());
		$comment->addChild('name',htmlspecialchars(utf8_encode($name)));
		$comment->addChild('message',htmlspecialchars(utf8_encode($message)));
		$asset['xml'] = $xml->asXML();
	}
	else
	{
		$comments = $xml->addChild('comments');
		$comment = $comments->addChild('comment');
		$comment->addAttribute('pageID', $pageID);
		$comment->addAttribute('time', time());
		$comment->addChild('name',htmlspecialchars(utf8_encode($name)));
		$comment->addChild('message',htmlspecialchars(utf8_encode($message)));
		$asset['xml'] = $comments->asXML();
	}
	
	// Edit block
	$params = array('authentication' => $auth, 'asset' => array('xmlBlock' => $asset));
	try
	{
		$reply = $client->edit($params);
	}
	catch ( Exception $e )
	{
		//echo "<p>Problem: {$e->getMessage()}</p>";
	}
	$result = $client->__getLastResponse();
	if ( !isSuccess($result) )
	{
		//echo "<p>Error occured:".extractMessage($result)."</p>";
	}
	else
	{
		//echo "<p>Asset updated successfully.</p>";
		$id2      = array('type' => 'page', 'id' => $pageID);
		$params2  = array('authentication' => $auth, 'identifier' => $id2);
		$publish = $client->publish($params2);
	}
	//echo "<p>Done.</p>";

}
else
{
	//echo "<p>Problem occurred.</p>";
}

header("Location: {$redirect}");
exit();
?>
