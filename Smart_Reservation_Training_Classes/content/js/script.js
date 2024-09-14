function Loader() {
    $("<div style='background-color:#0000004a;width:100%;height:100%;z-index:1029;position:fixed;bottom:0;' class='waiting'>" +
        "<div style='top:50%;left:50%;position:fixed;transform:translate(-50%,-50%);'>" +
        "<div style='solid;display:inherit;width:auto;'>" +
        "<div class='text-center'><div class='spinner-grow text-primary' style='width: 3rem; height: 3rem;' role='status'><span class='visually-hidden'>يرجى الإنتظار...</span></div></div>" +
        "</div></div></div>").appendTo(document.body);

    $('#modal-Loader').modal({
        backdrop: 'static',
        keyboard: false
    });
}

const sidebarToggle = document.querySelector("#sidebar-toggle");
sidebarToggle.addEventListener("click",function(){
    document.querySelector("#sidebarMenu").classList.toggle("collapsed");
});

document.querySelector(".theme-toggle").addEventListener("click",() => {
    toggleLocalStorage();
    toggleRootClass();
});

function toggleRootClass(){
    const current = document.documentElement.getAttribute('data-bs-theme');
    const inverted = current == 'dark' ? 'light' : 'dark';
    document.documentElement.setAttribute('data-bs-theme',inverted);
}

function toggleLocalStorage(){
    if(isLight()){
        localStorage.removeItem("light");
    }else{
        localStorage.setItem("light","set");
    }
}

function isLight(){
    return localStorage.getItem("light");
}

if(isLight()){
    toggleRootClass();
}
