#' Merge tiles
#' @title Merge Tiles test function
#' @description merging tiles surrounding your object 
#' @param path path to the tiles
#' @param tileNumberXCoord X-coordinates of the center tile
#' @param tileNumberYCoord Y-coordinates of the center tile
#' @param extensionMainTile no clue, Andrea?
#' @param maxView in svf calculations
#' @param projection a projection, guess RDcoords?
#' @export

mergeNeighborTilesGSMTest <- function(path,tileNumberXCoord, tileNumberYCoord, extensionMainTile, maxView,projection){
  
  #print("hello")
  #tileNeighborsLeftLower<-paste0("ahn_", tileNumberXCoord-1000,"_",tileNumberYCoord-1000,".laz")
  tileNeighborsLeftLowerX<-tileNumberXCoord-1000
  tileNeighborsLeftLowerY<-tileNumberYCoord-1000
  df<-loadTileGMSFromLas(path,tileNeighborsLeftLowerX,tileNeighborsLeftLowerY)
  if(is.null(df)==FALSE){
    df<-makeSpatialDF(df,projection)
    extensionDF<-extent(df)
    if(xmax(extensionDF)!=xmin(extensionDF) & ymax(extensionDF)!=ymin(extensionDF)){
    df1<-crop(df,c(xmin(extensionMainTile)-maxView,xmin(extensionMainTile),ymin(extensionMainTile)-maxView, ymin(extensionMainTile)))
    df1<-checkCoordinates(df1)
    }
  }
  
  #tileNeighborLeft<-paste0("ahn_", tileNumberXCoord-1000,"_",tileNumberYCoord,".laz")
  tileNeighborsLeftX<-tileNumberXCoord-1000
  tileNeighborsLeftY<-tileNumberYCoord
  df<-loadTileGMSFromLas(path,tileNeighborsLeftX,tileNeighborsLeftY)
  if(is.null(df)==FALSE){
    df<-makeSpatialDF(df,projection)
    extensionDF<-extent(df)
    if(xmax(extensionDF)!=xmin(extensionDF) & ymax(extensionDF)!=ymin(extensionDF)){
    df2<-crop(df,c(xmin(extensionMainTile)-maxView,xmin(extensionMainTile),ymin(extensionMainTile), ymax(extensionMainTile)))
    df2<-checkCoordinates(df2)
    }
  }
  
  #tileNeighborLeftUpper<-paste0("ahn_", tileNumberXCoord-1000,"_",tileNumberYCoord+1000,".laz")
  tileNeighborsLeftUpperX<-tileNumberXCoord-1000
  tileNeighborsLeftUpperY<-tileNumberYCoord+1000
  df<-loadTileGMSFromLas(path,tileNeighborsLeftUpperX,tileNeighborsLeftUpperY)
  if(is.null(df)==FALSE){
    df<-makeSpatialDF(df,projection)
    extensionDF<-extent(df)
    if(xmax(extensionDF)!=xmin(extensionDF) & ymax(extensionDF)!=ymin(extensionDF)){
    df3<-crop(df,c(xmin(extensionMainTile)-maxView,xmin(extensionMainTile),ymax(extensionMainTile), ymax(extensionMainTile)+maxView))
    df3<-checkCoordinates(df3)
    }
  }
  
  #tileNeighborsRightLower<-paste0("ahn_", tileNumberXCoord+1000,"_",tileNumberYCoord-1000,".laz")
  tileNeighborsRightLowerX<-tileNumberXCoord+1000
  tileNeighborsRightLowerY<-tileNumberYCoord-1000
  df<-loadTileGMSFromLas(path,tileNeighborsRightLowerX,tileNeighborsRightLowerY)
  if(is.null(df)==FALSE){
    df<-makeSpatialDF(df,projection)
    extensionDF<-extent(df)
    if(xmax(extensionDF)!=xmin(extensionDF) & ymax(extensionDF)!=ymin(extensionDF)){
    df4<-crop(df,c(xmax(extensionMainTile),xmax(extensionMainTile)+maxView,ymin(extensionMainTile)-maxView, ymin(extensionMainTile)))
    df4<-checkCoordinates(df4)
    }
  }
  
  #tileNeighborRight<-paste0("ahn_", tileNumberXCoord+1000,"_",tileNumberYCoord,".laz")
  tileNeighborsRightX<-tileNumberXCoord+1000
  tileNeighborsRightY<-tileNumberYCoord
  df<-loadTileGMSFromLas(path,tileNeighborsRightX,tileNeighborsRightY)
  if(is.null(df)==FALSE){
    df<-makeSpatialDF(df,projection)
    extensionDF<-extent(df)
    if(xmax(extensionDF)!=xmin(extensionDF) & ymax(extensionDF)!=ymin(extensionDF)){
    df5<-crop(df,c(xmax(extensionMainTile),xmax(extensionMainTile)+maxView,ymin(extensionMainTile), ymax(extensionMainTile)))
    df5<-checkCoordinates(df5)
    }
  }
    
  
  #tileNeighborRightUpper<-paste0("ahn_", tileNumberXCoord+1000,"_",tileNumberYCoord+1000,".laz")
  tileNeighborsRightUpperX<-tileNumberXCoord+1000
  tileNeighborsRightUpperY<-tileNumberYCoord+1000
  df<-loadTileGMSFromLas(path,tileNeighborsRightUpperX,tileNeighborsRightUpperY)
  if(is.null(df)==FALSE){
    df<-makeSpatialDF(df,projection)
    extensionDF<-extent(df)
    if(xmax(extensionDF)!=xmin(extensionDF) & ymax(extensionDF)!=ymin(extensionDF)){
    df6<-crop(df,c(xmax(extensionMainTile),xmax(extensionMainTile)+maxView,ymax(extensionMainTile), ymax(extensionMainTile)+maxView))
    df6<-checkCoordinates(df6)
    }
  }
  
  #tileNeighborsCentralDown<-paste0("ahn_", tileNumberXCoord,"_",tileNumberYCoord-1000,".laz")
  tileNeighborsCenterDownX<-tileNumberXCoord
  tileNeighborsCenterDownY<-tileNumberYCoord-1000
  df<-loadTileGMSFromLas(path,tileNeighborsCenterDownX,tileNeighborsCenterDownY)
  if(is.null(df)==FALSE){
    df<-makeSpatialDF(df,projection)
    extensionDF<-extent(df)
    if(xmax(extensionDF)!=xmin(extensionDF) & ymax(extensionDF)!=ymin(extensionDF)){
    df7<-crop(df,c(xmin(extensionMainTile),xmax(extensionMainTile),ymin(extensionMainTile)-maxView, ymin(extensionMainTile)))
    df7<-checkCoordinates(df7)
    }
  }
  
  #tileNeighborsCentralUp<-paste0("ahn_", tileNumberXCoord,"_",tileNumberYCoord+1000,".laz")
  tileNeighborsCenterUpX<-tileNumberXCoord
  tileNeighborsCenterUpY<-tileNumberYCoord+1000
  df<-loadTileGMSFromLas(path,tileNeighborsCenterUpX,tileNeighborsCenterUpY)
  if(is.null(df)==FALSE){
    df<-makeSpatialDF(df,projection)
    extensionDF<-extent(df)
    if(xmax(extensionDF)!=xmin(extensionDF) & ymax(extensionDF)!=ymin(extensionDF)){
    df8<-crop(df,c(xmin(extensionMainTile),xmax(extensionMainTile),ymax(extensionMainTile), ymax(extensionMainTile)+maxView))
    df8<-checkCoordinates(df8)
    }
  }
  
  if(exists("df1")==FALSE){
    df1<-NULL
  }
  if(exists("df2")==FALSE){
    df2<-NULL
  }
  if(exists("df3")==FALSE){
    df3<-NULL
  }
  if(exists("df4")==FALSE){
    df4<-NULL
  }
  if(exists("df5")==FALSE){
    df5<-NULL
  }
  if(exists("df6")==FALSE){
    df6<-NULL
  }
  if(exists("df7")==FALSE){
    df7<-NULL
  }
  if(exists("df8")==FALSE){
    df8<-NULL
  }
  
  if(exists("df")==TRUE){
    rm(df)
  }
  
  dfs<-c(df1,df2,df3,df4,df5,df6,df7,df8)
  rm(df1,df2,df3,df4,df5,df6,df7,df8, tileNeighborsCenterUpY, tileNeighborsCenterUpX, 
     tileNeighborsCenterDownY, tileNeighborsCenterDownX, tileNeighborsRightUpperY, tileNeighborsRightUpperX,
     tileNeighborsRightY, tileNeighborsRightX, tileNeighborsRightLowerY, tileNeighborsRightLowerX, 
     tileNeighborsLeftUpperY, tileNeighborsLeftUpperX, tileNeighborsLeftY, tileNeighborsLeftX,
     tileNeighborsLeftLowerY, tileNeighborsLeftLowerX, extensionDF)
  gc()
  return(dfs)
  #########################################################
  
  
}



checkCoordinates<-function(spatialDF){
  if(is.null(spatialDF)==FALSE){
  if(xmax(spatialDF)==xmin(spatialDF) | ymax(spatialDF)==ymin(spatialDF)){
    spatialDF<-NULL
  }
  }
  spatialDF
}