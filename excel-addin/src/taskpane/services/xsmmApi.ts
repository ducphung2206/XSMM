export interface Message {
  role: "user" | "assistant";
  content: string;
  data?: any;
}

export interface ChatResponse {
  role: "assistant";
  content: string;
  data?: any;
}

const API_BASE = "/api/v1";

export async function sendChat(message: string, history: Message[]): Promise<ChatResponse> {
  try {
    const response = await fetch(`${API_BASE}/copilot/chat`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        message,
        history,
        context: {}, // Can include current selection context here
      }),
    });

    if (!response.ok) {
      throw new Error(`API Error: ${response.statusText}`);
    }

    const data = await response.json();
    return {
      role: "assistant",
      content: data.analysis || data.message || "Here is the result:",
      data: data
    };
  } catch (error) {
    console.error("Chat error:", error);
    throw error;
  }
}

export async function getSuggestions(query: string) {
  const response = await fetch(`${API_BASE}/copilot/suggestions?query=${encodeURIComponent(query)}`);
  if (!response.ok) return [];
  const data = await response.json();
  return data.results || [];
}
