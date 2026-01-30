import * as React from "react";
import { makeStyles, tokens, Body1, Button, Card, CardHeader } from "@fluentui/react-components";
import { Bot24Regular, Person24Regular, ArrowDown24Regular } from "@fluentui/react-icons";

const useStyles = makeStyles({
  container: {
    display: "flex",
    gap: "10px",
    maxWidth: "85%",
  },
  userContainer: {
    alignSelf: "flex-end",
    flexDirection: "row-reverse",
  },
  botContainer: {
    alignSelf: "flex-start",
  },
  bubble: {
    padding: "10px 14px",
    borderRadius: "12px",
    wordBreak: "break-word",
  },
  userBubble: {
    backgroundColor: tokens.colorBrandBackground,
    color: tokens.colorNeutralForegroundOnBrand,
  },
  botBubble: {
    backgroundColor: tokens.colorNeutralBackground3,
    color: tokens.colorNeutralForeground1,
  },
  markdown: {
    whiteSpace: "pre-wrap",
    lineHeight: "1.5",
  },
  jsonCard: {
    marginTop: "10px",
    borderTop: `1px solid ${tokens.colorNeutralStroke1}`,
    paddingTop: "5px"
  }
});

interface MessageProps {
  message: {
    role: "user" | "assistant";
    content: string;
    data?: any;
  };
  onInsert: (data: any) => void;
}

const ChatMessage: React.FC<MessageProps> = ({ message, onInsert }) => {
  const styles = useStyles();
  const isUser = message.role === "user";

  const handleInsert = () => {
    if (message.data) {
        onInsert(message.data);
    }
  };

  return (
    <div className={`${styles.container} ${isUser ? styles.userContainer : styles.botContainer}`}>
        {/* Avatar would go here if needed, simplified for now */}
        
        <div className={`${styles.bubble} ${isUser ? styles.userBubble : styles.botBubble}`}>
            <div className={styles.markdown}>{message.content}</div>
            
            {message.data && !isUser && (
                <div className={styles.jsonCard}>
                     <Button 
                        icon={<ArrowDown24Regular />} 
                        appearance="outline" 
                        size="small"
                        onClick={handleInsert}
                     >
                        Insert to Excel
                     </Button>
                </div>
            )}
        </div>
    </div>
  );
};

export default ChatMessage;
