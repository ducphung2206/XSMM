import * as React from "react";
import { createRoot } from "react-dom/client";
import App from "./App";
import { FluentProvider, webDarkTheme } from "@fluentui/react-components";

/* global document, Office, module, require */

const title = "XSMM Copilot";

const rootElement: HTMLElement | null = document.getElementById("container");
const root = rootElement ? createRoot(rootElement) : undefined;

/* Render application after Office initializes */
Office.onReady(() => {
  root?.render(
    <FluentProvider theme={webDarkTheme}>
      <App title={title} />
    </FluentProvider>
  );
});

if ((module as any).hot) {
  (module as any).hot.accept("./App", () => {
    const NextApp = require("./App").default;
    root?.render(
      <FluentProvider theme={webDarkTheme}>
        <NextApp title={title} />
      </FluentProvider>
    );
  });
}
