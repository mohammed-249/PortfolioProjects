Select*
From PortfolioProjects..CovidDeaths
Order By 3,4

Select*
From PortfolioProjects..CovidVaccinations
Order By 3,4

-- selecting only the data that I'm going to work in from the table 
Select Location, Date, Total_Cases, New_Cases, total_deaths, population
from PortfolioProjects..CovidDeaths 
Order by 1,2

-- showing the likelihood of dying if your are infected in Sudan
Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage 
from PortfolioProjects..CovidDeaths
where location = 'Sudan'
order by 1,2


-- looking at the total cases vs the population (the percentage of population being enfected by covid)
Select location, date, total_cases, population, (total_cases/population)*100 as percentage_of_population_infected
from PortfolioProjects..CovidDeaths
where location = 'Sudan'


-- looking at countries with hightest infection rate compared to it's population 
Select Location, population, MAX(Total_cases) as hightInfectionCount, MAX((total_cases/population)*100) as percentage_of_population_infected 
from PortfolioProjects..CovidDeaths
--where location = 'Sudan'
group by location, population 
order by 4 desc


--looking at countries with highest death counts per population
Select Location, MAX(cast(Total_deaths as int)) as hightDeathCount, MAX((cast(Total_deaths as int)/population)*100) as percentage_of_population_Died
from PortfolioProjects..CovidDeaths
--where location = 'Sudan'
where continent is not null
group by location 
order by hightDeathCount desc



-- looking at things by continent 
Select Location, MAX(cast(Total_deaths as int)) as hightDeathCount, MAX((cast(Total_deaths as int)/population)*100) as percentage_of_population_Died
from PortfolioProjects..CovidDeaths
--where location = 'Sudan'
where continent is null
group by Location
order by hightDeathCount desc


-- looking at things globally 
Select SUM(new_cases) as new_cases_globaly, SUM(cast(new_deaths as int)) as new_deaths_globaly, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as death_percentage
FROM PortfolioProjects..CovidDeaths
where continent is not null
--group by date
order by 1,2




with PopvsVac (continent, location, date, population, new_vaccinations, Rolling_People_Vaccinated)
as
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as int)) OVER (partition by dea.location order by dea.location, dea.date) as Rolling_People_vaccinated
from  PortfolioProjects..CovidVaccinations vac
join PortfolioProjects..CovidDeaths dea
on vac.date = dea.date
and vac.location = dea.location
where dea.continent is not null 
--order by 2,3
)
select *, (Rolling_People_Vaccinated/population)*100 as percentage
from PopvsVac


--Temp Table
DROP table if exists #Matshi
create table #Matshi 
(
Continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric,
Rolling_People_Vaccinated numeric
)
insert into #Matshi
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as int)) OVER (partition by dea.location order by dea.location, dea.date) as Rolling_People_vaccinated
from  PortfolioProjects..CovidVaccinations vac
join PortfolioProjects..CovidDeaths dea
on vac.date = dea.date
and vac.location = dea.location
where dea.continent is not null 
--order by 2,3

select *, (Rolling_People_Vaccinated/population)*100 as percentage
from #Matshi






-- creating view for later data visualizations

create view Matshi as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as int)) OVER (partition by dea.location order by dea.location, dea.date) as Rolling_People_vaccinated
from  PortfolioProjects..CovidVaccinations vac
join PortfolioProjects..CovidDeaths dea
on vac.date = dea.date
and vac.location = dea.location
where dea.continent is not null 
--order by 2,3
