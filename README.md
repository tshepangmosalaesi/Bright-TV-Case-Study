# BrightTV Case Study

## 1. Overview of the Case Study

- BrightTV's CEO aims to **grow the company's subscription base** during the financial year and requires data-driven insights to assist the Customer Value Management (CVM) team in achieving this objective.
- This project analyses BrightTV's user profiles and viewing transactions from **January to March 2016** to understand consumption patterns, audience behaviour and opportunities for business growth.
- The analysis addresses four key questions from the case study:
  - **User and Usage Trends:** What are the main trends in BrightTV's user activity and content consumption?
  - **Consumption Drivers:** What factors influence how and when subscribers consume content?
  - **Low-Consumption Days:** What content should BrightTV offer to increase consumption on days with low viewing activity?
  - **User Base Growth:** What initiatives could help BrightTV attract more users and grow its subscription base?
- The findings are presented through interactive dashboards and a final business presentation containing recommendations for the CEO and CVM team.

## 2. Process – How the Case Study Was Done

- **Step 1 – Business Understanding:** Reviewed the case study instructions, identified the four business questions and defined relevant KPIs for measuring viewership and engagement.
- **Step 2 – Project Planning:** Used Miro to develop a project mind map and Gantt chart outlining the workflow, activities and deliverables.
- **Step 3 – Data Preparation:** Imported the User Profile and Viewership datasets, checked for missing values, duplicates and data inconsistencies, and prepared the data for analysis.
- **Step 4 – Data Transformation:** Used Databricks SQL to join the datasets using `UserID`, convert UTC timestamps to South African time (UTC+2), create date and time fields, and prepare viewing-duration and demographic measures. Each viewing transaction was treated as one viewing session, as specified in the case study.
- **Step 5 – Exploratory Analysis:** Analysed monthly usage trends, viewing frequency, channel performance, consumption by day and hour, and audience demographics using SQL and Excel.
- **Step 6 – Dashboard Development:** Created interactive dashboards covering overall performance, channel performance, viewer behaviour, audience segmentation, and insights and recommendations.
- **Step 7 – Presentation and Recommendations:** Interpreted the results against the four business questions and prepared a final Canva presentation for BrightTV's CEO and CVM team.

## 3. Tools Used

- **Databricks SQL:** Data cleaning, joining datasets, transformation, KPI calculations and analysis.
- **Microsoft Excel:** Data exploration, validation, PivotTables and charts.
- **Databricks Dashboards:** Interactive dashboard development and visualisation of insights.
- **Power BI:** Business intelligence dashboards and visualisation.
- **Google Looker Studio:** Interactive reporting and data visualisation.
- **Lovable:** Dashboard design and presentation of analytical findings.
- **Miro:** Project planning, mind mapping and Gantt chart development.
- **Canva:** Designing the final case study presentation.
- **Microsoft PowerPoint:** Presentation preparation.
- **GitHub:** Project documentation, version control and organisation of deliverables.

## 4. Summary of What Was Done and Found (Insights)

### 4.1 User and Usage Trends

- Analysed **9,995 viewing sessions**, representing approximately **1,522 hours of consumption** across 16 channels, with an average session duration of 9.1 minutes.
- Viewing sessions increased by **119%**, from 2,201 in January to 4,821 in March 2016.
- Live Events contributed approximately 58% of the increase in viewing sessions, indicating its importance in driving usage growth.
- Live Events was the most-consumed channel, recording **3,235 sessions (32%)** and contributing approximately 48% of total viewing hours.
- Viewers averaged 2.3 sessions per person, while the median viewer watched only once, indicating opportunities to improve repeat consumption.

### 4.2 Factors Influencing Consumption

- **Content Preference:** Live Events recorded the longest average viewing duration at 13.6 minutes, followed by strong engagement on Channel O and Trace TV.
- **Day of the Week:** Saturday (1,655 sessions) and Friday (1,640) recorded the highest consumption, while Monday (973) recorded the lowest.
- **Time of Day:** Afternoon and evening accounted for approximately 71% of viewing sessions, with the highest individual viewing hour at 17:00 (648 sessions).
- **Age:** Youth aged 20–35 contributed approximately 57% of viewing sessions, followed by adults aged 36–50 at approximately 30%.
- **Gender:** Approximately 88% of viewers were male, showing a strong concentration within one audience segment.
- **Region:** Gauteng contributed approximately 37% of sessions, followed by Western Cape at 18%, while Northern Cape, Free State and North West each contributed less than 4%.
- **Key Insight:** Consumption patterns vary across content types, viewing periods and demographic segments, providing opportunities for targeted programming and marketing.

### 4.3 Content Consumption on Low-Consumption Days

- Monday recorded the lowest consumption at **973 sessions**, approximately 41% below Saturday's 1,655 sessions.
- Monday's average session duration was 7.3 minutes compared with 10.8 minutes on Saturday.
- Live Events recorded only 186 sessions on Monday, compared with more than 600 sessions on Wednesday, Friday and Saturday.
- These findings suggest an opportunity to improve Monday and Tuesday consumption through popular live-event programming, sports highlights, music content and catch-up shows.

### 4.4 Opportunities to Grow BrightTV's User Base

- The strong performance of Live Events presents an opportunity to attract new users through popular sports and entertainment programming.
- The high proportion of youth viewers (57% of sessions) creates opportunities for digital marketing, social-media promotions and referral campaigns.
- The low representation of female viewers and certain provinces suggests potential for expanding BrightTV's audience through targeted content and marketing.
- The median viewing frequency of one session highlights an opportunity to improve retention through personalised recommendations and viewer re-engagement initiatives.

## 5. Business Recommendations

### 5.1 Increase Consumption on Low-Consumption Days

- Schedule popular live events, sports fixtures, music programmes and highlights on Monday and Tuesday evenings.
- Introduce weekend catch-up content on Mondays to encourage viewers to return after peak weekend periods.
- Promote upcoming programmes through targeted reminders and cross-promotion during high-consumption days.
- **Expected Benefit:** Increase consumption during low-performing periods and improve weekday engagement.

### 5.2 Use Popular Content to Attract New Subscribers

- Prioritise Live Events and other high-performing channels when developing content and promotional strategies.
- Offer free previews, limited-time access and promotional day passes around major live events.
- Use popular content to encourage trial users to consider paid subscriptions.
- **Expected Benefit:** Support subscriber acquisition by using content that already demonstrates strong viewer demand.

### 5.3 Improve Viewer Retention and Engagement

- Introduce personalised recommendations based on viewers' preferred channels and viewing behaviour.
- Use onboarding messages, programme reminders and targeted re-engagement campaigns to encourage one-time viewers to return.
- Promote relevant content during peak viewing periods, particularly late afternoon and evening.
- **Expected Benefit:** Improve viewing frequency, session duration and ongoing engagement.

### 5.4 Expand into Underrepresented Audience Segments

- Introduce more content and targeted marketing campaigns aimed at women, families and older viewers.
- Explore regional and local-language programming to attract viewers in Northern Cape, Free State and North West.
- Use audience segmentation to tailor promotional campaigns according to age, gender and region.
- **Expected Benefit:** Diversify BrightTV's audience and create opportunities for user base growth.

### 5.5 Introduce Marketing and Referral Initiatives

- Launch referral rewards, subscription promotions and partner bundles to encourage new user registrations.
- Focus initial promotional campaigns on established markets such as Gauteng and Western Cape while testing opportunities in underrepresented regions.
- Use consent-based email and social-media campaigns to promote popular content and upcoming live events.
- Monitor viewing engagement, new subscriptions and campaign conversion rates to evaluate the effectiveness of these initiatives.
- **Expected Benefit:** Improve customer acquisition and support the CEO's objective of growing BrightTV's subscription base.

## Conclusion

- BrightTV experienced significant viewing growth of **119%** between January and March 2016, largely supported by Live Events.
- Consumption was strongest during afternoon and evening periods and towards the weekend, while Monday presented the greatest opportunity for improvement.
- The analysis identified opportunities to increase repeat viewing, improve low-consumption days, expand audience reach and attract new subscribers.
- The recommended strategies provide the CVM team with data-driven initiatives to support **BrightTV's objective of growing its user and subscription base**.
- Subscription growth would need to be measured separately using subscriber acquisition, conversion and retention data.