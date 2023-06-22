select*
from PortfolioProjects..NashvilleHousing

---------------------------------------------------------------------------------------------------------------------

-- Standrize date format 

select SaleDateConverted, CONVERT(Date,SaleDate)
from PortfolioProjects..NashvilleHousing

UPDATE NashvilleHousing
SET SaleDate = CONVERT(Date,SaleDate)

ALTER TABLE NashvilleHousing
Add SaleDateConverted Date;

Update NashvilleHousing
set SaleDateConverted = CONVERT(Date,SaleDate)

----------------------------------------------------------------------------------------------------------------------

-- Populate Property Adress data

Select *
from PortfolioProjects..NashvilleHousing
--where PropertyAddress is null
order by ParcelID


Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, isnull(a.propertyAddress,b.PropertyAddress) 
from PortfolioProjects..NashvilleHousing a
JOIN PortfolioProjects..NashvilleHousing B
ON a.ParcelID = b.ParcelID
and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

update a 
set PropertyAddress = isnull(a.propertyAddress,b.PropertyAddress)
from PortfolioProjects..NashvilleHousing a
JOIN PortfolioProjects..NashvilleHousing B
ON a.ParcelID = b.ParcelID
and a.[UniqueID ] <> b.[UniqueID ]


--------------------------------------------------------------------------------------------------------------------------------------

-- Breaking out Address into individual columns (Address, City, State)

Select PropertyAddress
from PortfolioProjects..NashvilleHousing


Select 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1) as address,
SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress)) as City

from PortfolioProjects..NashvilleHousing

ALTER TABLE NashvilleHousing
Add PropertySplittedAdress Nvarchar(255);

Update NashvilleHousing
set PropertySplittedAdress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1)

ALTER TABLE NashvilleHousing
Add PropertySplittedCity Nvarchar(255);

Update NashvilleHousing
set PropertySplittedCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress))

Select*
from PortfolioProjects..NashvilleHousing





Select OwnerAddress
from PortfolioProjects..NashvilleHousing

Select 
PARSENAME(REPLACE(OwnerAddress, ',', '.'),  3),
PARSENAME(REPLACE(OwnerAddress, ',', '.'),  2),
PARSENAME(REPLACE(OwnerAddress, ',', '.'),  1)
from PortfolioProjects..NashvilleHousing

ALTER TABLE NashvilleHousing
Add OwnerAddressSplitted Nvarchar(255);

Update NashvilleHousing
set OwnerAddressSplitted = PARSENAME(REPLACE(OwnerAddress, ',', '.'),  3)

ALTER TABLE NashvilleHousing
Add OwnerCitySplitted Nvarchar(255);

Update NashvilleHousing
set OwnerCitySplitted = PARSENAME(REPLACE(OwnerAddress, ',', '.'),  2)

ALTER TABLE NashvilleHousing
Add OwnerStateSplitted Nvarchar(255);

Update NashvilleHousing
set OwnerStateSplitted = PARSENAME(REPLACE(OwnerAddress, ',', '.'),  1)


---------------------------------------------------------------------------------------------------------------------------------------------

-- Change Y and N to Yes and No in "SoldAsVacant" field 

Select Distinct(SoldAsVacant), count(SoldAsVacant)
from PortfolioProjects..NashvilleHousing
group by SoldAsVacant
order by 2

Select SoldAsVacant,
CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
	 WHEN SoldAsVacant = 'N' THEN 'No'
	 ELSE SoldAsVacant
	 END
From PortfolioProjects..NashvilleHousing

Update NashvilleHousing
set SoldAsVacant = CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
	 WHEN SoldAsVacant = 'N' THEN 'No'
	 ELSE SoldAsVacant
	 END
from PortfolioProjects..NashvilleHousing


-----------------------------------------------------------------------------------------------------------------------------------------

-- Remove Duplicates

WITH RowNumCTE as(
Select*,
ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SaleDate,
				 SalePrice,
				 LegalReference
				 Order by 
				   UniqueID
				   ) row_num

From PortfolioProjects..NashvilleHousing

--order by ParcelID
)
Select *
From RowNumCTE
WHERE Row_Num > 1

---------------------------------------------------------------------------------------------------------------------------------------------


-- Deleting Unusable Columns 

Select*
From PortfolioProjects..NashvilleHousing

ALTER TABLE PortfolioProjects..NashvilleHousing
DROP COLUMN PropertyAddress, OwnerAddress, TaxDistrict, SaleDate

