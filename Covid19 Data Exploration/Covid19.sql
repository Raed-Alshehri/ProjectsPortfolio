/*Covid 19 Data Exploration */

Select *
From Covid19..CovidDeaths
Where continent is not null 
order by 3,4

-- Select starting Data -- 
Select Location, date, total_cases, new_cases, total_deaths, population
From Covid19..CovidDeaths
Where continent is not null 
order by 1,2

-- Total Cases vs Total Deaths -- 
-- To know the likelihood of dying if you contract covid in Saudi Arabia
Select Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From Covid19..CovidDeaths
Where location like '%Saudi Arabia%'
and continent is not null 
order by 1,2

-- Total Cases vs Population -- 
--  The percentage of population infected with Covid19
Select Location, date, Population, total_cases,  (total_cases/population)*100 as PercentPopulationInfected
From Covid19..CovidDeaths
Where location like '%Saudi Arabia%'
order by 1,2

-- Countries with Highest Infection Rate compared to Population
Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From Covid19..CovidDeaths
--Where location like '%Saudi Arabia%'
Group by Location, Population
order by PercentPopulationInfected desc

-- Countries with Highest Death Count per Population
Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From Covid19..CovidDeaths
Where continent is not null 
Group by Location
order by TotalDeathCount desc

-- Contintents with the highest death count per population
Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From Covid19..CovidDeaths
Where continent is not null 
Group by continent
order by TotalDeathCount desc

-- Global number of death
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From Covid19..CovidDeaths
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2

-- Total Population vs Vaccinations: Percentage of Population that has recieved at least one Covid Vaccine
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From Covid19..CovidDeaths dea
Join Covid19..CovidVaccinations vac On dea.location = vac.location and dea.date = vac.date
where dea.continent is not null 
order by 2,3

-- Calculating the proportion of vaccinated people: (new column) in Total Population vs Vaccinations
With PopvsVac(Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From Covid19..CovidDeaths dea
Join Covid19..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
)
Select *, (RollingPeopleVaccinated/Population)*100
From PopvsVac

-- Creating View to store data for later visualizations
Create View PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From Covid19..CovidDeaths dea
Join Covid19..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 

