import * as React from "react";
import { useState, useRef, useEffect } from "react";
import {
  makeStyles,
  shorthands,
  tokens,
  Avatar,
  Body1,
  Spinner,
} from "@fluentui/react-components";
import { Send24Regular, Bot24Regular, Person24Regular } from "@fluentui/react-icons";
import ChatMessage from "./components/ChatMessage";
import InputArea from "./components/InputArea";
import SuggestionButtons from "./components/SuggestionButtons";
import { sendChat } from "./services/xsmmApi";
import { insertData } from "./services/excelService";

const useStyles = makeStyles({
  root: {
    display: "flex",
    flexDirection: "column",
    height: "100vh",
    backgroundColor: tokens.colorNeutralBackground1,
  },
  header: {
    display: "flex",
    alignItems: "center",
    padding: "10px 15px",
    borderBottom: `1px solid ${tokens.colorNeutralStroke1}`,
    backgroundColor: tokens.colorNeutralBackground2,
    gap: "10px",
  },
  chatArea: {
    flex: 1,
    overflowY: "auto",
    padding: "15px",
    display: "flex",
    flexDirection: "column",
    gap: "15px",
  },
  inputContainer: {
    padding: "15px",
    borderTop: `1px solid ${tokens.colorNeutralStroke1}`,
    backgroundColor: tokens.colorNeutralBackground2,
  },
});

interface Message {
  role: "user" | "assistant";
  content: string;
  data?: any; // For structured data like search results
}

const App: React.FC<{ title: string }> = ({ title }) => {
  const styles = useStyles();
  const [messages, setMessages] = useState<Message[]>([
    { role: "assistant", content: "Chào bạn! Tôi là XSMM Copilot. Tôi có thể giúp gì cho công việc QS của bạn hôm nay?" }
  ]);
  const [isLoading, setIsLoading] = useState(false);
  const scrollRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (scrollRef.current) {
      scrollRef.current.scrollTop = scrollRef.current.scrollHeight;
    }
  }, [messages]);

  const handleSend = async (text: string) => {
    if (!text.trim()) return;

    const userMsg: Message = { role: "user", content: text };
    setMessages(prev => [...prev, userMsg]);
    setIsLoading(true);

    try {
      // Call API
      const response = await sendChat(text, messages);
      
      const botMsg: Message = { 
        role: "assistant", 
        content: response.content,
        // Assuming API returns structured data if available
        data: response.data 
      };
      setMessages(prev => [...prev, botMsg]);
    } catch (error) {
      setMessages(prev => [...prev, { role: "assistant", content: "Xin lỗi, có lỗi xảy ra khi kết nối với server." }]);
    } finally {
      setIsLoading(false);
    }
  };

  const handleSuggestionClick = (text: string) => {
    handleSend(text);
  };

  return (
    <div className={styles.root}>
      <div className={styles.header}>
        <Avatar icon={<Bot24Regular />} color="brand" />
        <Body1><b>{title}</b></Body1>
      </div>

      <div className={styles.chatArea} ref={scrollRef}>
        {messages.map((msg, idx) => (
          <ChatMessage key={idx} message={msg} onInsert={insertData} />
        ))}
        {isLoading && <Spinner size="tiny" label="Đang suy nghĩ..." />}
      </div>

      <div className={styles.inputContainer}>
        {messages.length < 3 && (
            <SuggestionButtons onSelect={handleSuggestionClick} />
        )}
        <InputArea onSend={handleSend} disabled={isLoading} />
      </div>
    </div>
  );
};

export default App;
