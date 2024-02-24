#!/bin/bash
print_to_bashrc=true
while IFS="" read -r p || [ -n "$p" ]
do
    if [[ "$p" =~ "# HALT TERMINAL PRETTIFIER" ]]; then
        print_to_bashrc=false
    fi
done < ~/.bashrc
if [[ "$print_to_bashrc" == true ]]; then
    printf '\n# HALT TERMINAL PRETTIFIER\n' >> ~/.bashrc
    printf 'export PATH="/home/codespace/bin:$PATH"\n' >> ~/.bashrc
    printf 'source ~/.custom-bash-scripts/terminal-prettifier-configs.sh\n' >> ~/.bashrc
fi
mkdir ~/bin ~/.oh-my-posh-configs ~/.custom-bash-scripts
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/bin
touch ~/.custom-bash-scripts/terminal-prettifier-configs.sh
truncate -s 0 ~/.custom-bash-scripts/terminal-prettifier-configs.sh
printf '# eval "$(oh-my-posh init bash --config /home/codespace/.oh-my-posh-configs/atomic.omp.json)"\n' >> ~/.custom-bash-scripts/terminal-prettifier-configs.sh
touch ~/.oh-my-posh-configs/atomic.omp.json
truncate -s 0 ~/.oh-my-posh-configs/atomic.omp.json
printf '%s\n' '{' \
'  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",' \
'  "blocks": [' \
'    {' \
'      "alignment": "left",' \
'      "segments": [' \
'        {' \
'          "background": "#0077c2",' \
'          "foreground": "#ffffff",' \
'          "leading_diamond": "\u256d\u2500\ue0b6",' \
'          "style": "diamond",' \
'          "template": "\uf120 {{ .Name }} ",' \
'          "type": "shell"' \
'        },' \
'        {' \
'          "background": "#ef5350",' \
'          "foreground": "#FFFB38",' \
'          "style": "diamond",' \
'          "template": "<parentBackground>\ue0b0</> \uf292 ",' \
'          "type": "root"' \
'        },' \
'        {' \
'          "background": "#FF9248",' \
'          "foreground": "#2d3436",' \
'          "powerline_symbol": "\ue0b0",' \
'          "properties": {' \
'            "folder_icon": " \uf07b ",' \
'            "home_icon": "\ue617",' \
'            "style": "folder"' \
'          },' \
'          "style": "powerline",' \
'          "template": " \uf07b\uea9c{{ .Path }} ",' \
'          "type": "path"' \
'        },' \
'        {' \
'          "background": "#FFFB38",' \
'          "background_templates": [' \
'            "{{ if or (.Working.Changed) (.Staging.Changed) }}#ffeb95{{ end }}",' \
'            "{{ if and (gt .Ahead 0) (gt .Behind 0) }}#c5e478{{ end }}",' \
'            "{{ if gt .Ahead 0 }}#C792EA{{ end }}",' \
'            "{{ if gt .Behind 0 }}#C792EA{{ end }}"' \
'          ],' \
'          "foreground": "#011627",' \
'          "powerline_symbol": "\ue0b0",' \
'          "properties": {' \
'            "branch_icon": "\ue725 ",' \
'            "fetch_status": true,' \
'            "fetch_upstream_icon": true' \
'          },' \
'          "style": "powerline",' \
'          "template": " {{ .UpstreamIcon }}{{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }} \uf044 {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }}<#ef5350> \uf046 {{ .Staging.String }}</>{{ end }} ",' \
'          "type": "git"' \
'        },' \
'        {' \
'          "background": "#83769c",' \
'          "foreground": "#ffffff",' \
'          "properties": {' \
'            "style": "roundrock",' \
'            "threshold": 0' \
'          },' \
'          "style": "diamond",' \
'          "template": " \ueba2{{ .FormattedMs }}\u2800",' \
'          "trailing_diamond": "\ue0b4",' \
'          "type": "executiontime"' \
'        }' \
'      ],' \
'      "type": "prompt"' \
'    },' \
'    {' \
'      "alignment": "right",' \
'      "segments": [' \
'        {' \
'          "background": "#303030",' \
'          "foreground": "#3C873A",' \
'          "leading_diamond": "\ue0b6",' \
'          "properties": {' \
'            "fetch_package_manager": true,' \
'            "npm_icon": " <#cc3a3a>\ue5fa</> ",' \
'            "yarn_icon": " <#348cba>\ue6a7</>"' \
'          },' \
'          "style": "diamond",' \
'          "template": "\ue718 {{ if .PackageManagerIcon }}{{ .PackageManagerIcon }} {{ end }}{{ .Full }}",' \
'          "trailing_diamond": "\ue0b4 ",' \
'          "type": "node"' \
'        },' \
'        {' \
'          "background": "#306998",' \
'          "foreground": "#FFE873",' \
'          "leading_diamond": "\ue0b6",' \
'          "style": "diamond",' \
'          "template": "\ue235 {{ if .Error }}{{ .Error }}{{ else }}{{ if .Venv }}{{ .Venv }} {{ end }}{{ .Full }}{{ end }}",' \
'          "trailing_diamond": "\ue0b4 ",' \
'          "type": "python"' \
'        },' \
'        {' \
'          "background": "#0e8ac8",' \
'          "foreground": "#ffffff",' \
'          "leading_diamond": "\ue0b6",' \
'          "style": "diamond",' \
'          "template": "\ue738 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",' \
'          "trailing_diamond": "\ue0b4 ",' \
'          "type": "java"' \
'        },' \
'        {' \
'          "background": "#0e0e0e",' \
'          "foreground": "#0d6da8",' \
'          "leading_diamond": "\ue0b6",' \
'          "style": "diamond",' \
'          "template": "\ue77f {{ if .Unsupported }}\uf071{{ else }}{{ .Full }}{{ end }}",' \
'          "trailing_diamond": "\ue0b4 ",' \
'          "type": "dotnet"' \
'        },' \
'        {' \
'          "background": "#ffffff",' \
'          "foreground": "#06aad5",' \
'          "leading_diamond": "\ue0b6",' \
'          "style": "diamond",' \
'          "template": "\ue626 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",' \
'          "trailing_diamond": "\ue0b4 ",' \
'          "type": "go"' \
'        },' \
'        {' \
'          "background": "#f3f0ec",' \
'          "foreground": "#925837",' \
'          "leading_diamond": "\ue0b6",' \
'          "style": "diamond",' \
'          "template": "\ue7a8 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",' \
'          "trailing_diamond": "\ue0b4 ",' \
'          "type": "rust"' \
'        },' \
'        {' \
'          "background": "#e1e8e9",' \
'          "foreground": "#055b9c",' \
'          "leading_diamond": " \ue0b6",' \
'          "style": "diamond",' \
'          "template": "\ue798 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",' \
'          "trailing_diamond": "\ue0b4 ",' \
'          "type": "dart"' \
'        },' \
'        {' \
'          "background": "#ffffff",' \
'          "foreground": "#ce092f",' \
'          "leading_diamond": " \ue0b6",' \
'          "style": "diamond",' \
'          "template": "\ue753 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",' \
'          "trailing_diamond": "\ue0b4 ",' \
'          "type": "angular"' \
'        },' \
'        {' \
'          "background": "#1e293b",' \
'          "foreground": "#ffffff",' \
'          "leading_diamond": " \ue0b6",' \
'          "style": "diamond",' \
'          "template": "{{ if .Error }}{{ .Error }}{{ else }}Nx {{ .Full }}{{ end }}",' \
'          "trailing_diamond": "\ue0b4 ",' \
'          "type": "nx"' \
'        },' \
'        {' \
'          "background": "#945bb3",' \
'          "foreground": "#359a25",' \
'          "leading_diamond": " \ue0b6",' \
'          "style": "diamond",' \
'          "template": "<#ca3c34>\ue624</> {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",' \
'          "trailing_diamond": "\ue0b4 ",' \
'          "type": "julia"' \
'        },' \
'        {' \
'          "background": "#ffffff",' \
'          "foreground": "#9c1006",' \
'          "leading_diamond": "\ue0b6",' \
'          "style": "diamond",' \
'          "template": "\ue791 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",' \
'          "trailing_diamond": "\ue0b4 ",' \
'          "type": "ruby"' \
'        },' \
'        {' \
'          "background": "#ffffff",' \
'          "foreground": "#5398c2",' \
'          "leading_diamond": "\ue0b6",' \
'          "style": "diamond",' \
'          "template": "\uf104<#f5bf45>\uf0e7</>\uf105 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",' \
'          "trailing_diamond": "\ue0b4 ",' \
'          "type": "azfunc"' \
'        },' \
'        {' \
'          "background": "#565656",' \
'          "foreground": "#faa029",' \
'          "leading_diamond": "\ue0b6",' \
'          "style": "diamond",' \
'          "template": "\ue7ad {{.Profile}}{{if .Region}}@{{.Region}}{{end}}",' \
'          "trailing_diamond": "\ue0b4 ",' \
'          "type": "aws"' \
'        },' \
'        {' \
'          "background": "#316ce4",' \
'          "foreground": "#ffffff",' \
'          "leading_diamond": "\ue0b6",' \
'          "style": "diamond",' \
'          "template": "\uf308 {{.Context}}{{if .Namespace}} :: {{.Namespace}}{{end}}",' \
'          "trailing_diamond": "\ue0b4",' \
'          "type": "kubectl"' \
'        },' \
'        {' \
'          "background": "#b2bec3",' \
'          "foreground": "#222222",' \
'          "leading_diamond": "\ue0b6",' \
'          "properties": {' \
'            "linux": "\ue712",' \
'            "macos": "\ue711",' \
'            "windows": "\ue70f"' \
'          },' \
'          "style": "diamond",' \
'          "template": " {{ if .WSL }}WSL at {{ end }}{{.Icon}}<#222222> \ue0b2</>",' \
'          "type": "os"' \
'        },' \
'        {' \
'          "background": "#f36943",' \
'          "background_templates": [' \
'            "{{if eq \"Charging\" .State.String}}#b8e994{{end}}",' \
'            "{{if eq \"Discharging\" .State.String}}#fff34e{{end}}",' \
'            "{{if eq \"Full\" .State.String}}#33DD2D{{end}}"' \
'          ],' \
'          "foreground": "#262626",' \
'          "invert_powerline": true,' \
'          "leading_diamond": "\ue0b2",' \
'          "properties": {' \
'            "charged_icon": "\uf240 ",' \
'            "charging_icon": "\uf1e6 ",' \
'            "discharging_icon": "\ue234 "' \
'          },' \
'          "style": "diamond",' \
'          "template": " {{ if not .Error }}{{ .Icon }}{{ .Percentage }}{{ end }}{{ .Error }}\uf295 <#262626>\ue0b2</>",' \
'          "type": "battery"' \
'        },' \
'        {' \
'          "background": "#40c4ff",' \
'          "foreground": "#ffffff",' \
'          "invert_powerline": true,' \
'          "leading_diamond": "\ue0b2",' \
'          "properties": {' \
'            "time_format": "_2,15:04"' \
'          },' \
'          "style": "diamond",' \
'          "template": " \uf073 {{ .CurrentDate | date .Format }} ",' \
'          "trailing_diamond": "\ue0b4",' \
'          "type": "time"' \
'        }' \
'      ],' \
'      "type": "prompt"' \
'    },' \
'    {' \
'      "alignment": "left",' \
'      "newline": true,' \
'      "segments": [' \
'        {' \
'          "foreground": "#21c7c7",' \
'          "style": "plain",' \
'          "template": "\u2570\u2500",' \
'          "type": "text"' \
'        },' \
'        {' \
'          "foreground": "#e0f8ff",' \
'          "foreground_templates": ["{{ if gt .Code 0 }}#ef5350{{ end }}"],' \
'          "properties": {' \
'            "always_enabled": true' \
'          },' \
'          "style": "plain",' \
'          "template": "\ue285\ueab6 ",' \
'          "type": "status"' \
'        }' \
'      ],' \
'      "type": "prompt"' \
'    }' \
'  ],' \
'  "version": 2' \
'}' \
>> ~/.oh-my-posh-configs/atomic.omp.json
printf '# eval "$(oh-my-posh init bash --config /home/codespace/.oh-my-posh-configs/blueish.omp.json)"\n' >> ~/.custom-bash-scripts/terminal-prettifier-configs.sh
touch ~/.oh-my-posh-configs/blueish.omp.json
truncate -s 0 ~/.oh-my-posh-configs/blueish.omp.json
printf '%s\n' '{' \
'  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",' \
'  "blocks": [' \
'    {' \
'      "alignment": "left",' \
'      "segments": [' \
'        {' \
'          "background": "#546E7A",' \
'          "foreground": "#26C6DA",' \
'          "leading_diamond": "\ue0c5",' \
'          "properties": {' \
'            "macos": "mac"' \
'          },' \
'          "style": "diamond",' \
'          "template": " {{ if .WSL }}WSL at {{ end }}{{.Icon}} \ue0b1",' \
'          "trailing_diamond": "\ue0b0",' \
'          "type": "os"' \
'        },' \
'        {' \
'          "background": "#546E7A",' \
'          "foreground": "#26C6DA",' \
'          "powerline_symbol": "\ue0b0",' \
'          "style": "powerline",' \
'          "template": " {{ .UserName }}@{{ .HostName }} ",' \
'          "type": "session"' \
'        },' \
'        {' \
'          "background": "#a2beef",' \
'          "background_templates": [' \
'            "{{if eq \"Charging\" .State.String}}#00D100{{end}}",' \
'            "{{if eq \"Discharging\" .State.String}}#FFCD58{{end}}",' \
'            "{{if eq \"Full\" .State.String}}#0476d0{{end}}"' \
'          ],' \
'          "foreground": "#193549",' \
'          "powerline_symbol": "\ue0b0",' \
'          "style": "powerline",' \
'          "template": " {{ if not .Error }}{{ .Icon }}{{ .Percentage }}{{ end }}{{ .Error }}\uf295 \ueb2d ",' \
'          "type": "battery"' \
'        },' \
'        {' \
'          "background": "#14c2dd",' \
'          "foreground": "#193549",' \
'          "powerline_symbol": "\ue0b0",' \
'          "properties": {' \
'            "style": "folder"' \
'          },' \
'          "style": "powerline",' \
'          "template": " \ue5ff {{ .Path }} ",' \
'          "type": "path"' \
'        },' \
'        {' \
'          "background": "#a2c4e0",' \
'          "foreground": "#193549",' \
'          "powerline_symbol": "\ue0b0",' \
'          "properties": {' \
'            "fetch_stash_count": true,' \
'            "fetch_upstream_icon": true' \
'          },' \
'          "style": "powerline",' \
'          "template": " {{ .UpstreamIcon }}{{ .HEAD }}{{ if gt .StashCount 0 }} \ueb4b {{ .StashCount }}{{ end }} ",' \
'          "type": "git"' \
'        },' \
'        {' \
'          "background": "#6CA35E",' \
'          "foreground": "#ffffff",' \
'          "powerline_symbol": "\ue0b0",' \
'          "style": "powerline",' \
'          "template": " \ue718 {{ if .PackageManagerIcon }}{{ .PackageManagerIcon }} {{ end }}{{ .Full }} ",' \
'          "type": "node"' \
'        },' \
'        {' \
'          "background": "#ffff66",' \
'          "foreground": "#193549",' \
'          "powerline_symbol": "\ue0b0",' \
'          "style": "powerline",' \
'          "template": " \uf0e7 ",' \
'          "type": "root"' \
'        },' \
'        {' \
'          "background": "#0077c2",' \
'          "foreground": "#ffffff",' \
'          "powerline_symbol": "\ue0b0",' \
'          "style": "powerline",' \
'          "template": " \uf308 {{.Context}} :: {{if .Namespace}}{{.Namespace}}{{else}}default{{end}} ",' \
'          "type": "kubectl"' \
'        },' \
'        {' \
'          "background": "#007800",' \
'          "background_templates": [' \
'            "{{ if gt .Code 0 }}#f1184c{{ end }}"' \
'          ],' \
'          "foreground": "#ffffff",' \
'          "leading_diamond": "<transparent,background>\ue0b0</>",' \
'          "properties": {' \
'            "always_enabled": true' \
'          },' \
'          "style": "diamond",' \
'          "template": " \uea6c ",' \
'          "trailing_diamond": "\ue0b0",' \
'          "type": "status"' \
'        }' \
'      ],' \
'      "type": "prompt"' \
'    },' \
'    {' \
'      "alignment": "left",' \
'      "newline": true,' \
'      "segments": [' \
'        {' \
'          "foreground": "#007ACC",' \
'          "style": "plain",' \
'          "template": "\u279c ",' \
'          "type": "text"' \
'        }' \
'      ],' \
'      "type": "prompt"' \
'    }' \
'  ],' \
'  "final_space": true,' \
'  "version": 2' \
'}' \
>> ~/.oh-my-posh-configs/blueish.omp.json
printf '# eval "$(oh-my-posh init bash --config /home/codespace/.oh-my-posh-configs/craver.omp.json)"\n' >> ~/.custom-bash-scripts/terminal-prettifier-configs.sh
touch ~/.oh-my-posh-configs/craver.omp.json
truncate -s 0 ~/.oh-my-posh-configs/craver.omp.json
printf '%s\n' '{' \
'  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",' \
'  "blocks": [' \
'    {' \
'      "alignment": "left",' \
'      "segments": [' \
'        {' \
'          "background": "#f1184c",' \
'          "foreground": "#242424",' \
'          "powerline_symbol": "\ue0c4",' \
'          "style": "powerline",' \
'          "template": "\uf0e7",' \
'          "type": "root"' \
'        },' \
'        {' \
'          "background": "#282c34",' \
'          "foreground": "#3A86FF",' \
'          "leading_diamond": " ",' \
'          "style": "diamond",' \
'          "template": " {{ if .WSL }}WSL at {{ end }}{{.Icon}} ",' \
'          "type": "os"' \
'        },' \
'        {' \
'          "background": "#242424",' \
'          "foreground": "#FFBB00",' \
'          "powerline_symbol": "\ue0c4",' \
'          "properties": {' \
'            "time_format": "15:04:05"' \
'          },' \
'          "style": "powerline",' \
'          "template": "{{ .CurrentDate | date .Format }} ",' \
'          "type": "time"' \
'        },' \
'        {' \
'          "background": "#242424",' \
'          "foreground": "#33DD2D",' \
'          "powerline_symbol": "\ue0b0",' \
'          "properties": {' \
'            "folder_separator_icon": "/",' \
'            "style": "folder"' \
'          },' \
'          "style": "powerline",' \
'          "template": "\ue5ff {{ .Path }} ",' \
'          "type": "path"' \
'        },' \
'        {' \
'          "background": "#242424",' \
'          "foreground": "#3A86FF",' \
'          "powerline_symbol": "\ue0b0",' \
'          "properties": {' \
'            "fetch_stash_count": true,' \
'            "fetch_status": true,' \
'            "fetch_upstream_icon": true' \
'          },' \
'          "style": "powerline",' \
'          "template": "{{ .UpstreamIcon }}{{ .HEAD }}{{ if .Staging.Changed }} \uf046 {{ .Staging.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Working.Changed }} \uf044 {{ .Working.String }}{{ end }}{{ if gt .StashCount 0 }} \ueb4b {{ .StashCount }}{{ end }} ",' \
'          "type": "git"' \
'        },' \
'        {' \
'          "background": "#0184bc",' \
'          "foreground": "#ffffff",' \
'          "powerline_symbol": "\ue0c4",' \
'          "style": "powerline",' \
'          "template": " \ue70c {{ if .Unsupported }}\uf071{{ else }}{{ .Full }}{{ end }} ",' \
'          "type": "dotnet"' \
'        },' \
'        {' \
'          "background": "#8800dd",' \
'          "foreground": "#ffffff",' \
'          "powerline_symbol": "\ue0c4",' \
'          "properties": {' \
'            "style": "austin",' \
'            "threshold": 1' \
'          },' \
'          "style": "powerline",' \
'          "template": " <#fefefe>\ueba2</> {{ .FormattedMs }} ",' \
'          "type": "executiontime"' \
'        },' \
'        {' \
'          "background": "#33DD2D",' \
'          "background_templates": [' \
'            "{{ if gt .Code 0 }}#f1184c{{ end }}"' \
'          ],' \
'          "foreground": "#242424",' \
'          "powerline_symbol": "\ue0b4",' \
'          "style": "powerline",' \
'          "template": " \ueb05 ",' \
'          "type": "status"' \
'        }' \
'      ],' \
'      "type": "prompt"' \
'    },' \
'    {' \
'      "alignment": "left",' \
'      "newline": true,' \
'      "segments": [' \
'        {' \
'          "foreground": "#f1184c",' \
'          "style": "plain",' \
'          "template": "\u279c ",' \
'          "type": "text"' \
'        }' \
'      ],' \
'      "type": "prompt"' \
'    }' \
'  ],' \
'  "console_title_template": "{{if .Root}}(Admin) {{end}}{{.Folder}}",' \
'  "version": 2' \
'}' \
>> ~/.oh-my-posh-configs/craver.omp.json
printf '# eval "$(oh-my-posh init bash --config /home/codespace/.oh-my-posh-configs/default.omp.json)"\n' >> ~/.custom-bash-scripts/terminal-prettifier-configs.sh
touch ~/.oh-my-posh-configs/default.omp.json
truncate -s 0 ~/.oh-my-posh-configs/default.omp.json
printf '%s\n' '{' \
'  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",' \
'  "version": 2,' \
'  "final_space": true,' \
'  "console_title_template": "{{ .Shell }} in {{ .Folder }}",' \
'  "blocks": [' \
'    {' \
'      "type": "prompt",' \
'      "alignment": "left",' \
'      "segments": [' \
'        {' \
'          "type": "session",' \
'          "style": "diamond",' \
'          "foreground": "p:black",' \
'          "background": "p:yellow",' \
'          "leading_diamond": "\ue0b6",' \
'          "trailing_diamond": "\ue0b0",' \
'          "template": " {{ if .SSHSession }}\ueba9 {{ end }}{{ .UserName }} "' \
'        },' \
'        {' \
'          "type": "path",' \
'          "style": "powerline",' \
'          "powerline_symbol": "\ue0b0",' \
'          "foreground": "p:white",' \
'          "background": "p:orange",' \
'          "template": " \uea83 {{ path .Path .Location }} ",' \
'          "properties": {' \
'            "style": "folder"' \
'          }' \
'        },' \
'        {' \
'          "type": "git",' \
'          "style": "powerline",' \
'          "powerline_symbol": "\ue0b0",' \
'          "foreground": "p:black",' \
'          "foreground_templates": [' \
'            "{{ if or (.Working.Changed) (.Staging.Changed) }}p:black{{ end }}",' \
'            "{{ if and (gt .Ahead 0) (gt .Behind 0) }}p:white{{ end }}",' \
'            "{{ if gt .Ahead 0 }}p:white{{ end }}"' \
'          ],' \
'          "background": "p:green",' \
'          "background_templates": [' \
'            "{{ if or (.Working.Changed) (.Staging.Changed) }}p:yellow{{ end }}",' \
'            "{{ if and (gt .Ahead 0) (gt .Behind 0) }}p:red{{ end }}",' \
'            "{{ if gt .Ahead 0 }}#49416D{{ end }}",' \
'            "{{ if gt .Behind 0 }}#7A306C{{ end }}"' \
'          ],' \
'          "template": " {{ if .UpstreamURL }}{{ url .UpstreamIcon .UpstreamURL }} {{ end }}{{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }} \uf044 {{ .Working.String }}{{ end }}{{ if .Staging.Changed }} \uf046 {{ .Staging.String }}{{ end }} ",' \
'          "properties": {' \
'            "branch_max_length": 25,' \
'            "fetch_status": true,' \
'            "fetch_upstream_icon": true' \
'          }' \
'        },' \
'        {' \
'          "type": "root",' \
'          "style": "powerline",' \
'          "powerline_symbol": "\ue0b0",' \
'          "foreground": "p:white",' \
'          "background": "p:yellow",' \
'          "template": " \uf0e7 "' \
'        },' \
'        {' \
'          "type": "status",' \
'          "style": "diamond",' \
'          "foreground": "p:white",' \
'          "background": "p:blue",' \
'          "background_templates": [' \
'            "p:red"' \
'          ],' \
'          "leading_diamond": "<transparent,background>\ue0b0</>",' \
'          "trailing_diamond": "\ue0b4",' \
'          "template": " CONFIG ERROR ",' \
'          "properties": {' \
'            "always_enabled": true' \
'          }' \
'        }' \
'      ]' \
'    },' \
'    {' \
'      "type": "rprompt",' \
'      "segments": [' \
'        {' \
'          "type": "node",' \
'          "style": "plain",' \
'          "foreground": "p:green",' \
'          "background": "transparent",' \
'          "template": "\ue718 ",' \
'          "properties": {' \
'            "display_mode": "files",' \
'            "fetch_package_manager": false,' \
'            "home_enabled": false' \
'          }' \
'        },' \
'        {' \
'          "type": "go",' \
'          "style": "plain",' \
'          "foreground": "p:blue",' \
'          "background": "transparent",' \
'          "template": "\ue626 ",' \
'          "properties": {' \
'            "fetch_version": false' \
'          }' \
'        },' \
'        {' \
'          "type": "python",' \
'          "style": "plain",' \
'          "foreground": "p:yellow",' \
'          "background": "transparent",' \
'          "template": "\ue235 ",' \
'          "properties": {' \
'            "display_mode": "files",' \
'            "fetch_version": false,' \
'            "fetch_virtual_env": false' \
'          }' \
'        },' \
'        {' \
'          "type": "shell",' \
'          "style": "plain",' \
'          "foreground": "p:white",' \
'          "background": "transparent",' \
'          "template": "in <p:blue><b>{{ .Name }}</b></> "' \
'        },' \
'        {' \
'          "type": "time",' \
'          "style": "plain",' \
'          "foreground": "p:white",' \
'          "background": "transparent",' \
'          "template": "at <p:blue><b>{{ .CurrentDate | date \"15:04:05\" }}</b></>"' \
'        }' \
'      ]' \
'    }' \
'  ],' \
'  "tooltips": [' \
'    {' \
'      "type": "aws",' \
'      "tips": [' \
'        "aws"' \
'      ],' \
'      "style": "diamond",' \
'      "foreground": "p:white",' \
'      "background": "p:orange",' \
'      "leading_diamond": "\ue0b0",' \
'      "trailing_diamond": "\ue0b4",' \
'      "template": " \ue7ad {{ .Profile }}{{ if .Region }}@{{ .Region }}{{ end }} ",' \
'      "properties": {' \
'        "display_default": true' \
'      }' \
'    },' \
'    {' \
'      "type": "az",' \
'      "tips": [' \
'        "az"' \
'      ],' \
'      "style": "diamond",' \
'      "foreground": "p:white",' \
'      "background": "p:blue",' \
'      "leading_diamond": "\ue0b0",' \
'      "trailing_diamond": "\ue0b4",' \
'      "template": " \uebd8 {{ .Name }} ",' \
'      "properties": {' \
'        "display_default": true' \
'      }' \
'    }' \
'  ],' \
'  "transient_prompt": {' \
'    "foreground": "p:black",' \
'    "background": "transparent",' \
'    "template": "<p:yellow,transparent>\ue0b6</><,p:yellow> {{ .Folder }} </><p:yellow,transparent>\ue0b0</> "' \
'  },' \
'  "secondary_prompt": {' \
'    "foreground": "p:black",' \
'    "background": "transparent",' \
'    "template": "<p:yellow,transparent>\ue0b6</><,p:yellow> > </><p:yellow,transparent>\ue0b0</> "' \
'  },' \
'  "palette": {' \
'    "black": "#262B44",' \
'    "blue": "#4B95E9",' \
'    "green": "#59C9A5",' \
'    "orange": "#F07623",' \
'    "red": "#D81E5B",' \
'    "white": "#E0DEF4",' \
'    "yellow": "#F3AE35"' \
'  }' \
'}' \
>> ~/.oh-my-posh-configs/default.omp.json
printf '# eval "$(oh-my-posh init bash --config /home/codespace/.oh-my-posh-configs/jv_sitecorian.omp.json)"\n' >> ~/.custom-bash-scripts/terminal-prettifier-configs.sh
touch ~/.oh-my-posh-configs/jv_sitecorian.omp.json
truncate -s 0 ~/.oh-my-posh-configs/jv_sitecorian.omp.json
printf '%s\n' '{' \
'  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",' \
'  "blocks": [' \
'    {' \
'      "alignment": "left",' \
'      "newline": true,' \
'      "segments": [' \
'        {' \
'          "foreground": "#ffffff",' \
'          "style": "plain",' \
'          "type": "text"' \
'        }' \
'      ],' \
'      "type": "prompt"' \
'    },' \
'    {' \
'      "alignment": "left",' \
'      "segments": [' \
'        {' \
'          "foreground": "#185F7B",' \
'          "style": "plain",' \
'          "template": "\ue0c5",' \
'          "type": "text"' \
'        },' \
'        {' \
'          "background": "#185F7B",' \
'          "foreground": "#185F7B",' \
'          "powerline_symbol": "\ue0c4",' \
'          "style": "powerline",' \
'          "type": "text"' \
'        },' \
'        {' \
'          "background": "#185F7B",' \
'          "foreground": "#ffffff",' \
'          "properties": {' \
'            "home_icon": "\ue617  ",' \
'            "style": "mixed"' \
'          },' \
'          "style": "diamond",' \
'          "template": "{{ .Path }} ",' \
'          "trailing_diamond": "\ue0b0",' \
'          "type": "path"' \
'        },' \
'        {' \
'          "background": "#6f42c1",' \
'          "foreground": "#ffffff",' \
'          "powerline_symbol": "\ue0b0",' \
'          "properties": {' \
'            "fetch_stash_count": true,' \
'            "fetch_status": true,' \
'            "fetch_upstream_icon": true' \
'          },' \
'          "style": "powerline",' \
'          "template": " {{ .UpstreamIcon }}{{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }} \uf044 {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }} \uf046 {{ .Staging.String }}{{ end }}{{ if gt .StashCount 0 }} \ueb4b {{ .StashCount }}{{ end }} ",' \
'          "type": "git"' \
'        },' \
'        {' \
'          "leading_diamond": "<transparent,#49404f>\ue0b0</>",' \
'          "style": "plain",' \
'          "trailing_diamond": "\ue0b0",' \
'          "type": "text"' \
'        },' \
'        {' \
'          "background": "#4caf50",' \
'          "background_templates": [' \
'            "{{ if gt .Code 0 }}red{{ end }}"' \
'          ],' \
'          "foreground": "#ffffff",' \
'          "powerline_symbol": "\ue0b0",' \
'          "properties": {' \
'            "always_enabled": true' \
'          },' \
'          "style": "powerline",' \
'          "template": " {{ if gt .Code 0 }}\uf421{{ else }}\uf469 \u2665{{ end }} ",' \
'          "type": "status"' \
'        }' \
'      ],' \
'      "type": "prompt"' \
'    },' \
'    {' \
'      "alignment": "right",' \
'      "segments": [' \
'        {' \
'          "background": "#2B2B2B",' \
'          "foreground": "#ffffff",' \
'          "invert_powerline": true,' \
'          "leading_diamond": "\ue0c5",' \
'          "properties": {' \
'            "time_format": "3:04:05 PM"' \
'          },' \
'          "style": "diamond",' \
'          "template": " {{ .CurrentDate | date .Format }}<#ffffff> \ue641 </>",' \
'          "trailing_diamond": "\ue0c4",' \
'          "type": "time"' \
'        },' \
'        {' \
'          "background": "#2B2B2B",' \
'          "foreground": "#ffffff",' \
'          "invert_powerline": true,' \
'          "leading_diamond": "\ue0c5",' \
'          "properties": {' \
'            "always_enabled": true' \
'          },' \
'          "style": "diamond",' \
'          "template": " {{ .FormattedMs }}<#ffffff> \uf252 </>",' \
'          "trailing_diamond": "\ue0c4",' \
'          "type": "executiontime"' \
'        }' \
'      ],' \
'      "type": "prompt"' \
'    },' \
'    {' \
'      "alignment": "left",' \
'      "newline": true,' \
'      "segments": [' \
'        {' \
'          "foreground": "#2B2B2B",' \
'          "style": "plain",' \
'          "template": "\ue0c5",' \
'          "type": "text"' \
'        },' \
'        {' \
'          "background": "#2B2B2B",' \
'          "foreground": "#1CA6A3",' \
'          "powerline_symbol": "\ue0c4",' \
'          "style": "powerline",' \
'          "template": " {{ if .WSL }}WSL at {{ end }}{{.Icon}} ",' \
'          "type": "os"' \
'        },' \
'        {' \
'          "background": "#2B2B2B",' \
'          "foreground": "#FBD951",' \
'          "powerline_symbol": "\ue0b0",' \
'          "style": "powerline",' \
'          "template": "\uf0e7 ",' \
'          "type": "root"' \
'        },' \
'        {' \
'          "background": "#DC291E",' \
'          "foreground": "#ffffff",' \
'          "powerline_symbol": "\ue0b0",' \
'          "style": "powerline",' \
'          "template": " {{ .UserName }} ",' \
'          "type": "session"' \
'        }' \
'      ],' \
'      "type": "prompt"' \
'    },' \
'    {' \
'      "alignment": "right",' \
'      "segments": [' \
'        {' \
'          "background": "#000000",' \
'          "foreground": "#666666",' \
'          "style": "plain",' \
'          "template": "\uf489 {{ .Name }}",' \
'          "type": "shell"' \
'        }' \
'      ],' \
'      "type": "rprompt"' \
'    }' \
'  ],' \
'  "console_title_template": "{{if .Root}}Admin: {{end}} {{.Folder}}",' \
'  "final_space": true,' \
'  "version": 2' \
'}' \
>> ~/.oh-my-posh-configs/jv_sitecorian.omp.json
printf '# eval "$(oh-my-posh init bash --config /home/codespace/.oh-my-posh-configs/kushal.omp.json)"\n' >> ~/.custom-bash-scripts/terminal-prettifier-configs.sh
touch ~/.oh-my-posh-configs/kushal.omp.json
truncate -s 0 ~/.oh-my-posh-configs/kushal.omp.json
printf '%s\n' '{' \
'  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",' \
'  "console_title_template": "{{ if .Root }}root @ {{ end }}{{ .Shell }} in {{ .Folder }}",' \
'  "blocks": [' \
'    {' \
'      "alignment": "left",' \
'      "segments": [' \
'        {' \
'          "background": "#575656",' \
'          "foreground": "#D6DEEB",' \
'          "leading_diamond": "\ue0b2",' \
'          "properties": {' \
'            "alpine": "\uf300",' \
'            "arch": "\uf303",' \
'            "centos": "\uf304",' \
'            "debian": "\uf306",' \
'            "elementary": "\uf309",' \
'            "fedora": "\uf30a",' \
'            "gentoo": "\uf30d",' \
'            "linux": "\ue712",' \
'            "macos": "\ue711",' \
'            "manjaro": "\uf312",' \
'            "mint": "\uf30f",' \
'            "opensuse": "\uf314",' \
'            "raspbian": "\uf315",' \
'            "ubuntu": "\uf31c",' \
'            "windows": "\ue70f"' \
'          },' \
'          "style": "diamond",' \
'          "template": " {{ if .WSL }}\ue712 on {{ end }}{{ .Icon }} ",' \
'          "type": "os"' \
'        },' \
'        {' \
'          "background": "#00C7FC",' \
'          "foreground": "#011627",' \
'          "powerline_symbol": "\ue0b0",' \
'          "style": "powerline",' \
'          "template": " \uf489 {{ .Name }} ",' \
'          "type": "shell"' \
'        },' \
'        {' \
'          "background": "#EF541C",' \
'          "foreground": "#D6DEEB",' \
'          "powerline_symbol": "\ue0b0",' \
'          "style": "powerline",' \
'          "template": " \uf09c admin ",' \
'          "type": "root"' \
'        },' \
'        {' \
'          "type": "cmake",' \
'          "style": "powerline",' \
'          "powerline_symbol": "\ue0b0",' \
'          "foreground": "#E8EAEE",' \
'          "background": "#1E9748",' \
'          "template": " \ue61e \ue61d cmake {{ .Full }} "' \
'        },' \
'        {' \
'          "type": "python",' \
'          "style": "powerline",' \
'          "powerline_symbol": "\ue0b0",' \
'          "properties": {' \
'            "display_mode": "context"' \
'          },' \
'          "foreground": "#011627",' \
'          "background": "#FFDE57",' \
'          "template": " \ue73c {{ if .Venv }}{{ .Venv }} {{ end }}{{ .Full }} "' \
'        },' \
'        {' \
'          "type": "go",' \
'          "style": "powerline",' \
'          "powerline_symbol": "\ue0b0",' \
'          "foreground": "#ffffff",' \
'          "background": "#7FD5EA",' \
'          "template": " \u202d\ue626 {{ .Full }} "' \
'        },' \
'        {' \
'          "type": "rust",' \
'          "style": "powerline",' \
'          "powerline_symbol": "\ue0b0",' \
'          "foreground": "#193549",' \
'          "background": "#99908A",' \
'          "template": " \ue7a8 {{ .Full }} "' \
'        },' \
'        {' \
'          "background": "#1BD4CD",' \
'          "background_templates": [' \
'            "{{ if or (.Working.Changed) (.Staging.Changed) }}#16B1AC{{ end }}",' \
'            "{{ if and (gt .Ahead 0) (gt .Behind 0) }}#16B1AC{{ end }}",' \
'            "{{ if gt .Ahead 0 }}#B787D7{{ end }}",' \
'            "{{ if gt .Behind 0 }}#B787D7{{ end }}"' \
'          ],' \
'          "foreground": "#011627",' \
'          "powerline_symbol": "\ue0b0",' \
'          "properties": {' \
'            "branch_icon": "\ue725 ",' \
'            "fetch_stash_count": true,' \
'            "fetch_status": true,' \
'            "fetch_upstream_icon": true,' \
'            "fetch_worktree_count": true' \
'          },' \
'          "style": "powerline",' \
'          "template": " {{ .UpstreamIcon }}{{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }} \uf044 {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }}<#CAEBE1> \uf046 {{ .Staging.String }}</>{{ end }}{{ if gt .StashCount 0 }} \ueb4b {{ .StashCount }}{{ end }} ",' \
'          "type": "git"' \
'        }' \
'      ],' \
'      "type": "prompt"' \
'    },' \
'    {' \
'      "alignment": "right",' \
'      "segments": [' \
'        {' \
'          "background": "#03DED3",' \
'          "background_templates": [' \
'            "{{ if gt .Code 0 }}#E44141{{ end }}"' \
'          ],' \
'          "foreground": "#414141",' \
'          "foreground_templates": [' \
'            "{{ if gt .Code 0 }}#D6DEEB{{ end }}"' \
'          ],' \
'          "leading_diamond": "\ue0b6",' \
'          "properties": {' \
'            "always_enabled": true' \
'          },' \
'          "style": "diamond",' \
'          "template": " {{ if gt .Code 0 }}\uf00d{{ else }}\uf00c{{ end }} ",' \
'          "type": "status"' \
'        },' \
'        {' \
'          "background": "#575656",' \
'          "foreground": "#D6DEEB",' \
'          "properties": {' \
'            "style": "roundrock",' \
'            "threshold": 0' \
'          },' \
'          "style": "diamond",' \
'          "template": " \uf252 {{ .FormattedMs }} ",' \
'          "trailing_diamond": "\ue0b4",' \
'          "type": "executiontime"' \
'        }' \
'      ],' \
'      "type": "prompt"' \
'    },' \
'    {' \
'      "alignment": "left",' \
'      "newline": true,' \
'      "segments": [' \
'        {' \
'          "foreground": "#D6DEEB",' \
'          "style": "plain",' \
'          "template": "\u256d\u2500",' \
'          "type": "text"' \
'        },' \
'        {' \
'          "foreground": "#F2D3B6",' \
'          "properties": {' \
'            "time_format": "<#D6DEEB>\ue641  15:04:05 </><#79DFE1>|</> \uf073  2 Jan, Monday"' \
'          },' \
'          "style": "plain",' \
'          "template": "{{ .CurrentDate | date .Format }} <#79DFE1>|</>",' \
'          "type": "time"' \
'        },' \
'        {' \
'          "foreground": "#B6D6F2",' \
'          "leading_diamond": "<#00C7FC> \uf07b </><#B6D6F2> in </>",' \
'          "properties": {' \
'            "folder_icon": " \uf07c ",' \
'            "folder_separator_icon": " \uf061 ",' \
'            "home_icon": "\ueb06 ",' \
'            "style": "agnoster_short",' \
'            "max_depth": 3' \
'          },' \
'          "style": "diamond",' \
'          "template": " {{ .Path }} ",' \
'          "type": "path"' \
'        }' \
'      ],' \
'      "type": "prompt"' \
'    },' \
'    {' \
'      "alignment": "left",' \
'      "newline": true,' \
'      "segments": [' \
'        {' \
'          "foreground": "#D6DEEB",' \
'          "style": "plain",' \
'          "template": "\u2570\u2500",' \
'          "type": "text"' \
'        },' \
'        {' \
'          "foreground": "#D6DEEB",' \
'          "properties": {' \
'            "always_enabled": true' \
'          },' \
'          "style": "plain",' \
'          "template": "\u276f ",' \
'          "type": "status"' \
'        }' \
'      ],' \
'      "type": "prompt"' \
'    }' \
'  ],' \
'  "osc99": true,' \
'  "transient_prompt": {' \
'    "background": "transparent",' \
'    "foreground": "#FEF5ED",' \
'    "template": "\ue285 "' \
'  },' \
'  "secondary_prompt": {' \
'    "background": "transparent",' \
'    "foreground": "#D6DEEB",' \
'    "template": "\u2570\u2500\u276f "' \
'  },' \
'  "version": 2' \
'}' \
>> ~/.oh-my-posh-configs/kushal.omp.json
printf '# eval "$(oh-my-posh init bash --config /home/codespace/.oh-my-posh-configs/lightgreen.omp.json)"\n' >> ~/.custom-bash-scripts/terminal-prettifier-configs.sh
touch ~/.oh-my-posh-configs/lightgreen.omp.json
truncate -s 0 ~/.oh-my-posh-configs/lightgreen.omp.json
printf '%s\n' '{' \
'  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",' \
'  "blocks": [' \
'    {' \
'      "alignment": "left",' \
'      "segments": [' \
'        {' \
'          "background": "#000000",' \
'          "foreground": "#dd1e1e",' \
'          "style": "plain",' \
'          "template": " \u26a1",' \
'          "type": "root"' \
'        },' \
'        {' \
'          "background": "transparent",' \
'          "foreground": "#ffffff",' \
'          "properties": {' \
'            "alpine": "\uf300",' \
'            "arch": "\uf303",' \
'            "centos": "\uf304",' \
'            "debian": "\uf306",' \
'            "elementary": "\uf309",' \
'            "fedora": "\uf30a",' \
'            "gentoo": "\uf30d",' \
'            "linux": "\ue712",' \
'            "macos": "\ue711",' \
'            "manjaro": "\uf312",' \
'            "mint": "\uf30f",' \
'            "opensuse": "\uf314",' \
'            "raspbian": "\uf315",' \
'            "ubuntu": "\uf31c",' \
'            "windows": "\ue62a",' \
'            "wsl": "\ue712"' \
'          },' \
'          "style": "plain",' \
'          "template": " {{ if .WSL }}WSL at {{ end }}{{.Icon}} ",' \
'          "type": "os"' \
'        },' \
'        {' \
'          "background": "#272727",' \
'          "foreground": "#3EC669",' \
'          "leading_diamond": "\ue0b6",' \
'          "properties": {' \
'            "style": "folder"' \
'          },' \
'          "style": "diamond",' \
'          "template": "\ue5ff {{ .Path }}",' \
'          "trailing_diamond": "\ue0b4",' \
'          "type": "path"' \
'        },' \
'        {' \
'          "background": "#272727",' \
'          "foreground": "#00ff0d",' \
'          "properties": {' \
'            "fetch_stash_count": true,' \
'            "fetch_status": true' \
'          },' \
'          "style": "plain",' \
'          "template": "<#000000>\ue0b1 </>{{ .HEAD }}{{ if .Staging.Changed }}<#FF6F00> \uf046 {{ .Staging.String }}</>{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Working.Changed }} \uf044 {{ .Working.String }}{{ end }}{{ if gt .StashCount 0 }} \ueb4b {{ .StashCount }}{{ end }} ",' \
'          "type": "git"' \
'        },' \
'        {' \
'          "background": "#306998",' \
'          "foreground": "#FFE873",' \
'          "leading_diamond": "\ue0b6",' \
'          "style": "diamond",' \
'          "template": "\ue235 {{ if .Error }}{{ .Error }}{{ else }}{{ if .Venv }}{{ .Venv }} {{ end }}{{ .Full }}{{ end }}",' \
'          "trailing_diamond": "\ue0b4 ",' \
'          "type": "python"' \
'        },' \
'        {' \
'          "background": "#ffffff",' \
'          "foreground": "#06aad5",' \
'          "leading_diamond": "\ue0b6",' \
'          "style": "diamond",' \
'          "template": "\ue626 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",' \
'          "trailing_diamond": "\ue0b4 ",' \
'          "type": "go"' \
'        },' \
'        {' \
'          "background": "#565656",' \
'          "foreground": "#faa029",' \
'          "leading_diamond": "\ue0b6",' \
'          "style": "diamond",' \
'          "template": "\ue7ad {{.Profile}}{{if .Region}}@{{.Region}}{{end}}",' \
'          "trailing_diamond": "\ue0b4 ",' \
'          "type": "aws"' \
'        },' \
'        {' \
'          "type": "terraform",' \
'          "style": "powerline",' \
'          "powerline_symbol": "\uE0B0",' \
'          "foreground": "#000000",' \
'          "background": "#ebcc34",' \
'          "template": "{{.WorkspaceName}}"' \
'        },' \
'        {' \
'          "background": "#316ce4",' \
'          "foreground": "#ffffff",' \
'          "leading_diamond": "\ue0b6",' \
'          "style": "diamond",' \
'          "template": "\uf308 {{.Context}}{{if .Namespace}} :: {{.Namespace}}{{end}}",' \
'          "trailing_diamond": "\ue0b4",' \
'          "type": "kubectl"' \
'        }' \
'      ],' \
'      "type": "prompt"' \
'    },' \
'    {' \
'      "alignment": "right",' \
'      "segments": [' \
'        {' \
'          "properties": {' \
'              "style": "roundrock",' \
'              "always_enabled": true' \
'            },' \
'            "style": "diamond",' \
'            "template": "{{ .FormattedMs }} ",' \
'            "type": "executiontime"' \
'        },' \
'        {' \
'          "background": "#ffffff",' \
'          "foreground": "#3c3c3c",' \
'          "style": "plain",' \
'          "template": " {{ round .PhysicalPercentUsed .Precision }}% ",' \
'          "type": "sysinfo"' \
'        },' \
'        {' \
'          "background": "#f36943",' \
'          "background_templates": [' \
'            "{{if eq \"Charging\" .State.String}}#b8e994{{end}}",' \
'            "{{if eq \"Discharging\" .State.String}}#fff34e{{end}}",' \
'            "{{if eq \"Full\" .State.String}}#33DD2D{{end}}"' \
'          ],' \
'          "foreground": "#262626",' \
'          "invert_powerline": true,' \
'          "leading_diamond": "\ue0b2",' \
'          "properties": {' \
'            "charged_icon": "\uf240 ",' \
'            "charging_icon": "\uf1e6 ",' \
'            "discharging_icon": "\ue234 "' \
'          },' \
'          "style": "plain",' \
'          "template": " {{ if not .Error }}{{ .Icon }}{{ .Percentage }}{{ end }}{{ .Error }}\uf295 <#262626>\ue0b2</>",' \
'          "type": "battery"' \
'        },' \
'        {' \
'          "background": "#000000",' \
'          "foreground": "lightGreen",' \
'          "style": "plain",' \
'          "template": "{{ .CurrentDate | date .Format }}",' \
'          "type": "time"' \
'        }' \
'      ],' \
'      "type": "rprompt"' \
'    }' \
'  ],' \
'  "pwd": "osc99",' \
'  "version": 2' \
'}' \
>> ~/.oh-my-posh-configs/lightgreen.omp.json
printf 'eval "$(oh-my-posh init bash --config /home/codespace/.oh-my-posh-configs/sonicboom_light.omp.json)"\n' >> ~/.custom-bash-scripts/terminal-prettifier-configs.sh
touch ~/.oh-my-posh-configs/sonicboom_light.omp.json
truncate -s 0 ~/.oh-my-posh-configs/sonicboom_light.omp.json
printf '%s\n' '{' \
'  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",' \
'  "blocks": [' \
'    {' \
'      "alignment": "left",' \
'      "segments": [' \
'        {' \
'          "background": "#000000",' \
'          "foreground": "#dd1e1e",' \
'          "style": "plain",' \
'          "template": " \u26a1",' \
'          "type": "root"' \
'        },' \
'        {' \
'          "background": "#000000",' \
'          "foreground": "#ffffff",' \
'          "properties": {' \
'            "alpine": "\uf300",' \
'            "arch": "\uf303",' \
'            "centos": "\uf304",' \
'            "debian": "\uf306",' \
'            "elementary": "\uf309",' \
'            "fedora": "\uf30a",' \
'            "gentoo": "\uf30d",' \
'            "linux": "\ue712",' \
'            "macos": "\ue711",' \
'            "manjaro": "\uf312",' \
'            "mint": "\uf30f",' \
'            "opensuse": "\uf314",' \
'            "raspbian": "\uf315",' \
'            "ubuntu": "\uf31c",' \
'            "windows": "\ue62a",' \
'            "wsl": "\ue712"' \
'          },' \
'          "style": "plain",' \
'          "template": " {{ if .WSL }}WSL at {{ end }}{{.Icon}}  ",' \
'          "type": "os"' \
'        },' \
'        {' \
'          "background": "#4d4d4d",' \
'          "foreground": "#43CCEA",' \
'          "properties": {' \
'            "folder_icon": "\ue5fe",' \
'            "folder_separator_icon": " <transparent>\ue0bd </>",' \
'            "home_icon": "\ueb06",' \
'            "style": "agnoster_short"' \
'          },' \
'          "style": "plain",' \
'          "template": " {{ .Path }}  ",' \
'          "type": "path"' \
'        },' \
'        {' \
'          "background": "#4d4d4d",' \
'          "foreground": "#00ff0d",' \
'          "properties": {' \
'            "fetch_stash_count": true,' \
'            "fetch_status": true' \
'          },' \
'          "style": "plain",' \
'          "template": "<#000000>\ue0b1 </>{{ .HEAD }}{{ if .Staging.Changed }}<#FF6F00> \uf046 {{ .Staging.String }}</>{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Working.Changed }} \uf044 {{ .Working.String }}{{ end }}{{ if gt .StashCount 0 }} \ueb4b {{ .StashCount }}{{ end }} ",' \
'          "type": "git"' \
'        },' \
'        {' \
'          "background": "#4d4d4d",' \
'          "foreground": "#ffffff",' \
'          "properties": {' \
'            "style": "dallas",' \
'            "threshold": 0' \
'          },' \
'          "style": "diamond",' \
'          "template": "<#000000>\ue0b1 </>{{ .FormattedMs }}s ",' \
'          "trailing_diamond": "\ue0b0",' \
'          "type": "executiontime"' \
'        }' \
'      ],' \
'      "type": "prompt"' \
'    },' \
'    {' \
'      "alignment": "right",' \
'      "segments": [' \
'        {' \
'          "background": "#4d4d4d",' \
'          "foreground": "#43CCEA",' \
'          "leading_diamond": "\ue0c5 ",' \
'          "style": "diamond",' \
'          "template": " <#99FFFF>{{ if .SSHSession }}\ueba9 {{ end }}</>{{ .UserName }}<#99FFFF>@</>{{ .HostName }}",' \
'          "type": "session"' \
'        },' \
'        {' \
'          "background": "#4d4d4d",' \
'          "foreground": "#43CCEA",' \
'          "properties": {' \
'            "time_format": "3:04:05 PM"' \
'          },' \
'          "style": "diamond",' \
'          "template": " <#99FFFF>\ue31e\uf0fb</>  {{ .CurrentDate | date .Format }} ",' \
'          "trailing_diamond": "\ue0c5 ",' \
'          "type": "time"' \
'        }' \
'      ],' \
'      "type": "prompt"' \
'    },' \
'    {' \
'      "alignment": "left",' \
'      "newline": true,' \
'      "segments": [' \
'        {' \
'          "foreground": "#00ff0d",' \
'          "foreground_templates": [' \
'            "{{ if gt .Code 0 }}#ff0000{{ end }}"' \
'          ],' \
'          "properties": {' \
'            "always_enabled": true' \
'          },' \
'          "style": "plain",' \
'          "template": "\uf432 ",' \
'          "type": "status"' \
'        }' \
'      ],' \
'      "type": "prompt"' \
'    }' \
'  ],' \
'  "final_space": true,' \
'  "version": 2' \
'}' \
>> ~/.oh-my-posh-configs/sonicboom_light.omp.json
exec bash
