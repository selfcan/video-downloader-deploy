@rem - Encoding:gb2312; Mode:Batch; Language:zh-CN; LineEndings:CRLF -
:: ========================= START OF TRANSLATION =========================
set "str_title=视频下载器 一键配置"
set "str_titleExpanded=========  %str_title%  ========"
:: ================= Menu Options
set "str_portable=绿色配置"
set "str_quickstart=快速配置"
set "str_withpip=完整配置"
set "str_opt1=初始配置"
set "str_opt11=绿色便携版，可以任意移动整体文件夹。默认"
set "str_opt12=快速体验，适合临时使用"
set "str_opt13=通过 pip 稳定更新，适合长期使用"
set "str_opt2=配置 FFmpeg"
set "str_opt3=更新所有视频下载器"
set "str_opt4=重新创建启动脚本"
set "str_opt5=更新此脚本 (访问 GitHub)"
set "str_opt6=高级设置"
set "str_please-choose=请输入选项的序号并按回车: "
set "str_please-choose-from=请从 11 , 12 , 13 中选择。"
set "str_please-input-valid-num=请输入有效的数字。"
set "str_please-set-DeployMode=未找到 "deploy.log" ，无法判断配置模式，请手动选择 [11, 12, 13]: "
set "str_please-perform-after-update= ^>^>^>建议更新后执行一次该选项^<^<^<"
:: ================= Notification
set "str_manually-downloaded=已找到"
set "str_manually-downloaded2=个手动下载的文件，正在将其移动到 "res\download\" 目录下"
set "str_bat-is-latest=此脚本已是最新。"
set "str_bat-can-update-to=此脚本可更新至"
set "str_deploy-ok=配置已完成。"
set "str_upgrade-ok=更新已完成。"
set "str_is-latestVersion=已是最新发行版"
set "str_please-wait=请耐心等待下载完成"
set "str_please-init=请先执行初始配置。"
set "str_please-re-init=已进行过初始配置，请删除 "usr" 文件夹后再执行此选项。"
set "str_please-check-connection=无法访问 GitHub ，请检查网络连接。"
set "str_deploy-although-exist=若仍需重新下载并部署，请输入Y；"
set "str_fileLost=文件丢失，请重新下载或解压此脚本的所有文件。"
:: :: use ^) instead of ), since %str_open-webpage% will be used in "if ( ) else( )"
set "str_open-webpage1=按任意键以查看 GitHub 主页 (即打开浏览器访问 GitHub^)"
set "str_open-webpage2=按任意键以获取更新 (即打开浏览器访问 GitHub^)"
set "str_exit=按任意键退出..."
:: ================= Procedure
set "str_downloading=正在下载"
set "str_unzipping=正在解压"
set "str_upgrading=正在更新"
set "str_updating=正在更新"
set "str_checking-connection=正在检查网络连接 (如果长时间无响应，请确认网络是否正常，或前往高级设置关闭"网络连接测试")"
set "str_checking-update=正在检查更新"
set "str_already-deploy=已配置。"
set "str_already-upgrade=已更新。"
set "str_already-exist=已存在。"
:: ================= Download Batch
:: ========= Download Batch - Guides
set "str_dl-guide1=下载视频的命令为："
set "str_dl-guide2=you-get/youtube-dl/annie + 视频网址"
set "str_dl-guide3=例如："
set "str_dl-guide4=默认下载最高清晰度。下载文件默认保存在 Download 目录。"
set "str_dl-guide5=如果你想选择清晰度、更改默认路径，或想了解三种工具的其他用法，请百度或参考官方说明："
set "str_dl-guide6=如需更改以下设置，请根据对应序号前往 "Deploy.bat - 高级设置" 切换相关选项"
set "str_dl-guide7=下载 YouTube 等外网视频时请“为当前窗口启用全局代理”或“添加额外代理参数”。"
set "str_dl-guide_wiki=中文说明"
:: ========= Download Batch - Contents
set "str_dl-bat=下载视频"
set "str_dl-bat-created=已创建启动脚本 "%str_dl-bat%.bat" 。"
set "str_dl-bat-reset=检测到脚本可能进行了更新，建议您执行一次 "Deploy.bat - [4]%str_opt4%" 。"
set "str_dl-bat-moved=未找到 "usr" 文件夹！请将此脚本移动到与 "Deploy.bat" 同一目录，或通过其重新创建启动脚本。"
:: ================= Advanced Settings
set "str_opt6-Expanded======= 高级设置 ======"
set "str_opt6_opt0=返回主菜单"
set "str_opt6_opt1=选择语言 (Select Language)"
set "str_opt6_opt2=选择下载地区"
set "str_opt6_opt3=设置全局代理"
set "str_opt6_opt4=(显示/隐藏) 代理参数的命令示例"
set "str_opt6_opt5=(禁用/启用) FFmpeg"
set "str_opt6_opt6=为 'wget' 设置参数"
set "str_opt6_opt7=指定系统位数"
set "str_opt6_opt8=(禁用/启用) 更新时的网络连接测试"
set "str_opt6_opt9=通过 ^(PyPI.org/GitHub_Releases^) 更新 you-get"
set "str_opt6_opt99=为什么我无法切换以上的某项设置?"
:: ========= Advanced Settings - Common Notifications
set "str_enter-to-cancel=直接回车以取消："
set "str_cancelled=输入无效，已取消。"
set "str_please-confirm-changes=修改后请重新执行此选项以确认设置无误。"
set "str_please-rerun=请重新运行此脚本以使设置生效。"
set "str_please-rerun-dlbat=请重新运行 "%str_dl-bat%.bat" 以使设置生效。"
:: ========= Advanced Settings - Option 1-2
set "str_please-select-language=[11] English ; [12] 简体中文 ; [13] 繁體中文"
set "str_language-set-to=语言已设置为："
set "str_please-select-region=[21] 官方源 (origin) ; [22] 中国大陆镜像源 (cn)"
set "str_current-region=当前下载地区为："
set "str_region-set-to=下载地区已设置为："
:: ========= Advanced Settings - Option 3
set "str_globalProxy-enabled=全局代理：启用"
set "str_globalProxy-disabled=全局代理：禁用 ^(默认^)"
set "str_current-globalProxy=若全局代理已启用，则当前 CMD 窗口将使用的代理地址为："
:: :: used in "dl-bat"
set "str_current-globalProxy-cmd=当前 CMD 窗口所使用的代理地址为："
set "str_please-set-globalProxy_1=若需(禁用/启用)全局代理，请输入T；"
set "str_please-set-globalProxy_2=若需恢复至默认的代理地址，请输入Y；"
set "str_please-set-globalProxy_3=若需自定义代理地址或端口号，请输入N；"
set "str_please-set-proxyHost=请输入 - 代理服务器地址^(留空则为 http://127.0.0.1 ^)："
set "str_please-set-httpPort=请输入 - HTTP端口^(留空则为 1080 ^)："
set "str_please-set-httpsPort=请输入 - HTTPS端口^(留空则为 1080 ^)："
set "str_reset-globalProxy-ok=代理地址已恢复至默认。"
set "str_set-globalProxy-ok=自定义代理地址已设置成功。"
:: ========= Advanced Settings - Option 4
set "str_proxyHint-enabled=代理参数的命令示例：显示"
set "str_proxyHint-disabled=代理参数的命令示例：隐藏 ^(默认^)"
:: :: used in "dl-bat"
set "str_proxyHint-option=代理参数示例："
set "str_proxyHint_annie1=自 annie v0.9.8 起，其不再支持通过 -x 或 -s 参数设置代理。"
set "str_proxyHint_annie2=可通过环境变量 %%%%HTTP_PROXY%%%% 来设置代理，或启用 [3]全局代理。"
:: ========= Advanced Settings - Option 5
set "str_ffmpeg-enabled=FFmpeg：启用 ^(默认^)"
set "str_ffmpeg-disabled=FFmpeg：禁用"
:: ========= Advanced Settings - Option 6
set "str_current-wgetOpt=当前 'wget' 所使用的参数为："
set "str_please-edit-wgetOpt_1=请自行编辑 "res\wget.opt" 以修改默认参数。"
set "str_please-edit-wgetOpt_2=若需重新生成默认的 "wget.opt" ，请输入Y；"
set "str_reset-wgetOpt-ok=已重新生成 "wget.opt" 。"
:: ========= Advanced Settings - Option 7
set "str_current-systemType=当前指定的系统位数为："
set "str_please-set-systemType=若需切换系统位数，请输入T；"
set "str_systemType-set-to=系统位数已设置为："
:: ========= Advanced Settings - Option 8-9
set "str_netTest-enabled=更新时的网络连接测试：启用 ^(默认^)"
set "str_netTest-disabled=更新时的网络连接测试：禁用"
set "str_upgradeOnlyViaGitHub-enabled=更新 you-get 的方式：通过 GitHub_Releases"
set "str_upgradeOnlyViaGitHub-disabled=更新 you-get 的方式：通过 PyPI.org ^(默认^)"
:: ========= Advanced Settings - Option 99
set "str_reset-settings_1=更新脚本后，若新增的设置无法切换，则需要删除 "res\deploy.settings" 。"
set "str_reset-settings_2=但这会导致以上所有的设置([6]除外)恢复至默认。"
set "str_reset-settings_3=若确认删除，请输入Y；"
set "str_reset-settings-ok=已删除 "res\deploy.settings" ，请尝试重新更改设置。"
:: ========================= END OF TRANSLATION =========================
:: Select %_Region_% for sources.txt
set "_Region_=cn"
