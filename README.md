# GEMINI API @ PowerShell CLI

A simple PowerShell CLI tool to interact with the Gemini API for generating AI-powered responses. This script dynamically loads the API key from a `.env` file and sends queries to the Gemini API, returning CLI-friendly responses.

---

## ✨ Features

- Dynamically loads the API key from a `.env` file for security.
- Sends user queries to the Gemini API and retrieves responses.
- CLI-friendly output for seamless integration into terminal workflows.

---

## 📦 Installation

### 1. Clone or Download the Repository

Download or clone the repository to your local machine.

```bash
git clone https://github.com/your-username/gemini-cli.git
cd gemini-cli
```

*(Replace `https://github.com/your-username/gemini-cli.git` with your actual repository URL.)*

---

### 2. Set Up the `.env` File

Create a `.env` file in the **same directory** as the script (`gemini_cli.ps1`) and add your Gemini API key:

```dotenv
# .env
GEMINI_API_KEY=YOUR_API_KEY_HERE
```

Replace `YOUR_API_KEY_HERE` with your actual Gemini API key.

> ⚠️ **Important:** Never commit your `.env` file to version control. Add `.env` to your `.gitignore` file.

---

### 3. Add the Script to Your PowerShell Profile (Optional)

To make the `gemini` command globally available, add an alias to your PowerShell profile.

Open your PowerShell profile:

```powershell
notepad $PROFILE
```

If the file does not exist, create it:

```powershell
New-Item -Path $PROFILE -Type File -Force
```

Add the following function and alias inside your profile:

```powershell
function Invoke-Gemini {
    param(
        [Parameter(Mandatory=$true, Position=0, ValueFromRemainingArguments=$true)]
        [string[]]$Query
    )
    & "C:\path\to\your\gemini_cli.ps1" -Query ($Query -join ' ')
}

Set-Alias -Name gemini -Value Invoke-Gemini -Option AllScope
```

Replace `C:\path\to\your\gemini_cli.ps1` with the full path where you saved the script.

Save and reload your profile:

```powershell
. $PROFILE
```

Or simply restart PowerShell.

---

### 4. Test the Command

Run a simple query:

```powershell
gemini "What is the US president's name?"
```

---

## 🚀 Usage

Simply type `gemini` followed by your query in quotes:

```powershell
gemini "React vs Svelte"
```

The response will be displayed directly in the terminal.

---

## 🖼️ Example Output

Here’s an example of how the output might look:


![image](https://github.com/user-attachments/assets/ce72f30b-1356-4891-aa53-91c4ec6865fd)


---

## 🛠️ Requirements

- PowerShell 5.1 or later
- An active Gemini API key

---

## 🧩 Troubleshooting

**Error:** `.env file not found`

- Ensure the `.env` file exists in the same directory as the script and contains the correct API key.

**Error:** `Cannot index into a null array`

- This usually indicates an issue with the API response. Check your API key and ensure the Gemini API service is accessible.

---

## 📄 License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).  
See the LICENSE file for details.

---

## 🤝 Contributing

Feel free to submit issues or pull requests to improve this tool!

---
