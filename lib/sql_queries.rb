# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end
# Make sure each ruby method returns a string containing a valid SQL statement.
# projects (id, title, category, funding_goal, start_date, end_date)
# users (id, name, age)
# pledges (id, amount, user_id, project_id)

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_title
  "SELECT p.title, SUM(pl.amount)
  FROM projects AS p
  INNER JOIN pledges AS pl
  ON p.id = pl.project_id
  GROUP BY p.title
  ORDER BY p.title"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
  "SELECT u.name, u.age, SUM(pl.amount)
  FROM users AS u
  INNER JOIN pledges AS pl
  ON u.id = pl.user_id
  GROUP BY u.name
  ORDER BY u.name"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  "SELECT pro.title, (SUM(pl.amount) - pro.funding_goal) AS over_goal
  FROM projects AS pro
  INNER JOIN pledges AS pl
  ON pro.id = pl.project_id
  GROUP BY pro.title
  HAVING over_goal >= 0"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_summed_amount
  "SELECT u.name, SUM(pl.amount)
  FROM users AS u
  INNER JOIN pledges AS pl
  ON u.id = pl.user_id
  GROUP BY u.name
  ORDER BY SUM(pl.amount);"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  "SELECT pro.category, pl.amount
   FROM projects AS pro
   INNER JOIN pledges AS pl
   ON pro.id = pl.project_id
   WHERE pro.category = 'music'"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  "SELECT pro.category, SUM(pl.amount)
  FROM projects AS pro
  INNER JOIN pledges AS pl
  ON pro.id = pl.project_id
  GROUP BY pro.category
  HAVING pro.category = 'books'"
end
