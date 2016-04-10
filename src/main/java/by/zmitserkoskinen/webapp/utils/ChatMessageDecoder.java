package by.zmitserkoskinen.webapp.utils;

import javax.json.Json;
import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;
import java.io.StringReader;




public class ChatMessageDecoder implements Decoder.Text<ChatMessage>{
    @Override
    public ChatMessage decode(String message) throws DecodeException {
        ChatMessage chatMessage  = new ChatMessage();
        chatMessage.setMessage((Json.createReader(new StringReader(message)).readObject()).getString("message"));
        return chatMessage;
    }

    @Override
    public boolean willDecode(String chatMessage) {
        boolean flag = true;
        try {Json.createReader(new StringReader(chatMessage)).readObject();}
        catch (Exception e){flag = false;}
        return flag;
    }

    @Override
    public void init(EndpointConfig endpointConfig) {

    }

    @Override
    public void destroy() {

    }
}
