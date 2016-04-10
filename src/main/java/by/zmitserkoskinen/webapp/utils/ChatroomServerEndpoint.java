package by.zmitserkoskinen.webapp.utils;


import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@ServerEndpoint(value = "/chatroomServerEndpont", encoders = {ChatMessageEncoder.class}, decoders = {ChatMessageDecoder.class})
public class ChatroomServerEndpoint {

    private static Set<Session> chatroomUsers = Collections.synchronizedSet(new HashSet<>());

    @OnOpen
    public void handleOpen(Session userSession) {
        chatroomUsers.add(userSession);
    }

    @OnMessage
    public void handleMessage(ChatMessage incomingMessage, Session userSession) throws IOException, EncodeException {

        String username = (String) userSession.getUserProperties().get("username");
        ChatMessage outgoingMessage = new ChatMessage();
        if (username == null) {
            userSession.getUserProperties().put("username", incomingMessage.getMessage());
            outgoingMessage.setName("System");
            outgoingMessage.setMessage("You are connected as " + incomingMessage.getMessage());
            userSession.getBasicRemote().sendObject(outgoingMessage);
        } else {
            outgoingMessage.setName(username);
            outgoingMessage.setMessage(incomingMessage.getMessage());
            for (Session chatroomUser : chatroomUsers) {
                chatroomUser.getBasicRemote().sendObject(outgoingMessage);
            }
        }

    }


    @OnClose
    public void handleClose(Session userSession) {
        chatroomUsers.remove(userSession);
    }
}
