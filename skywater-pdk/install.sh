#!/bin/bash

mkdir -p $PDK_ROOT
git clone ${SKYWATER_PDK_REPO_URL} $PDK_ROOT/skywater-pdk/
cd $PDK_ROOT/skywater-pdk/
git checkout main
#git checkout -qf ${SKYWATER_PDK_REPO_COMMIT}
git submodule init libraries/sky130_fd_pr/latest
git submodule init libraries/sky130_fd_io/latest
git submodule init libraries/sky130_fd_sc_hd/latest
git submodule init libraries/sky130_fd_sc_hvl/latest
#git submodule update --init libraries/sky130_fd_pr_reram/latest && \
#git submodule update --init libraries/sky130_fd_sc_lp/latest  && \
#git submodule update --init libraries/sky130_fd_sc_hs/latest  && \
#git submodule update --init libraries/sky130_fd_sc_ms/latest  && \
#git submodule update --init libraries/sky130_fd_sc_ls/latest  && \
#git submodule update --init libraries/sky130_fd_sc_hdll/latest &&
git submodule update
make timing

#python3 -m pip install -e scripts/python-skywater-pdk
#mv ${PDK_ROOT}/make_timing.py .
#mv ${PDK_ROOT}/corners.yml .
#python3 ./make_timing.py
