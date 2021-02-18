#!/bin/bash

RCONPW=${RCONPW:-$(shuf -i 10000000-90000000 -n 1)}
echo "RCON password: $RCONPW"
echo ""

cd /app

echo "Downloading/Updating GarrysMod..."
steamcmd \
	+login anonymous \
	+force_install_dir "/app" \
	+app_update 4020 -validate -language en \
	+quit

echo "Downloading/Updating CSS and TF2..."
steamcmd \
	+login anonymous \
	+force_install_dir "/content" \
	+app_update 232330 -validate -language en \
	+app_update 232250 -validate -language en \
	+quit

cd /app
echo ""
echo Creating garrysmod/cfg/server.cfg ...
rm garrysmod/cfg/server.cfg

if [ ! -e "/cfg/cfg/server.cfg" ]; then
    echo "File /cfg/cfg/server.cfg not found creating it with ENV parameters..."
    cat >garrysmod/cfg/server.cfg  << EOF
hostname "$NAME"
sv_contact "$MAIL"
sv_password "$PASSWORD"
rcon_password "$RCONPW"
ttt_killer_dna_range 300
ttt_killer_dna_basetime 100
ttt_firstpreptime $FPT
ttt_preptime_seconds $PT
ttt_posttime_seconds $DT
ttt_haste $HASTE
// ttt_haste_starting_minutes 5
// ttt_haste_minutes_per_death 0.5
ttt_roundtime_minutes $RT
ttt_round_limit $ROUND
ttt_time_limit_minutes 75
//ttt_always_use_mapcycle 0
ttt_minimum_players $MINPLAYERS
ttt_traitor_pct $TRAITORPCT
ttt_traitor_max $TRAITORMAX
ttt_detective_pct $DETPCT
ttt_detective_max $DETMAX
ttt_detective_min_players $DETMIN
ttt_detective_karma_min 600
ttt_credits_starting 3
ttt_credits_award_pct 25
ttt_credits_award_size 1
ttt_det_credits_starting 3
ttt_det_credits_traitorkill 2
ttt_karma 0
ttt_karma_strict 1
ttt_karma_starting 1000
ttt_karma_max 1000
ttt_karma_ratio 0.001
ttt_karma_kill_penalty 15
ttt_karma_round_increment 5
ttt_karma_clean_bonus 30
ttt_karma_traitordmg_ratio 0.0003
ttt_karma_traitorkill_bonus 40
ttt_karma_low_autokick 1
ttt_karma_low_amount 300
ttt_karma_low_ban 0
ttt_karma_low_ban_minutes 60
ttt_karma_persist 1
ttt_karma_clean_half 0.25
ttt_postround_dm 1
ttt_no_nade_throw_during_prep 0
ttt_weapon_carrying 1
ttt_weapon_carrying_range 50
ttt_teleport_telefrags 1
ttt_ragdoll_pinning 1
ttt_ragdoll_pinning_innocents 1
ttt_use_weapon_spawn_scripts 1
ttt_spawn_wave_interval 2
log on
sv_logbans 1
sv_logecho 1
sv_logfile 1
sv_log_onefile 0
sv_lan 0
sv_region 3 //Europe
exec banned_user.cfg
exec banned_ip.cfg
net_maxfilesize 64
EOF
fi
cat garrysmod/cfg/server.cfg


echo ""
echo Creating garrysmod/cfg/mount.cfg ...
rm garrysmod/cfg/mount.cfg
cat >garrysmod/cfg/mount.cfg  << EOF
"mountcfg"
{
	"cstrike"		"/content/cstrike"
	"tf"		"/content/tf"
}
EOF
cat garrysmod/cfg/mount.cfg

echo ""
echo "Folders/Files that will be copied into the server files from /cfg:"
tree /cfg

echo ""
echo "Copying these files into /app/garrysmod ..."
yes | cp -rf /cfg/* /app/garrysmod


echo ""
echo ""
echo "Starting server on port $PORT..."
echo ""

screen -S server ./srcds_run -console -port "$PORT" -maxplayers $MAXPLAYERS -game garrysmod +gamemode terrortown +map $STARTMAP +host_workshop_collection $WORKSHOP
