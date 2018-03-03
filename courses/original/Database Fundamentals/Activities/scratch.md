## On queries:

In a database, a **query** is a set of structured statements designed to extract specific records from a database. While designing, implementing, and managing a database will usually fall to someone with a deep understanding of databases, queries may be used by less technical members of a team who need to answer questions with data.

For example, let's consider a construction company's database of employees, projects, employees working on projects, and job orders placed by employees. Perhaps the original design and implementation of the database was performed by an information technology (IT) firm that the construction company hired. The IT firm provided a dashboard for entering new data and some basic functionality for extracting data to answer basic questions, which works for the day-to-day uses of the construction company.

However, the company now needs some more advanced questions answered. They've identified that several of their projects are running over budget, and they suspect that someone may be billing their materials to different projects (perhaps intentionally!).

To do this, they hire someone to write a series of `SELECT` queries to extract data that can answer those questions.