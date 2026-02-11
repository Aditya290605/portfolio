const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./pages/**/*.{js,jsx,ts,tsx}",
    "./components/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    screens: {
      xs: "475px",
      ...defaultTheme.screens,
    },
    colors: {
      transparent: "transparent",
      current: "currentColor",
      white: "#ffffff",
      black: "#000000",
      purple: "#8b31ff",
      red: "#cf0000",
      green: "#00ac56",
      indigo: {
        light: "#9f55ff",
        dark: "#7000ff",
      },
      gray: {
        light: {
          1: "#f0f0f0",
          2: "#dbdbdb",
          3: "#aaaaaa",
          4: "#8a8a8a",
        },
        dark: {
          1: "#323133",
          2: "#242225",
          3: "#1e1b20",
          4: "#1a171e",
          5: "#120e16",
        },
      },
      // shadcn/ui compatible color scales
      neutral: {
        50: "#fafafa",
        100: "#f5f5f5",
        200: "#e5e5e5",
        300: "#d4d4d4",
        400: "#a3a3a3",
        500: "#737373",
        600: "#525252",
        700: "#404040",
        800: "#262626",
        900: "#171717",
        950: "#0a0a0a",
      },
      zinc: {
        50: "#fafafa",
        100: "#f4f4f5",
        200: "#e4e4e7",
        300: "#d4d4d8",
        400: "#a1a1aa",
        500: "#71717a",
        600: "#52525b",
        700: "#3f3f46",
        800: "#27272a",
        900: "#18181b",
        950: "#09090b",
      },
      // CSS variable based colors for shadcn Card
      card: "hsl(var(--card))",
      "card-foreground": "hsl(var(--card-foreground))",
      "muted-foreground": "hsl(var(--muted-foreground))",
      border: "hsl(var(--border))",
    },
    fontFamily: {
      sans: ["var(--font-calibre)"],
      mono: ["var(--font-jetbrains-mono)"],
    },
    extend: {
      animation: {
        meteor: "meteor 5s linear infinite",
        spotlight: "spotlight 2s ease .75s 1 forwards",
      },
      keyframes: {
        meteor: {
          "0%": {
            transform: "rotate(215deg) translateX(0)",
            opacity: 1,
          },
          "70%": {
            opacity: 1,
          },
          "100%": {
            transform: "rotate(215deg) translateX(-500px)",
            opacity: 0,
          },
        },
        spotlight: {
          "0%": {
            opacity: 0,
            transform: "translate(-72%, -62%) scale(0.5)",
          },
          "100%": {
            opacity: 1,
            transform: "translate(-50%,-40%) scale(1)",
          },
        },
      },
    },
  },
  plugins: [],
};
