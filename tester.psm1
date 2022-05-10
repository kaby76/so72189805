# Template generated code from trgen 0.16.4
function Build-Grammar {
    $g = antlr Java8Lexer.g4 -Dlanguage=Java 
    if($LASTEXITCODE -ne 0){
        return @{
            Message = $g
            Success = $false
        }
    }
    $g = antlr Java8Parser.g4 -Dlanguage=Java 
    if($LASTEXITCODE -ne 0){
        return @{
            Message = $g
            Success = $false
        }
    }

    Write-Host "javac -cp C:/Users/Kenne/Downloads/antlr4-4.10.1-complete.jar\;. Java8Lexer.java Java8Parser.java  Program.java ErrorListener.java"
    $msg = javac -cp "C:/Users/Kenne/Downloads/antlr4-4.10.1-complete.jar;." Java8Lexer.java Java8Parser.java  Program.java ErrorListener.java
    return @{
        Message = $msg
        Success = $LASTEXITCODE -eq 0
    }
}

function Test-Case {
    param (
        $InputFile,
        $TokenFile,
        $TreeFile,
        $ErrorFile
    )
    $o = trwdog java Program -file $InputFile
    $failed = $LASTEXITCODE -ne 0
    if ($failed -and $errorFile) {
        return $true
    }
    if(!$failed -and !$errorFile){
        return $true
    }
    return $false
}