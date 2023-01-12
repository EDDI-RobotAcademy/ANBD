
	$(document).ready(function() {
          
          
         $('#summernote').summernote({
         
			  disableDragAndDrop:true,
			placeholder : '내용을 입력하세요',
			tabsize : 2,
			height : 500,
			width : 900,
			 toolbar: [
				    // [groupName, [list of button]]
				    ['style', ['bold', 'italic', 'underline', 'clear']],
				    ['font', ['strikethrough', 'superscript', 'subscript']],
				    ['fontsize', ['fontsize']],
				    ['color', ['color']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']]
				  ],
				  
		

		});
          
          
          
		var dlist=[];
		
		var formObj = $("form[name='updateForm']");
 
		$(".write_btn").on("click", function() {
			if (fn_valiChk() || radio_ch() || ch_ch()) {
				return false;
			}
			
		
			if(!(isNaN( $("#p_cost").value ))){
				alert("가격란에는 숫자만 입력해주세요.");
				return false;
			}
			
			
            
			formObj.attr("action", "/product/update");
			formObj.attr("method", "post");
			formObj.submit();
		});
		
		
		$("#sell_a").change( function() {
			
			if($("#sell_a").is(":checked")){
				$("#p_local").css("display","inline");
			}else{
				$("#p_local").css("display","none");
			}
			
			
		
		});
		

		
		
		
		
		$(".imgbtn").on("click" , function() {
			var inum = $(this).val(); //버튼에 담은 이미지의 fno 
		    
			if(confirm("사진을 삭제하시겠습니까?")){
			
				var va =   $("#dlist").val();
				$("#dlist").attr('value', va+ inum+ ',');
				$(this).parent().remove();
				
				
				
			
			}else{
				return false;
			}
			
			
		} );
		
	


		
		

	})

	
	function radio_ch() {

		if ($("input[type='radio']:checked").val() != null) {
			return false;

		} else {
			alert("상품의 상태를 선택하세요");
			return true;
		}

	}


	function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}

	
	function ch_ch() {
		const checkPart = document.querySelector('.checkbox-part');
		const checkboxes = checkPart.querySelectorAll('input');

		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].checked == true) {

				return false;

			}
		}

		alert("거래 방법을 선택하세요");
		return true;

	}

	
	function addFile() {
		var str = "<div class='file-group'><input type='file' name='file'><a href='#this' name='file-delete'>삭제</a></div>";
		$("#file-list").append(str);
		$("a[name='file-delete']").on("click", function(e) {
			e.preventDefault();
			deleteFile($(this));
		});
	}


	function deleteFile(obj) {
		obj.parent().remove();
	}

	

