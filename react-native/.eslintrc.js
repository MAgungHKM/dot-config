module.exports = {
  root: true,
  env: {
    "react-native/react-native": true,
    // es2021: true,
  },
  extends: [
    "eslint:recommended",
    "plugin:react/recommended",
    "plugin:react-native/all",
  ],
  parser: "@babel/eslint-parser",
  parserOptions: {
    ecmaFeatures: {
      jsx: true,
    },
    ecmaVersion: 12,
    sourceType: "module",
  },
  plugins: ["react", "react-native"],
  rules: {
    curly: 0,
    quotes: 0,
    "no-unused-vars": [
      "error",
      {
        argsIgnorePattern: "^_",
        varsIgnorePattern: "^_",
      },
    ],
    // "no-console": 2,
    "react-hooks/exhaustive-deps": 0,
    "react-native/no-unused-styles": 1,
    "react-native/split-platform-components": 2,
    "react-native/no-inline-styles": 0,
    'react-native/no-color-literals': 0,
    "react-native/no-raw-text": 2,
    "react-native/no-single-element-style-arrays": 2,
    "react/prop-types": 0,
    "react-native/sort-styles": 0,
    "react-native/no-raw-text": 0,
    "no-unsafe-optional-chaining": 0,
  },
};
