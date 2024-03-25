package dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class pagingVO {
   
   private int page;
   private int limit;
   private int listCount;
   private int startPage;
   private int endPage;
   private boolean prev, next;
   
   public pagingVO() {}
      
   public pagingVO(int page, int limit,int listCount) {
      this.page = page;
      this.limit = limit;
      this.listCount = listCount;
      int realEnd;
      realEnd = page%listCount != 0 ? (listCount/limit)+1:(listCount/limit);
      startPage = ((int)(((double)page/limit+0.9))-1)*limit+1;
      endPage = startPage+limit-1;
      
      if(endPage > realEnd) {
         endPage = realEnd;
      }
      
      prev = startPage > 1;
      next = endPage < realEnd ;
      
      
   }
   
   
   
}