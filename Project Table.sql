insert into category (category_name) values ('Repairs');

select * from project

insert into material (project_id,material_name,num_required)
values (10,'Package of door hangers from Home Depot',1)

insert into step (project_id,step_text,step_order)
values (10, 'Screw hangers into frame', 3);

insert into project_category (project_id,category_id)
values (10,3);