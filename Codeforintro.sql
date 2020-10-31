select et.event_type_desc, le.year, p.place_type_desc, p.city_name, p.city_code,
p.place_name, le.le_comment_text, i.interaction_type_name, i.interaction_detail_text, pn.first_name, pn.last_name
from life_event le inner join event_type et on et.event_type_code = le.event_type_code
inner join hero h on h.hero_id = le.hero_id
inner join place p on p.place_id = le.place_id
left join interaction i on i.le_sequence_nbr = le.le_sequence_nbr and i.hero_id = le.hero_id
left join person pn on i.place_id = pn.person_id
order by le.year;

/* changes the last left join with i.place_id in place of ‘i.person_id’ and also changed ‘p.state_code’ with ‘p.city_code’ as in Pakistan we have no concept of states.
