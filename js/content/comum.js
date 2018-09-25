Vue.component('modal', {
    template: `<div class="modal fade" id="modal-buscar" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modelTitleId">Pesquisar</h4>
            </div>
            <div class="modal-body">
                <div class="content">
                        <form>
                            <div class="form-group">
                                <label class="mt-3" for="nome-busca">Nome</label>
                                <input type="text" class="form-control" id="nome-busca" placeholder="Nome...">
                            </div>
                            <div class="form-group">
                                <label for="categoria">Categoria</label>
                                <select class="custom-select" id="categoria">
                                    <option> --- </option>
                                    <option>Desenho Industrial</option>
                                    <option>Design de Interface</option>
                                    <option>Identidade Visual</option>
                                    <option>Design de produtos</option>
                                    <option>Fotografia</option>
                                    <option>Ilustração</option>
                                </select>
                            </div>
                            <div class="form-group mb-4">
                                <label for="nota-busca" class="mt-0">Nota</label>
                                <select class="custom-select" id="nota">
                                    <option>5</option>
                                    <option>4</option>
                                    <option>3</option>
                                    <option>2</option>
                                    <option>1</option>
                                </select>
                            </div>
                        </form>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save</button>
            </div>
        </div>
    </div>
</div>`
});

Vue.component('navbar', {
  template: `<nav class="navbar navbar-expand-lg navbar-dark fixed-top shadow-sm">
  <a class="navbar-brand my-auto"><div class="navbar-icon"><img class="navbar-icon" src="../imagens/logo/logo-test.png"></a>
  <ul class="navbar-nav ml-auto justify-content-center align-items-center">
      <li class="nav-item active">
          <button type="button" id="pesquisar" class="btn btn-primary btn-md" data-toggle="modal" data-target="#modal-buscar">
          Pesquisar
        </button>
      </li>
  </ul>
</nav>`
});

Vue.component('adm-navbar', {
    template: `<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top shadow-sm">
    <a class="navbar-brand my-auto"><img class="navbar-icon" src="../imagens/logo/logo-test.png">DSGN</a>
    <button class="navbar-toggler my-2" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
     <span class="navbar-toggler-icon"></span>
    </button>
    <div class="colapse navbar-colapse ml-auto" id="navbar">
        <ul class="navbar-nav justify-content-center align-items-center">
            <li class="nav-item active">
                <button class="btn btn-outline-light mx-1">Ocultar Portifolio</button>
            </li>  
            <li class="nav-item">
                <button type="button" id="pesquisar" class="btn btn-primary btn-md" data-toggle="modal" data-target="#modal-buscar">
                    Pesquisar
                </button>
            </li>
        </ul>
    </div>
  </nav>` 
});

new Vue({
    el: 'header'
});






