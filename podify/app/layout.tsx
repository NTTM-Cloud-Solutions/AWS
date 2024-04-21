import "@/styles/globals.css";
import { ThemeProvider } from "next-themes";
import { Inter as FontSans } from "next/font/google";

import { cn } from "@/lib/utils";
import Footer from "./Footer";
import NavBar from "./NavBar";

const fontSans = FontSans({
  subsets: ["latin"],
  variable: "--font-sans",
});

export default function RootLayoutProps({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" suppressHydrationWarning>
      <head />
      <body
        className={cn(
          "min-h-screen bg-background font-sans antialiased",
          fontSans.variable
        )}
      >
        <ThemeProvider
          attribute="class"
          defaultTheme="dark"
          enableSystem
          disableTransitionOnChange
        >
          <NavBar />
          <main>
            
            {children}
          </main>
          <Footer />
        </ThemeProvider>
      </body>
    </html>
  );
}
