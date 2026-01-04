package in.aman.expensetracker.controller;

import in.aman.expensetracker.service.ChatService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/chat")
@RequiredArgsConstructor
public class ChatController {

    private final ChatService chatService;

    @PostMapping
    public Map<String, String> chat(@RequestBody Map<String, String> body) {

        String message = body.get("message");

        if (message == null || message.trim().isEmpty()) {
            return Map.of("reply", "Please ask a valid question.");
        }

        return Map.of("reply", chatService.handleChat(message));
    }
}
