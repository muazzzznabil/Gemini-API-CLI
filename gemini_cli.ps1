Write-Host "Gemini CLI Loaded!"


$envFilePath = "c:\Users\muazg\OneDrive\Desktop\Collection of Junk\Gemini CLI\.env"
if (Test-Path $envFilePath) {
    $envContent = Get-Content $envFilePath | ForEach-Object {
        if ($_ -match "^GEMINI_API_KEY\s*=\s*(.+)$") {
            $matches[1]
        }
    }
    $apiKey = $envContent.Trim()
} else {
    Write-Host "Error: .env file not found at $envFilePath" -ForegroundColor Red
    return
}

function gemini($query) {
    $url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey"

    $body = @{
        contents = @(
            @{
                parts = @(@{ text = "Based on this prompt reply : $query ,
                STRICT RULES:
                1. the reply should be cli friendly
                2. Reply as if you are Chatbot, a large language model trained by Google.
                3. dont say  formatted for CLI readability and in the style of a professional Customer Service Agent:
                
                "  })
            }
        )
    } | ConvertTo-Json -Depth 10

    $headers = @{
        "Content-Type" = "application/json"
    }

    try {
       
        $response = Invoke-RestMethod -Uri $url -Method Post -Headers $headers -Body $body

        # ! FOR DEBUGGING
        # Write-Host "Raw Response:" -ForegroundColor Yellow
        # Write-Host ($response | ConvertTo-Json -Depth 10)

       
        if ($response -and $response.candidates -and $response.candidates[0].content.parts -and $response.candidates[0].content.parts[0].text) {
            $result = $response.candidates[0].content.parts[0].text
            Write-Host "Response: $result"
        } else {
            Write-Host "Error: Unexpected response structure or empty response." -ForegroundColor Red
        }
    } catch {
       
        Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    }
}