BEGIN{
   highest_pkt_id=0
}

{
event=$1
time=$3
pkt_id=$41

if(pkt_id > highest_pkt_id) highest_pky_id=pkt_id
if(start_time[pkt_id] == 0) start_time[pkt_id] = time

if(event != "d"){
  if(event == "r"){
    end_time[pkt_id] = time
  }
} 
else {
  end_time[pky_id]=-1
}
}

END{
pkt_duration

for(pkt_id=0;pkt_id <= highest_pkt_id; pkt_id++) {
  start = start_time[pkt_id]
  end = end_time[pkt_id]
  if(start<end) pkt_duration = end-start
}
printf("Average end to end delay: %f\n", pkt_duration)
}
