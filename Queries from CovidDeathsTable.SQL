SELECT
  *
FROM
  `CovidDeaths.CovidDeathsTable`
WHERE
  continent IS NOT NULL
ORDER BY
  3,
  4 
  /*select the data */

SELECT
  Location,
  date,
  total_cases,
  new_cases,
  total_deaths,
  population
FROM
  `CovidDeaths.CovidDeathsTable`
WHERE
  continent IS NOT NULL
ORDER BY
  1,
  2 
  /*Shows likelihood of dying if you contract COVID in a particular country*/
SELECT
  Location,
  date,
  total_cases,
  total_deaths,
  (total_deaths/total_cases)*100 AS DeathPercentage
FROM
  `CovidDeaths.CovidDeathsTable`
WHERE
  continent IS NOT NULL
ORDER BY
  1,
  2 /*case percentage*/
SELECT
  Location,
  date,
  total_cases,
  population,
  (total_cases/population)*100 AS CasePercentage
FROM
  `CovidDeaths.CovidDeathsTable`
WHERE
  continent IS NOT NULL
ORDER BY
  1,
  2 /*Countries with highest infection rate*/
SELECT
  Location,
  Population,
  MAX(total_cases) AS HighestInfectionCount,
  MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM
  `CovidDeaths.CovidDeathsTable`
WHERE
  continent IS NOT NULL
GROUP BY
  location,
  population
ORDER BY
  PercentPopulationInfected DESC /*Countries with highest death count*/
SELECT
  Location,
  MAX(CAST(Total_deaths AS int)) AS TotalDeathCount
FROM
  `CovidDeaths.CovidDeathsTable`
WHERE
  continent IS NOT NULL
GROUP BY
  location
ORDER BY
  TotalDeathCount DESC /*continents with the highest death count*/
SELECT
  continent,
  MAX(CAST(Total_deaths AS int)) AS TotalDeathCount
FROM
  `CovidDeaths.CovidDeathsTable`
WHERE
  continent IS NOT NULL
GROUP BY
  continent
ORDER BY
  TotalDeathCount DESC /*global numbers*/
SELECT
  SUM(CAST(new_cases AS int)) AS TotalCases,
  SUM(CAST(new_deaths AS int)) AS TotalDeaths,
  ((SUM(CAST(new_deaths AS int)))/(SUM(CAST(new_cases AS int)))*100) AS DeathPercentage
FROM
  `CovidDeaths.CovidDeathsTable`
WHERE
  continent IS NOT NULL
ORDER BY
  1,
  2 /*Join CovidDeathsTable and CovidVaccinationTable*/
SELECT
  *
FROM
  `CovidDeaths.CovidDeathsTable`dea
JOIN
  `CovidDeaths.CovidVaccinationsTable` vac
ON
  dea.location=vac.location
  AND dea.date=vac.date
WHERE
  continent IS NOT NULL 
  /*Population and new vaccination*/
SELECT
  dea.continent,
  dea.location,
  dea.date,
  dea.population,
  vac.new_vaccinations
FROM
  `CovidDeaths.CovidDeathsTable`dea
JOIN
  `CovidDeaths.CovidVaccinationsTable` vac
ON
  dea.location=vac.location
  AND dea.date=vac.date
WHERE
  dea.continent IS NOT NULL
ORDER BY
  2,
  3

