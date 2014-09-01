controllers = angular.module('controllers')
controllers.controller("RecipesController", [ '$scope', '$routeParams', '$location', '$resource',
  ($scope,$routeParams,$location,$resource)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)
    Recipe = $resource('/recipes/:recipeId', { recipeId: "@id", format: 'json'})

    if $routeParams.keywords
      # Before connecting to the back-end
      # keywords = $routeParams.keywords.toLowerCase()
      # $scope.recipes = recipes.filter (recipe)-> recipe.name.toLowerCase().indexOf(keywords) != -1

      # After connecting to the back-end
      Recipe.query(keywords: $routeParams.keywords, (results)-> $scope.recipes = results)
    else
      $scope.recipes = []

    $scope.view = (recipeId)-> $location.path("/recipes/#{recipeId}")
])