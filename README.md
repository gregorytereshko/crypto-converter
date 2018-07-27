1. Rename **.env.example** to **.env** and fill db settings
2. Install dependencies with **bundle install**
3. Run **rails db:create && rails db:migrate** to create db schema
4. First run rake task for sync currencies rates **rake converter:sync_rates** and update cron tab for doing it every 5 minutes automaticly **whenever --update-crontab**
5. Run **rails s** to start the server
6. You can test API on the url: http://localhost:3000/swagger
