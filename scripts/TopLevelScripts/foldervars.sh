#!/bin/bash
# shellcheck disable=SC1090,SC2034,SC2154

## These Folders Are For the Scripts in this Directory

## Script Location
SCRIPTDIR=$(dirname $0)

## Folder Name of Script
COMPLETEFOLDERPATH=$(realpath $SCRIPTDIR)
SCRIPTBASEFOLDERNAME=$(echo "`basename $COMPLETEFOLDERPATH | cut -f 1 -d '.'`")

## Name Of Current Script
SCRIPTBASEFILENAME=$(echo "`basename $0 | cut -f 1 -d '.'`")

## Amount Of Folders Between
FOLDERDIFFDOTS="../"
FOLDERDIFF="$FOLDERDIFFDOTS""$FOLDERDIFFDOTS"
SCRIPTFOLDERDIFF="$SCRIPTDIR"/"$FOLDERDIFF"

## Script Vars DIR
SCRIPTVARSDIR="$SCRIPTFOLDERDIFF"scriptvars/

## Static Vars Location
STATICVARS="$SCRIPTVARSDIR"staticvariables.sh

if
[[ -f $STATICVARS ]]
then
  source $STATICVARS
else
  echo "Static Vars File Missing, Exiting."
  exit
fi

if
[[ ! -f $TEMPVARS ]]
then
  touch $TEMPVARS
fi

if
[[ -f $TEMPVARS ]]
then
  source $TEMPVARS
else
  echo "Temp Vars File Missing, Exiting."
  exit
fi

## Log File
RECENTRUN="$TOPLEVELSCRIPTSLOGSDIR""$SCRIPTBASEFOLDERNAME".md

echo "$MAINREPOFOLDERGITTAG" | tee --append $RECENTRUN &>/dev/null
echo "$MAINRECENTRUNLOGMDGITTAG" | tee --append $RECENTRUN &>/dev/null
echo "____________________________________" | tee --append $RECENTRUN &>/dev/null
echo "# $TOPLEVELSUBDIRSCRIPTTEXT" | tee --append $RECENTRUN &>/dev/null
