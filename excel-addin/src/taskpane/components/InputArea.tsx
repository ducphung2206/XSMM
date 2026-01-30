import * as React from "react";
import { useState } from "react";
import { makeStyles, tokens, Textarea, Button } from "@fluentui/react-components";
import { Send24Regular } from "@fluentui/react-icons";

const useStyles = makeStyles({
  container: {
    display: "flex",
    gap: "5px",
    alignItems: "flex-end",
  },
  textarea: {
    flex: 1,
  },
});

interface InputAreaProps {
  onSend: (text: string) => void;
  disabled?: boolean;
}

const InputArea: React.FC<InputAreaProps> = ({ onSend, disabled }) => {
  const styles = useStyles();
  const [text, setText] = useState("");

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === "Enter" && !e.shiftKey) {
      e.preventDefault();
      handleSubmit();
    }
  };

  const handleSubmit = () => {
    if (text.trim() && !disabled) {
      onSend(text);
      setText("");
    }
  };

  return (
    <div className={styles.container}>
      <Textarea
        className={styles.textarea}
        value={text}
        onChange={(e, data) => setText(data.value)}
        onKeyDown={handleKeyDown}
        placeholder="Hỏi về công tác, giá, hoặc tính toán..."
        resize="vertical"
        disabled={disabled}
        rows={2}
      />
      <Button
        appearance="primary"
        icon={<Send24Regular />}
        onClick={handleSubmit}
        disabled={disabled || !text.trim()}
      />
    </div>
  );
};

export default InputArea;
