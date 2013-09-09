/*
* libtcod 1.5.0
* Copyright (c) 2008,2009,2010 Jice
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*     * Redistributions of source code must retain the above copyright
*       notice, this list of conditions and the following disclaimer.
*     * Redistributions in binary form must reproduce the above copyright
*       notice, this list of conditions and the following disclaimer in the
*       documentation and/or other materials provided with the distribution.
*     * The name of Jice may not be used to endorse or promote products
*       derived from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY Jice ``AS IS'' AND ANY
* EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL Jice BE LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
module amp.tcod.path;
extern (C):

import amp.tcod.fov;

alias TCOD_path_func_t = float function(int, int, int, int, void*);
alias TCOD_path_t = void*;

TCOD_path_t TCOD_path_new_using_map(TCOD_map_t map, float diagonalCost);
TCOD_path_t TCOD_path_new_using_function(int map_width, int map_height, TCOD_path_func_t func, void *user_data, float diagonalCost);

bool TCOD_path_compute(TCOD_path_t path, int ox,int oy, int dx, int dy);
bool TCOD_path_walk(TCOD_path_t path, int *x, int *y, bool recalculate_when_needed);
bool TCOD_path_is_empty(TCOD_path_t path);
int TCOD_path_size(TCOD_path_t path);
void TCOD_path_get(TCOD_path_t path, int index, int *x, int *y);
void TCOD_path_get_origin(TCOD_path_t path, int *x, int *y);
void TCOD_path_get_destination(TCOD_path_t path, int *x, int *y);
void TCOD_path_delete(TCOD_path_t path);

/* Dijkstra stuff - by Mingos*/

alias TCOD_dijkstra_t = void*;

TCOD_dijkstra_t TCOD_dijkstra_new (TCOD_map_t map, float diagonalCost);
TCOD_dijkstra_t TCOD_dijkstra_new_using_function(int map_width, int map_height, TCOD_path_func_t func, void *user_data, float diagonalCost);
void TCOD_dijkstra_compute (TCOD_dijkstra_t dijkstra, int root_x, int root_y);
float TCOD_dijkstra_get_distance (TCOD_dijkstra_t dijkstra, int x, int y);
bool TCOD_dijkstra_path_set (TCOD_dijkstra_t dijkstra, int x, int y);
bool TCOD_dijkstra_is_empty(TCOD_dijkstra_t path);
int TCOD_dijkstra_size(TCOD_dijkstra_t path);
void TCOD_dijkstra_get(TCOD_dijkstra_t path, int index, int *x, int *y);
bool TCOD_dijkstra_path_walk (TCOD_dijkstra_t dijkstra, int *x, int *y);
void TCOD_dijkstra_delete (TCOD_dijkstra_t dijkstra);

