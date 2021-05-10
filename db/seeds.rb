# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# query used: select concat("User.create(username:'", mail, "', email:'", mail, "', password:'", pass, "', password_confirmation:'", pass, "');") as query from users

User.create(username:'oscarporras02@gmail.com', email:'oscarporras02@gmail.com', password:'asdf1234', password_confirmation:'asdf1234');
User.create(username:'oscarrussi@outlook.com', email:'oscarrussi@outlook.com', password:'asdf', password_confirmation:'asdf');
User.create(username:'jenny', email:'jenny', password:'asdf1234', password_confirmation:'asdf1234');
User.create(username:'smart', email:'smart', password:'asdf1234', password_confirmation:'asdf1234');
User.create(username:'suguruni2@gmail.com', email:'suguruni2@gmail.com', password:'asdf1234', password_confirmation:'asdf1234');

# query used: select concat("Techno.create(techno_name:'", t.technology, "', techno_status:", case when t.active=1 then "true" else "false" end, ", user_id: User.find_by_email('", mail ,"').id);") as query from users as u inner join technos as t on u.user_id = t.user_id;

Techno.create(techno_name:'html', techno_status:true, user_id: User.find_by_email('jenny').id);
Techno.create(techno_name:'css', techno_status:true, user_id: User.find_by_email('jenny').id);
Techno.create(techno_name:'git', techno_status:true, user_id: User.find_by_email('jenny').id);
Techno.create(techno_name:'javascript', techno_status:true, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'html', techno_status:false, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'css', techno_status:false, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'lftp', techno_status:false, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'Visual Studio Code', techno_status:true, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'github', techno_status:true, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'linux terminal', techno_status:false, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'bootstrap', techno_status:false, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'ruby', techno_status:true, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'sql', techno_status:false, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'heroku', techno_status:true, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'angular', techno_status:false, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'typescript', techno_status:true, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'node.js', techno_status:true, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'mongodb', techno_status:false, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'ubuntu', techno_status:false, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'mariaDB', techno_status:true, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'postgresql', techno_status:true, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'tailwind', techno_status:false, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'stimulus.js', techno_status:false, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'C#', techno_status:true, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'SQL Server', techno_status:true, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'rails', techno_status:true, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'Excel', techno_status:false, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'windows', techno_status:true, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'vue.js', techno_status:false, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'react', techno_status:true, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'nest.js', techno_status:true, user_id: User.find_by_email('oscarporras02@gmail.com').id);
Techno.create(techno_name:'mathematics', techno_status:true, user_id: User.find_by_email('oscarrussi@outlook.com').id);
Techno.create(techno_name:'algorithms', techno_status:true, user_id: User.find_by_email('oscarrussi@outlook.com').id);
Techno.create(techno_name:'sql queries', techno_status:true, user_id: User.find_by_email('oscarrussi@outlook.com').id);
Techno.create(techno_name:'level1', techno_status:true, user_id: User.find_by_email('smart').id);
Techno.create(techno_name:'level2', techno_status:true, user_id: User.find_by_email('smart').id);
Techno.create(techno_name:'level3', techno_status:true, user_id: User.find_by_email('smart').id);
Techno.create(techno_name:'level4', techno_status:true, user_id: User.find_by_email('smart').id);
Techno.create(techno_name:'level5', techno_status:true, user_id: User.find_by_email('smart').id);
Techno.create(techno_name:'level6', techno_status:true, user_id: User.find_by_email('smart').id);
Techno.create(techno_name:'level7', techno_status:true, user_id: User.find_by_email('smart').id);
Techno.create(techno_name:'level8', techno_status:true, user_id: User.find_by_email('smart').id);
Techno.create(techno_name:'level9', techno_status:true, user_id: User.find_by_email('smart').id);
Techno.create(techno_name:'level10', techno_status:true, user_id: User.find_by_email('smart').id);
Techno.create(techno_name:'level11', techno_status:true, user_id: User.find_by_email('smart').id);
Techno.create(techno_name:'level12', techno_status:true, user_id: User.find_by_email('smart').id);
Techno.create(techno_name:'translation', techno_status:true, user_id: User.find_by_email('suguruni2@gmail.com').id);
Techno.create(techno_name:'pronunciation', techno_status:true, user_id: User.find_by_email('suguruni2@gmail.com').id);

# query for words in SQLite:  select concat('INSERT INTO "words" ("word", "translation", "created_at", "updated_at", "user_id", "techno_id") VALUES ("',w.word,'", "',w.translation,'", date("now"), date("now"), (select id from users where email="',u.mail,'" limit 1), (select t0.id from technos as t0 inner join users as u0 on t0.user_id=u0.id where t0.techno_name="',t.technology,'" and u0.email="',u.mail,'" limit 1));') as query from words as w inner join technos as t on w.techno_id=t.techno_id inner join users as u on t.user_id=u.user_id;

# query for words in postgreSQL: select concat('INSERT INTO "words" ("word", "translation", "created_at", "updated_at", "user_id", "techno_id") VALUES (''',replace(w.word,'''', ''''''),''', ''',replace(w.translation,'''', ''''''),''', NOW(), NOW(), (select id from users where email=''',u.mail,''' limit 1), (select t0.id from technos as t0 inner join users as u0 on t0.user_id=u0.id where t0.techno_name=''',t.technology,''' and u0.email=''',u.mail,''' limit 1));') as query from words as w inner join technos as t on w.techno_id=t.techno_id inner join users as u on t.user_id=u.user_id;
