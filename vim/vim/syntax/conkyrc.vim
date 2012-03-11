" Vim syntax file
"
" Modified by Viktor Alex Brynjarsson <loktacar@gmail.com>
"
" Language:	conkyrc
" Author:	Ciaran McCreesh <ciaranm@gentoo.org>
" Version:	20050923
" Copyright:	Copyright (c) 2005 Ciaran McCreesh
" Licence:	You may redistribute this under the same terms as Vim itself

if exists("b:current_syntax")
  finish
endif

syn region ConkyrcComment start=/^\s*#/ end=/$/

syn keyword ConkyrcSetting
      \ alignment append_file background border_inner_margin border_outer_margin
      \ border_width cpu_avg_samples default_bar_size default_color default_gauge_size
      \ default_outline_color default_shade_color disable_auto_reload diskio_avg_samples display
      \ double_buffer draw_borders draw_graph_borders draw_outline draw_shades
      \ extra_newline font format_human_readable gap_x gap_y
      \ hddtemp_host hddtemp_port if_up_strictness imap imlib_cache_flush_interval
      \ imlib_cache_size lua_draw_hook_post lua_draw_hook_pre lua_load lua_shutdown_hook
      \ lua_startup_hook mail_spool max_port_monitor_connections max_specials max_text_width
      \ max_user_text maximum_width minimum_width mpd_host mpd_password
      \ mpd_port music_player_interval net_avg_samples no_buffers nvidia_display
      \ out_to_console out_to_ncurses out_to_stderr out_to_x override_utf8_locale
      \ overwrite_file own_window own_window_class own_window_colour own_window_hints
      \ own_window_title own_window_argb_visual own_window_argb_value own_window_transparent own_window_type
      \ pad_percents pop3 short_units show_graph_range show_graph_range
      \ show_graph_scale stippled_borders temperature_unit text_buffer_size times_in_seconds
      \ top_cpu_separate top_name_width total_run_times update_interval update_interval_on_battery
      \ uppercase use_spacer use_xft xftalpha xftfont

syn match ConkyrcSetting /^color\d /
syn match ConkyrcSetting /^template\d /

syn keyword ConkyrcConstant yes no none
      \ top_left tl top_middle tm top_right tr
      \ middle_left ml middle_middle mm middle_right mr
      \ bottom_left bl bottom_middle bm bottom_right br
      \ undecorated below above sticky skip_taskbar skip_pager
      \ normal desktop dock panel override
      \ fahrenheit celsius

syn match ConkyrcNumber /\S\@<!\d\+\(\.\d\+\)\?\(\S\@!\|}\@=\)/
      \ nextgroup=ConkyrcNumber,ConkyrcColour skipwhite
syn match ConkyrcColour /\S\@<!#[a-fA-F0-9]\{6\}\(\S\@!\|}\@=\)/
      \ nextgroup=ConkyrcNumber,ConkyrcColour skipwhite

syn region ConkyrcText start=/^TEXT$/ end=/\%$/ contains=ConkyrcVar

syn region ConkyrcVar start=/\${/ end=/}/ contained contains=ConkyrcVarStuff
syn region ConkyrcVar start=/\$\w\@=/ end=/\W\@=\|$/ contained contains=ConkyrcVarName

syn match ConkyrcVarStuff /{\@<=/ms=s contained nextgroup=ConkyrcVarName

syn keyword ConkyrcVarName contained nextgroup=ConkyrcNumber,ConkyrcColour skipwhite
      \ addr acpiacadapter acpifan acpitemp acpitempf adt746xcpu
      \ adt746xfan alignr alignc apm_adapter apm_battery_life apm_battery_time
      \ battery buffers cached color cpu cpubar colour diskio downspeed downspeedf
      \ colour else exec execbar execgraph execi execibar execigraph font freq
      \ freq_g freq_dyn freq_dyn_g fs_bar fs_free fs_free_perc fs_size fs_used head
      \ hr i2c i8k_ac_status i8k_bios i8k_buttons_status i8k_cpu_temp i8k_cpu_tempf
      \ i8k_left_fan_rpm i8k_left_fan_status i8k_right_fan_rpm i8k_right_fan_status
      \ i8k_serial i8k_version if_running if_existing if_mounted kernel linkstatus loadavg
      \ machine mails mem membar memmax memperc ml_upload_counter ml_download_counter
      \ ml_nshared_files ml_shared_counter ml_tcp_upload_rate ml_tcp_download_rate
      \ ml_udp_upload_rate ml_udp_download_rate ml_ndownloaded_files ml_ndownloading_files
      \ mpd_artist mpd_album mpd_bar mpd_bitrate mpd_status mpd_title mpd_vol mpd_elapsed
      \ mpd_length mpd_percent new_mails nodename outlinecolor pre_exec processes
      \ running_processes shadecolor stippled_hr swapbar swap swapmax swapperc sysname
      \ texeci offset tail time totaldown top top_mem totalup updates upspeed upspeedf
      \ upspeedgraph uptime uptime_short seti_prog seti_progbar seti_credit voffset

syn match ConkyrcVarName /^color\d/
syn match ConkyrcVarName /^template\d/

hi def link ConkyrcComment   Comment
hi def link ConkyrcSetting   Keyword
hi def link ConkyrcConstant  Constant
hi def link ConkyrcNumber    Number
hi def link ConkyrcColour    Special

hi def link ConkyrcText      String
hi def link ConkyrcVar       Identifier
hi def link ConkyrcVarName   Keyword

let b:current_syntax = "conkyrc"

