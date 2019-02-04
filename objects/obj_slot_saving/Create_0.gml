/// @description setup
/*
Phase 0: black rectangle moving to cover the screen
Phase 1: fetching all data
Phase 2: parsing all data into chunks
Phase 3: encrypting all chunks
Phase 4: writing all chunks to the file
Phase 5: black rectangle moving out
*/
intro=0;
phase=0;

progress=0;
progress_max=17;
inst_id[0]=-4;
inst_index=0;
inst_count=-4;

line[0]="";

chunk[0]="";
chunk_length=global.save_chunk_size;

data="";
separator="###";
clock=1;
interval=2*(global.save_chunk_size<=500);

slot_name="";
fname="";
fullname="";
save_key="";
file=-1;
initial_seed=0;

busy++;

/* */
/*  */
