import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('car_location');
  if (addressInput) {
    places({ container: addressInput });
  }
  const locationInput = document.getElementById('home_query');
  if (locationInput) {
    places({ container: locationInput });
  }
};

export { initAutocomplete };
