const weatherIcons = {
    "Rain": "wi wi-day-rain",
    "Clouds": "wi wi-day-cloudy",
    "Clear": "wi wi-day-sunny",
    "Snow": "wi wi-day-snow",
    "mist": "wi wi-day-fog",
    "Drizzle": "wi wi-day-sleet",
}
function capitalize(str) {
    return str[0].toUpperCase() + str.slice(1);
}

async function main(withIp = true) {
    let ville;
    if (withIp) {
        const ip = await fetch("https://api.ipify.org?format=json")
            .then(resultat => resultat.json())
            .then(json => json.ip);
        // console.log(ip)

        ville = await fetch('http://api.ipstack.com/' + ip + '?access_key=c3ab3003eadd5ea87eafd0b37b7cf114')
            .then(resultat => resultat.json())
            .then(json => json.country_name);
        console.log(ville)
    }else {
        ville = document.querySelector("#ville").textContent;
    }

    const meteo = await fetch('https://api.openweathermap.org/data/2.5/weather?q=' + ville + '&appid=b9c0337100a9efd58738912481b42db3&units=metric&lang=fr')
        .then(resultat => resultat.json())
        .then(json => json)
    console.log(meteo);

    //affichage les informations sur la page
    displayWeatherInfor(meteo);
}

function displayWeatherInfor(data) {
    const name = data.name;
    const tempirature = data.main.temp;
    const condition = data.weather[0].main;
    const description = data.weather[0].description;

    document.querySelector("#ville").textContent = name;
    document.querySelector("#tempirature").textContent = Math.round(tempirature);
    document.querySelector('#condition').textContent = capitalize(description);
    document.querySelector('i.wi').className = weatherIcons[condition];

    document.body.className = condition.toLowerCase();

    const ville = document.querySelector('#ville');
    ville.addEventListener('click', () => {
        ville.contentEditable = true;
    })

    ville.addEventListener('keydown', (e) => {
        if (e.keyCode === 13) {
            e.preventDefault();
            ville.contentEditable = false;
            main(false);
        }
    })

}

main();
