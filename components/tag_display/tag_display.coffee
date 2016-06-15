angular.module('loomioApp').directive 'tagDisplay', ->
  scope: {discussion: '='}
  restrict: 'E'
  replace: true
  templateUrl: 'generated/components/tag_display/tag_display.html'
  controller: ($scope, TagRecordsInterface, DiscussionTagRecordsInterface, Records) ->
    Records.addRecordsInterface(DiscussionTagRecordsInterface) unless Records.discussionTags

    $scope.discussionTags = ->
      Records.discussionTags.find discussionId: $scope.discussion.id

    return
