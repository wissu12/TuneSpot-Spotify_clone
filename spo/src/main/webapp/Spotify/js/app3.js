console.log("Welcome to Spotify");

// Initialize the Variables

let audioElement = new Audio('songs_spo/1.mp3');


let masterPlay = document.getElementById('masterplay');
let songItems = Array.from(document.getElementsByClassName('songItem'));
let wave =document.getElementsByClassName('wave')[0];


songItems.forEach((element, i)=>{ 
    element.getElementsByTagName("img")[0].src = songs[i].coverPath; 
    element.getElementsByClassName("songName")[0].innerText = songs[i].songName; 
})
 

// Handle play/pause click
masterPlay.addEventListener('click', ()=>{
    if(audioElement.paused || audioElement.currentTime<=0){
        audioElement.play();
        masterPlay.classList.remove('bi-play-fill');
        masterPlay.classList.add('bi-pause-fill');
        wave.classList.add('active2');
      
    }
    else{
        audioElement.pause();
        masterPlay.classList.remove('bi-pause-fill');
        masterPlay.classList.add('bi-play-fill');
        wave.classList.remove('active2');
   
    }
})
const makeAllPlays = ()=>{
    Array.from(document.getElementsByClassName('playListPLay')).forEach((element)=>{
        element.classList.remove('fa-pause-circle-fill');
        element.classList.add('fa-play-circle-fill');
    })
}
const makeAllBackgrounds = ()=>{
    Array.from(document.getElementsByClassName('songItem')).forEach((element)=>{
        element.style.background="rgb(105,105,170,0";
    })
}


let index=0;

let poster_master_play=document.getElementById('poster_master_play');
let title=document.getElementById('title');
Array.from(document.getElementsByClassName('playListPLay'))
.forEach((element)=>{
    element.addEventListener('click',(e)=>{
        index=e.target.id;
        makeAllPlays();
        e.target.classList.remove('bi-play-circle-fill');
        e.target.classList.add('bi-pause-circle-fill');
        audioElement.src = `songs_spo/${index}.mp3`;
        poster_master_play.src=`image_songs/${index}.jpg`;
        audioElement.play();
        let song_title=songs.filter((ele)=>{
            return ele.id==index;

        })
        song_title.forEach(ele=>{
            let {songName}=ele;
            title.innerHTML=songName;
        })
        masterPlay.classList.add('bi-pause-fill');
        masterPlay.classList.remove('bi-play-fill');
        wave.classList.add('active2');
        audioElement.addEventListener('ended',()=>{
            masterPlay.classList.remove('bi-pause-fill');
            masterPlay.classList.add('bi-play-fill');
            wave.classList.remove('active2');

        })
        makeAllBackgrounds();
        Array.from(document.getElementsByClassName('songItem'))[`${index}`].style.background="rgb(105,105,170,.1";
        
  })

});
let currentStart=document.getElementById('currentStart');
let currentEnd=document.getElementById('currentEnd');
let seek=document.getElementById('seek');
let bar2=document.getElementById('bar2');
let dot=document.getElementsByClassName('dot')[0];

audioElement.addEventListener('timeupdate',()=>{
    let music_curr=audioElement.currentTime;
    let music_dur=audioElement.duration;

    let min=Math.floor(music_dur/60);
    let sec=Math.floor(music_dur%60);
    if(sec<10){
        sec=`0${sec}`;
    }

    currentEnd.innerText=`${min}:${sec}`;

    let min1=Math.floor(music_curr/60);
    let sec1=Math.floor(music_curr%60);
    if(sec1<10){
        sec1=`0${sec1}`;
    }

    currentStart.innerText=`${min1}:${sec1}`;

    let myProgressBar=parseInt((audioElement.currentTime/audioElement.duration)*100);
    seek.value = myProgressBar;
    let seekbar=seek.value;
    bar2.style.width=`${seekbar}%`;
    dot.style.left=`${seekbar}%`;
})

seek.addEventListener('change', ()=>{
    audioElement.currentTime = seek.value * audioElement.duration/100;
})
audioElement.addEventListener('ended', ()=>{
    masterPlay.classList.remove('bi-pause-fill');
    masterPlay.classList.add('bi-play-fill');
    wave.classList.remove('active2');
})

let vol_icon=document.getElementById('vol_icon');
let vol=document.getElementById('vol');
let vol_dot=document.getElementById('vol_dot');
let vol_bar=document.getElementsByClassName('vol_bar')[0];

vol.addEventListener('change', ()=>{
    if(vol.value==0){
        vol_icon.classList.remove('bi-volume-down-fill');
        vol_icon.classList.add('bi-volume-mute-fill');
        vol_icon.classList.remove('bi-volume-up-fill');

    }
    if(vol.value>0){
        vol_icon.classList.add('bi-volume-down-fill');
        vol_icon.classList.remove('bi-volume-mute-fill');
        vol_icon.classList.remove('bi-volume-up-fill');
        
    }
    if(vol.value>50){
        vol_icon.classList.remove('bi-volume-down-fill');
        vol_icon.classList.remove('bi-volume-mute-fill');
        vol_icon.classList.add('bi-volume-up-fill');
        
    }
    let vol_a=vol.value;
    vol_bar.style.width=`${vol_a}%`;
    vol_dot.style.left=`${vol_a}%`;
    audioElement.volume=vol_a/100;
})
let back=document.getElementById('back');
let next=document.getElementById('next');
back.addEventListener('click',()=>{
    index-=1;
    if(index<1){
        index.Array.from(document.getElementsByClassName('songItem')).length;
    }
    audioElement.src = `songs_spo/${index}.mp3`;
        poster_master_play.src=`image_songs/${index}.jpg`;
        audioElement.play();
        let song_title=songs.filter((ele)=>{
            return ele.id==index;

        })
        song_title.forEach(ele=>{
            let {songName}=ele;
            title.innerHTML=songName;
        })
        makeAllPlays();
        document.getElementById(`${index}`).classList.add('bi-pause-fill');
        document.getElementById(`${index}`).classList.remove('bi-play-fill');
        makeAllBackgrounds();
        Array.from(document.getElementsByClassName('songItem'))[`${index}`].style.background="rgb(105,105,170,.1";
})
next.addEventListener('click',()=>{
    index-=0;
    index+=1;
    if(index>Array.from(document.getElementsByClassName('songItem')).length){
        index=1;
    }
    audioElement.src = `songs_spo/${index}.mp3`;
        poster_master_play.src=`image_songs/${index}.jpg`;
        audioElement.play();
        let song_title=songs.filter((ele)=>{
            return ele.id==index;

        })
        song_title.forEach(ele=>{
            let {songName}=ele;
            title.innerHTML=songName;
        })
        makeAllPlays();
        document.getElementById(`${index}`).classList.add('bi-pause-fill');
        document.getElementById(`${index}`).classList.remove('bi-play-fill');
        makeAllBackgrounds();
        Array.from(document.getElementsByClassName('songItem'))[`${index}`].style.background="rgb(105,105,170,.1";
})

let left_scroll=document.getElementById('left_scroll');
let right_scroll=document.getElementById('right_scroll');
let pop_song=document.getElementsByClassName('pop_song')[0];
left_scroll.addEventListener('click',()=>{
    pop_song.scrollLeft -=330;
})
right_scroll.addEventListener('click',()=>{
    pop_song.scrollLeft +=330;
})

let left_scrolls=document.getElementById('left_scrolls');
let right_scrolls=document.getElementById('right_scrolls');
let item=document.getElementsByClassName('item')[0];
left_scrolls.addEventListener('click',()=>{
    item.scrollLeft -=330;
})
right_scrolls.addEventListener('click',()=>{
    item.scrollLeft +=330;
})