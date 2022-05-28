/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */
const marvel = {
    render: () => {
        const urlAPI = 'https://gateway.marvel.com:443/v1/public/characters?ts=1&apikey=434d0b2a68adf1729c9a5767ff02c9f5&hash=92b7f84f18f5c8c057885b5111aaf6cb';
        const container = document.querySelector('#marvel-row');
        let contentHTML = '';
        fetch(urlAPI)
                .then(res => res.json())
                .then((json) => {

                    for (const hero of json.data.results) {
                        let = urlHero = hero.urls[0].url;
                        contentHTML += ` 
              <div class="col-md-4">
                  <a href="${urlHero}" target="_blank">
                      <img src="${hero.thumbnail.path}.${hero.thumbnail.extension}" alt="${hero.name}" class="img-thumbnail">
                  </a>
                  <h3 class="title" text-white>${hero.name}</h3>
               </div>`;
                    }
                    container.innerHTML = contentHTML;
                }) }
};
marvel.render();
