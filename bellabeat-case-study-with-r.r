{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "195d24d9",
   "metadata": {
    "papermill": {
     "duration": 0.020906,
     "end_time": "2024-01-24T14:37:44.731315",
     "exception": false,
     "start_time": "2024-01-24T14:37:44.710409",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# About a company\n",
    "\n",
    "Bellabeat, a high-tech manufacturer of health-focused products for women. Bellabeat is a successful small company, but they have the potential to become a larger player in the global smart device market. Urška Sršen, cofounder and Chief Creative Officer of Bellabeat, believes that analyzing smart device fitness data could help unlock new growth opportunities for the company\n",
    "\n",
    "# Questions for the analysis\n",
    "\n",
    "1. What are some trends in smart device usage? \n",
    "2. How could these trends apply to Bellabeat customers? \n",
    "3. How could these trends help influence Bellabeat marketing strategy\n",
    "\n",
    "# Business task\n",
    "\n",
    "Identify potential opportunities for growth and recommendations for the Bellabeat marketing strategy improvement based on trends in smart device usage.\n",
    "\n",
    "# Loading packages\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "57555dcc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-24T14:37:44.782583Z",
     "iopub.status.busy": "2024-01-24T14:37:44.779498Z",
     "iopub.status.idle": "2024-01-24T14:37:46.962153Z",
     "shell.execute_reply": "2024-01-24T14:37:46.959650Z"
    },
    "papermill": {
     "duration": 2.20869,
     "end_time": "2024-01-24T14:37:46.962459",
     "exception": false,
     "start_time": "2024-01-24T14:37:44.753769",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.0 ──\n",
      "\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.3     \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.1     \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.5\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.1.3     \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 1.4.0     \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.0\n",
      "\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "\n",
      "Attaching package: ‘magrittr’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:purrr’:\n",
      "\n",
      "    set_names\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:tidyr’:\n",
      "\n",
      "    extract\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘janitor’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:stats’:\n",
      "\n",
      "    chisq.test, fisher.test\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)\n",
    "library(magrittr) \n",
    "library(skimr)\n",
    "library(janitor)\n",
    "library(ggplot2)\n",
    "library(ggpubr)\n",
    "library(dplyr)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "cff205ae",
   "metadata": {
    "papermill": {
     "duration": 0.023614,
     "end_time": "2024-01-24T14:37:47.011863",
     "exception": false,
     "start_time": "2024-01-24T14:37:46.988249",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Importing datasets\n",
    "For this project, I will use FitBit Fitness Tracker [Data](https://www.kaggle.com/arashnic/fitbit)."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "8b73e474",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-24T14:37:47.112248Z",
     "iopub.status.busy": "2024-01-24T14:37:47.064768Z",
     "iopub.status.idle": "2024-01-24T14:37:47.224756Z",
     "shell.execute_reply": "2024-01-24T14:37:47.222686Z"
    },
    "papermill": {
     "duration": 0.190348,
     "end_time": "2024-01-24T14:37:47.224993",
     "exception": false,
     "start_time": "2024-01-24T14:37:47.034645",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "activity <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/dailyActivity_merged.csv\")\n",
    "steps <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/hourlySteps_merged.csv\")\n",
    "sleep <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/sleepDay_merged.csv\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "91c6e8df",
   "metadata": {
    "papermill": {
     "duration": 0.023088,
     "end_time": "2024-01-24T14:37:47.272837",
     "exception": false,
     "start_time": "2024-01-24T14:37:47.249749",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "I already checked the data in Google Sheets. I just need to make sure that everything were imported correctly by using View() and head() functions."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "d02198bd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-24T14:37:47.326014Z",
     "iopub.status.busy": "2024-01-24T14:37:47.324059Z",
     "iopub.status.idle": "2024-01-24T14:37:47.389187Z",
     "shell.execute_reply": "2024-01-24T14:37:47.386946Z"
    },
    "papermill": {
     "duration": 0.093891,
     "end_time": "2024-01-24T14:37:47.389405",
     "exception": false,
     "start_time": "2024-01-24T14:37:47.295514",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t940 obs. of  15 variables:\n",
      " $ Id                      : num  1.5e+09 1.5e+09 1.5e+09 1.5e+09 1.5e+09 ...\n",
      " $ ActivityDate            : Factor w/ 31 levels \"4/12/2016\",\"4/13/2016\",..: 1 2 3 4 5 6 7 8 9 10 ...\n",
      " $ TotalSteps              : int  13162 10735 10460 9762 12669 9705 13019 15506 10544 9819 ...\n",
      " $ TotalDistance           : num  8.5 6.97 6.74 6.28 8.16 ...\n",
      " $ TrackerDistance         : num  8.5 6.97 6.74 6.28 8.16 ...\n",
      " $ LoggedActivitiesDistance: num  0 0 0 0 0 0 0 0 0 0 ...\n",
      " $ VeryActiveDistance      : num  1.88 1.57 2.44 2.14 2.71 ...\n",
      " $ ModeratelyActiveDistance: num  0.55 0.69 0.4 1.26 0.41 ...\n",
      " $ LightActiveDistance     : num  6.06 4.71 3.91 2.83 5.04 ...\n",
      " $ SedentaryActiveDistance : num  0 0 0 0 0 0 0 0 0 0 ...\n",
      " $ VeryActiveMinutes       : int  25 21 30 29 36 38 42 50 28 19 ...\n",
      " $ FairlyActiveMinutes     : int  13 19 11 34 10 20 16 31 12 8 ...\n",
      " $ LightlyActiveMinutes    : int  328 217 181 209 221 164 233 264 205 211 ...\n",
      " $ SedentaryMinutes        : int  728 776 1218 726 773 539 1149 775 818 838 ...\n",
      " $ Calories                : int  1985 1797 1776 1745 1863 1728 1921 2035 1786 1775 ...\n",
      "'data.frame':\t22099 obs. of  3 variables:\n",
      " $ Id          : num  1.5e+09 1.5e+09 1.5e+09 1.5e+09 1.5e+09 ...\n",
      " $ ActivityHour: Factor w/ 736 levels \"4/12/2016 1:00:00 AM\",..: 7 1 9 11 13 15 17 19 21 23 ...\n",
      " $ StepTotal   : int  373 160 151 0 0 0 0 0 250 1864 ...\n",
      "'data.frame':\t413 obs. of  5 variables:\n",
      " $ Id                : num  1.5e+09 1.5e+09 1.5e+09 1.5e+09 1.5e+09 ...\n",
      " $ SleepDay          : Factor w/ 31 levels \"4/12/2016 12:00:00 AM\",..: 1 2 4 5 6 8 9 10 12 13 ...\n",
      " $ TotalSleepRecords : int  1 2 1 2 1 1 1 1 1 1 ...\n",
      " $ TotalMinutesAsleep: int  327 384 412 340 700 304 360 325 361 430 ...\n",
      " $ TotalTimeInBed    : int  346 407 442 367 712 320 377 364 384 449 ...\n"
     ]
    }
   ],
   "source": [
    "str(activity)\n",
    "str(steps)\n",
    "str(sleep)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d0766883",
   "metadata": {
    "papermill": {
     "duration": 0.023738,
     "end_time": "2024-01-24T14:37:47.437116",
     "exception": false,
     "start_time": "2024-01-24T14:37:47.413378",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "c4e42e2d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-24T14:34:48.988537Z",
     "iopub.status.busy": "2024-01-24T14:34:48.987600Z",
     "iopub.status.idle": "2024-01-24T14:34:49.019651Z"
    },
    "papermill": {
     "duration": 0.023616,
     "end_time": "2024-01-24T14:37:47.484500",
     "exception": false,
     "start_time": "2024-01-24T14:37:47.460884",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "e9438bb2",
   "metadata": {
    "papermill": {
     "duration": 0.023684,
     "end_time": "2024-01-24T14:37:47.532269",
     "exception": false,
     "start_time": "2024-01-24T14:37:47.508585",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Now that everything is ready, I can start exploring data sets.\n",
    "\n",
    "# Exploring and summarizing data"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4adfa70d",
   "metadata": {
    "papermill": {
     "duration": 0.023534,
     "end_time": "2024-01-24T14:37:47.580751",
     "exception": false,
     "start_time": "2024-01-24T14:37:47.557217",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "58f43216",
   "metadata": {
    "papermill": {
     "duration": 0.023536,
     "end_time": "2024-01-24T14:37:47.628033",
     "exception": false,
     "start_time": "2024-01-24T14:37:47.604497",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "5f5f769b",
   "metadata": {
    "papermill": {
     "duration": 0.023672,
     "end_time": "2024-01-24T14:37:47.675352",
     "exception": false,
     "start_time": "2024-01-24T14:37:47.651680",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "a27368c3",
   "metadata": {
    "papermill": {
     "duration": 0.023598,
     "end_time": "2024-01-24T14:37:47.722320",
     "exception": false,
     "start_time": "2024-01-24T14:37:47.698722",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "This information tells us about number participants in each data sets. \n",
    "\n",
    "There is 33 participants in the activity, calories and intensities data sets, 24 in the sleep and only 8 in the weight data set. 8 participants is not significant to make any recommendations and conclusions based on this data.\n",
    "\n",
    "Let’s have a look at summary statistics of the data sets:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "33adc3c2",
   "metadata": {
    "papermill": {
     "duration": 0.023361,
     "end_time": "2024-01-24T14:37:47.769177",
     "exception": false,
     "start_time": "2024-01-24T14:37:47.745816",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "de08aef2",
   "metadata": {
    "papermill": {
     "duration": 0.023363,
     "end_time": "2024-01-24T14:37:47.816013",
     "exception": false,
     "start_time": "2024-01-24T14:37:47.792650",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Some interesting discoveries from this summary:**\n",
    "\n",
    "* Average sedentary time is 991 minutes or 16 hours. Definately needs to be reduced!\n",
    "\n",
    "* The majority of the participants are lightly active.\n",
    "\n",
    "* On the average, participants sleep 1 time for 7 hours.\n",
    "\n",
    "* Average total steps per day are 7638 which a little bit less for having health benefits for according to the CDC research. They found that taking 8,000 steps per day was associated with a 51% lower risk for all-cause mortality (or death from all causes). Taking 12,000 steps per day was associated with a 65% lower risk compared with taking 4,000 steps.\n",
    "\n",
    "# Merging data\n",
    "\n",
    "Before beginning to visualize the data, I need to merge two data sets. I’m going to merge (inner join) activity and sleep on columns Id and date (that I previously created after converting data to date time format)."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "7280eeb5",
   "metadata": {
    "papermill": {
     "duration": 0.023727,
     "end_time": "2024-01-24T14:37:47.864501",
     "exception": false,
     "start_time": "2024-01-24T14:37:47.840774",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "772125e1",
   "metadata": {
    "papermill": {
     "duration": 0.023832,
     "end_time": "2024-01-24T14:37:47.913042",
     "exception": false,
     "start_time": "2024-01-24T14:37:47.889210",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Visualization"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "ec60ce1c",
   "metadata": {
    "papermill": {
     "duration": 0.023607,
     "end_time": "2024-01-24T14:37:47.960783",
     "exception": false,
     "start_time": "2024-01-24T14:37:47.937176",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "808c47bf",
   "metadata": {
    "papermill": {
     "duration": 0.024441,
     "end_time": "2024-01-24T14:37:48.009664",
     "exception": false,
     "start_time": "2024-01-24T14:37:47.985223",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "I see positive correlation here between Total Steps and Calories, which is obvious - the more active we are, the more calories we burn."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "40747c7d",
   "metadata": {
    "papermill": {
     "duration": 0.024261,
     "end_time": "2024-01-24T14:37:48.057806",
     "exception": false,
     "start_time": "2024-01-24T14:37:48.033545",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "2d06069a",
   "metadata": {
    "papermill": {
     "duration": 0.023759,
     "end_time": "2024-01-24T14:37:48.105437",
     "exception": false,
     "start_time": "2024-01-24T14:37:48.081678",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The relationship between Total Minutes Asleep and Total Time in Bed looks linear. **So if the Bellabeat users want to improve their sleep, we should consider using notification to go to sleep.**\n",
    "\n",
    "\n",
    "Let's look at **intensities data** over time (hourly)."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "cbd464b0",
   "metadata": {
    "papermill": {
     "duration": 0.024361,
     "end_time": "2024-01-24T14:37:48.153511",
     "exception": false,
     "start_time": "2024-01-24T14:37:48.129150",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "69c2072f",
   "metadata": {
    "papermill": {
     "duration": 0.025104,
     "end_time": "2024-01-24T14:37:48.202481",
     "exception": false,
     "start_time": "2024-01-24T14:37:48.177377",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* After visualizing Total Intensity hourly, I found out that people are more active between 5 am and 10pm.\n",
    "\n",
    "* Most activity happens between 5 pm and 7 pm - I suppose, that people go to a gym or for a walk after finishing work. We can **use this time in the Bellabeat app to remind and motivate users to go for a run or walk.**\n",
    "\n",
    "Let's look at the relationship between Total Minutes Asleep and Sedentry Minutes."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "25277213",
   "metadata": {
    "papermill": {
     "duration": 0.024104,
     "end_time": "2024-01-24T14:37:48.250458",
     "exception": false,
     "start_time": "2024-01-24T14:37:48.226354",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "269a2244",
   "metadata": {
    "papermill": {
     "duration": 0.024968,
     "end_time": "2024-01-24T14:37:48.300607",
     "exception": false,
     "start_time": "2024-01-24T14:37:48.275639",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Here we can clearly see the negative relationship between Sedentary Minutes and Sleep time.\n",
    "\n",
    "* As an idea: **if Bellabeat users want to improve their sleep, Bellabeat app can recommend reducing sedentary time.**\n",
    "\n",
    "* Keep in mind that we need to support this insights with more data, because correlation between some data doesn’t mean causation.\n",
    "\n",
    "\n",
    "# Summarizing recommendations for the business\n",
    "\n",
    "As we already know, collecting data on activity, sleep, stress, and reproductive health has allowed Bellabeat to empower women with knowledge about their own health and habits. Since it was founded in 2013, Bellabeat has grown rapidly and quickly positioned itself as a tech-driven wellness company for women.\n",
    "\n",
    "After analyzing FitBit Fitness Tracker Data, I found some **insights that would help influence Bellabeat marketing strategy.**\n",
    "\n",
    "![](https://images.unsplash.com/photo-1523395294292-1fbf0cd2435e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=759&q=80)\n",
    "\n",
    "**Target audience**\n",
    "\n",
    "Women who work full-time jobs (according to the hourly intensity data) and spend a lot of time at the computer/in a meeting/ focused on work they are doing (according to the sedentary time data).\n",
    "\n",
    "These women do some light activity to stay healthy (according to the activity type analysis). Even though they need to improve their everyday activity to have health benefits. They might need some knowledge about developing healthy habits or motivation to keep going. \n",
    "\n",
    "* As there is no gender information about the participants, I assumed that all genders were presented and balanced in this data set. \n",
    "\n",
    "**The key message for the Bellabeat online campaign**\n",
    "\n",
    "The Bellabeat app is not just another fitness activity app. \n",
    "It’s a guide (a friend) who empowers women to balance full personal and professional life and healthy habits and routines by educating and motivating them through daily app recommendations. \n",
    "\n",
    "**Ideas for the Bellabeat app**\n",
    "\n",
    "1. Average total steps per day are 7638 which a little bit less for having health benefits for according to the CDC research. They found that taking 8,000 steps per day was associated with a 51% lower risk for all-cause mortality (or death from all causes). Taking 12,000 steps per day was associated with a 65% lower risk compared with taking 4,000 steps. Bellabeat can encourage people to take at least 8 000 explaining the benefits for their health.\n",
    "\n",
    "2. If users want to lose weight, it’s probably a good idea to control daily calorie consumption. Bellabeat can suggest some ideas for low-calorie lunch and dinner.\n",
    "\n",
    "3. If users want to improve their sleep, Bellabeat should consider using app notifications to go to bed.\n",
    "\n",
    "4. Most activity happens between 5 pm and 7 pm - I suppose, that people go to a gym or for a walk after finishing work. Bellabeat can use this time to remind and motivate users to go for a run or walk.\n",
    "\n",
    "5. As an idea: if users want to improve their sleep, the Bellabeat app can recommend reducing sedentary time.\n",
    "\n",
    "\n",
    "**Thank you** for your interest to my Bellabeat Case Study!\n",
    "\n",
    "This is my first project using R. I would appreciate any comments and recommendations for improvement!\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8352785f",
   "metadata": {
    "papermill": {
     "duration": 0.023764,
     "end_time": "2024-01-24T14:37:48.349445",
     "exception": false,
     "start_time": "2024-01-24T14:37:48.325681",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "datasetId": 1041311,
     "sourceId": 1752235,
     "sourceType": "datasetVersion"
    }
   ],
   "dockerImageVersionId": 30099,
   "isGpuEnabled": false,
   "isInternetEnabled": false,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "3.6.3"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 7.455016,
   "end_time": "2024-01-24T14:37:48.499547",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-01-24T14:37:41.044531",
   "version": "2.3.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
