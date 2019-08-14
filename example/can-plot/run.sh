#!/bin/bash

BABELTRACE2="${BABELTRACE2:-babeltrace2}"

DATABASES="[\"$PWD/database.dbc\"]"
TRACES="[\"$PWD/test.data\"]"

VOLTAGE_DATA="[\"timed\", \"Voltage\", \"BATTERY\", \"VOLTAGE\"]"
CURRENT_DATA="[\"timed\", \"Current\", \"BATTERY\", \"CURRENT\"]"

VOLTAGE_PLOT="[\"Battery Voltage\", \"Time (ms)\", \"Voltage (mV)\", [$VOLTAGE_DATA]]"
CURRENT_PLOT="[\"Battery Current\", \"Time (ms)\", \"Current (A)\", [$CURRENT_DATA]]"

"$BABELTRACE2"							\
	--plugin-path=../../can --component src.can.CANSource	\
	--params="inputs=$TRACES,databases=$DATABASES"		\
	--plugin-path=../../plot --component sink.plot.PlotSink	\
	--params="plots=[$VOLTAGE_PLOT, $CURRENT_PLOT]"

