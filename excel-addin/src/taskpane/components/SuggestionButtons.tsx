import * as React from "react";
import { makeStyles, Button } from "@fluentui/react-components";
import { Search24Regular, Calculator24Regular, Money24Regular } from "@fluentui/react-icons";

const useStyles = makeStyles({
  container: {
    display: "flex",
    flexWrap: "wrap",
    gap: "8px",
    marginBottom: "10px",
  },
});

interface SuggestionButtonsProps {
  onSelect: (text: string) => void;
}

const SuggestionButtons: React.FC<SuggestionButtonsProps> = ({ onSelect }) => {
  const styles = useStyles();

  const suggestions = [
    { text: "Tìm công tác bê tông", icon: <Search24Regular /> },
    { text: "Tính khối lượng móng", icon: <Calculator24Regular /> },
    { text: "Tra đơn giá gạch", icon: <Money24Regular /> },
  ];

  return (
    <div className={styles.container}>
      {suggestions.map((s, idx) => (
        <Button
          key={idx}
          size="small"
          appearance="subtle"
          icon={s.icon}
          onClick={() => onSelect(s.text)}
        >
          {s.text}
        </Button>
      ))}
    </div>
  );
};

export default SuggestionButtons;
