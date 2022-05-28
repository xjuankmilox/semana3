document.addEventListener('DOMContentLoaded',() => {
    
    const random = getRandomInt(1,151)
    fet(random)    
    
})

const getRandomInt =(min,max)=>{
    return Math.floor(Math.random()*(max-min))+min;
    
}

const fet = async (id) =>{
    
    try{
    const res = await fetch(`https://pokeapi.co/api/v2/pokemon/${id}`)
    const data = await res.json()

    pincard(data)
    }
    catch(error){
        console.log(error)
    }
    
}
fet()

const pincard = (pokemon) =>{
    console.log(pokemon)
    const flex = document.querySelector('.flex')
    const template = document.querySelector('#template-card').content    
    const clone = template.cloneNode(true)
    const fragment = document.createDocumentFragment()
    
    clone.querySelector('.card-header').setAttribute('src', pokemon.sprites.other.dream_world.front_default)
    clone.querySelector('.card-body-title').innerHTML= pokemon.name
    clone.querySelector('.card-body-text').textContent= pokemon.base_experience +'Exp'
    clone.querySelector('.card-ata1').textContent ='Ataque 1: '+ pokemon.moves[0].move.name
    clone.querySelector('.card-ata2').textContent ='Ataque 2: '+ pokemon.moves[1].move.name
    clone.querySelector('.card-ata3').textContent ='Ataque 3: ' +pokemon.moves[2].move.name
    fragment.appendChild(clone)
    flex.appendChild(fragment)
    
    
}