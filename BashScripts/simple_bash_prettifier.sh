mkdir ~/bin ~/.oh-my-posh-configs
printf '\n\nexport PATH="/home/codespace/bin:$PATH"\n' >> ~/.bashrc
printf 'eval "$(oh-my-posh init bash --config /home/codespace/.oh-my-posh-configs/sonicboom_light.omp.json)"\n' >> ~/.bashrc
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/bin
touch ~/.oh-my-posh-configs/sonicboom_light.omp.json
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
'}' >> ~/.oh-my-posh-configs/sonicboom_light.omp.json
exec bash
