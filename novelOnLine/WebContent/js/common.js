/*
　　
　　　　　　　　　　　■■　　　　　　　　　　■■　　　　　　　■■
　　　　　　　　　　　■■　　　　　　　　　　■■　　　　　　　■■   JLSLD.NET JLIB Version 0.0.1 
  　　　　　　　■■　■■　■■■■■■■■　■■　■■■■■■■■   2012.11.19 
  　　　　　　　■■　■■　■■　　　　　　　■■　■■　　　　■■   Power By JLSLD.
  　　　　　　　■■　■■　■■　　　　　　　■■　■■　　　　■■
　　　　　　　　■■　■■　■■■■■■■■　■■　■■　　　　■■   Thank You For Read This Code !
　　　　　　　　■■　■■　　　　　　　■■　■■　■■　　　　■■   If You Have Any Good Suggestion,Please Tell Me.
　　　　　　　　■■　■■　　　　　　　■■　■■　■■　　　　■■
　　　　　　　　■■　■■　■■■■■■■■　■■　■■■■■■■■   http://www.jlsld.net
　　　　　　　　■■
　　■■■■■■■■
  
*/

var JLSLD = {
    id: 0,
    getNewId: function () {
        this.id++;
        return this.id;
    },
    createDivById: function (id) {
        var el = document.createElement("div");
        el.setAttribute("id", id);
        return el;
    },
    createElementById: function (id, name, type, value) {
        switch (type) {
            case "text": return JLSLD.createElementLabelInput(id, name, value, type); break;
            case "textarea": return JLSLD.createElementLabelTextArea(id, name, value, type); break;
        }
        return null;
    },
    //创建多行文本框
    createElementLabelTextArea: function (id, name, value, type, style, event) {
        var var_textarea = null;
        var textarea_event_attr_IE = "";
        if (event != null && event != "") {
            var event_array_IE = event.toString().split('|');
            for (var i = 0; i < event_array_IE.length; i++) {
                var event_IE = event_array_IE[i].split('==');
                textarea_event_attr_IE += " " + event_IE[0] + "='' ";
            }
        }
        try {//定义变量实现IE6.0和IE7.0兼容。
            var_textarea = document.createElement("<textarea " + textarea_event_attr_IE + "></textarea>");
        } catch (e) {
            var_textarea = document.createElement("textarea");
        }
        var textarea_id = document.createAttribute("id");
        textarea_id.nodeValue = id;
        var textarea_name = document.createAttribute("name");
        textarea_name.nodeValue = name;
        var textarea_style = document.createAttribute("style");

        textarea_style.nodeValue = style;
        if (event != null && event != "") {
            var event_array = event.toString().split('|');
            for (var i = 0; i < event_array.length; i++) {
                var events = event_array[i].split('==');
                var textarea_event = document.createAttribute(events[0]);
                textarea_event.nodeValue = events[1];
                var_textarea.setAttributeNode(textarea_event);
            }
        }
        var_textarea.setAttributeNode(textarea_id);
        var_textarea.setAttributeNode(textarea_name);
        var_textarea.setAttributeNode(textarea_style);
        $(var_textarea).val(value);
        return var_textarea;
    },
    //*************************************//
    //定义方法创建input标签（主要为Text）
    //id,name,value,type 分别代表创建标签的id,
    //   名称（name），值（value），类型（type）
    //  绑定Input方法事件，绑定方式如下（可以同时绑定多个事件方法）：
    //  "onchange==alert('This Value is change success !');|onblur==alert('This value is the beautiful one !');"
    //*************************************//
    createElementLabelInput: function (id, name, value, type, width, height, event) {
        var var_input = null;
        var input_event_attr_IE = "";
        if (event != null && event != "") {
            var event_array_IE = event.toString().split('|');
            for (var i = 0; i < event_array_IE.length; i++) {
                var event_IE = event_array_IE[i].split('==');
                input_event_attr_IE += " " + event_IE[0] + "='' ";
            }
        }
        try {//定义变量实现IE6.0和IE7.0兼容。
            var_input = document.createElement("<input " + input_event_attr_IE + ">");
        } catch (e) {
            var_input = document.createElement("input");
        }

        var input_id = document.createAttribute("id");
        input_id.nodeValue = id;
        var input_name = document.createAttribute("name");
        input_name.nodeValue = name;
        var input_type = document.createAttribute("type");
        input_type.nodeValue = type;
        var input_value = document.createAttribute("value");
        input_value.nodeValue = value;
        var input_style = document.createAttribute("style");
        var input_style_str = "";

        if (width != null && width != "") {
            input_style_str += "width:" + width + "px;";
        } else {
            input_style_str += "width:30px;";
        }
        if (height != null && height != "") {
            input_style_str += "height:" + height + "px;";
        }

        if (event != null && event != "") {
            var event_array = event.toString().split('|');
            for (var i = 0; i < event_array.length; i++) {
                var events = event_array[i].split('==');
                var input_event = document.createAttribute(events[0]);
                input_event.nodeValue = events[1];
                var_input.setAttributeNode(input_event);
            }
        }

        var_input.setAttributeNode(input_type);
        input_style.nodeValue = input_style_str;
        try {
            var_input.setAttributeNode(input_style);
        } catch (e) {
            width = (width == null || width == "") ? "30" : width;
            var_input.setAttribute("width", width);
            if (height != null && height != "") {
                var_input.setAttribute("height", height);
            }
        }
        var_input.setAttributeNode(input_id);
        var_input.setAttributeNode(input_name);
        var_input.setAttributeNode(input_value);

        return var_input;
    },
    //创建select标签
    // id   表示标签的标识id
    // name 表示标签的名称name
    // options表示标签要绑定的选择项（例如："0-A|1-B|……")
    // splitstr表示用来分割options的字符（如：'|')
    // splitchar表示分割键值对的分隔符（如：'-'）
    // event 表示此标签对应的事件（当event==null时此标签不绑定事件）
    createElementLabelSelect: function (id, name, options, splitstr, splitchar, event, selectedValue) {
        var var_select = null;
        try {//处理IE6.0和IE7.0的兼容问题。
            var_select = document.createElement("<select onchange='' >");
        } catch (e) {
            var_select = document.createElement("select");
        }

        var select_id = document.createAttribute("id");
        select_id.nodeValue = id;
        var select_name = document.createAttribute("name");
        select_name.nodeValue = name;

        if (event != null && event != undefined && event != "") {
            var select_change = document.createAttribute("onchange");
            select_change.nodeValue = event;
            var_select.setAttributeNode(select_change);
        }
        var_select.setAttributeNode(select_id);
        var_select.setAttributeNode(select_name);
        try {
            var_select.setAttribute("width", "100px");
        } catch (e) {
            var select_css = document.createAttribute("class");
            select_css.nodeValue = "select_css";
            var_select.setAttributeNode(select_css);
        }

        splitstr = (splitstr == "" || splitstr == null) ? "|" : splitstr;
        splitchar = (splitchar == "" || splitchar == null) ? "-" : splitchar;

        if (options != null && options != undefined && options.toString() != "") {
            options = (options.toString().lastIndexOf(splitstr) + 1 == options.toString().length) ? options.toString().substr(0, options.toString().length - 1) : options;
            var arrayOption = options.toString().split(splitstr);
            for (var i = 0; i < arrayOption.length; i++) {
                var temp_value = arrayOption[i].split(splitchar);
                var option = document.createElement("option");
                var option_value = document.createAttribute("value");
                option_value.nodeValue = temp_value[0];
                var option_text = document.createTextNode(temp_value[1]);
                option.setAttributeNode(option_value);
                option.appendChild(option_text);

                var_select.appendChild(option);
                if (selectedValue != null && selectedValue != "") {
                    if (temp_value[0] == selectedValue || temp_value[1] == selectedValue) {
                        var_select.options[i].selected = true;
                    }
                }
            }
        }
        return var_select;
    },
    //创建A标签
    createElementLabelA: function (id, name, value, event, href, target) {
        var var_a = null;
        try {
            var_a = document.createElement("<a onclick='' target='_blank'>");
        } catch (e) {
            var_a = document.createElement("a");
        }
        var a_id = document.createAttribute("id");
        a_id.nodeValue = id;
        var a_name = document.createAttribute("name");
        a_name.nodeValue = name;
        href = (href == null || href == "") ? ("javascript:void(0);" || "#") : href;
        var a_href = document.createAttribute("href");
        a_href.nodeValue = href;

        var a_Text = document.createTextNode(value);

        var_a.setAttributeNode(a_href);
        var_a.setAttributeNode(a_id);
        var_a.setAttributeNode(a_name);
        if (target != null) {
            var target_href = document.createAttribute("target");
            target_href.nodeValue = "_blank";
            var_a.setAttributeNode(target_href);
        }

        if (event != "" && event != null && event != undefined) {
            var a_click = document.createAttribute("onclick");
            a_click.nodeValue = event;
            var_a.setAttributeNode(a_click);
        }
        var_a.appendChild(a_Text); //注意这个值绑定顺序，只能放在最后去绑定（不然不支持IE6.0和IE7.0）

        return var_a;
    },
    //检测是否为数字
    checkIsNum: function (obj, isRound) {
        var flag_var = false;
        var num = /^\d+$/; ///^\+?[1-9][0-9]*$/;
        flag_var = /^\d+(\.\d+)?$/.test(obj);
        if (isRound) {
            flag_var = num.test(obj);
        }
        return flag_var;
    },
    jsonToString: function (obj) {
        var THIS = JLSLD;
        switch (typeof (obj)) {
            case 'string':
                return '"' + obj.replace(/(["\\])/g, '\\$1') + '"';
            case 'array':
                return '[' + obj.map(THIS.jsonToString).join(',') + ']';
            case 'object':
                if (obj instanceof Array) {
                    var strArr = [];
                    var len = obj.length;
                    for (var i = 0; i < len; i++) {
                        strArr.push(THIS.jsonToString(obj[i]));
                    }
                    return '[' + strArr.join(',') + ']';
                } else if (obj == null) {
                    return 'null';

                } else {
                    var string = [];
                    for (var property in obj) {
                        string.push(THIS.jsonToString(property) + ':' + THIS.jsonToString(obj[property]));
                    }
                    return '{' + string.join(',') + '}';
                }
            case 'number':
                return obj;
            case false:
                return obj;
        }
    }
}

String.prototype.Trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, "");
}















/*              导航 浏览器              */
//导航按钮点击事件
$(document).ready(function(){
	$('#treenavigation').tree({
		onClick: function(node){
			if(node.attributes.url){
				var text=node.text;
				var url=node.attributes.url;
				var ico=node.attributes.ico;
				openurl(node.id,text,url,ico);
			}
		}
	});	
});
//关闭全部tabs
function closealltabs(){
	var length=$("#tabsbrowser .tabs li").length;
	for(;length>0;length--){
		$("#tabsbrowser").tabs("close",length);
	}
	//onClose
}
//绑定tabs的右键菜单
function tabsbindcontextmenu(){
	$('#tabsbrowser_contextmenu').menu({  
    	onClick:function(item){ 
			closealltabs();
		}
    });
	$("#tabsbrowser .tabs li").bind('contextmenu',function(e){  
		e.preventDefault();  
		$('#tabsbrowser_contextmenu').menu('show', {  
			left: e.pageX,  
			top: e.pageY
		});
	});
}
//解绑tabs的右键菜单
function tabsunbindcontextmenu(){
	$("#tabsbrowser .tabs li").bind('unbind');
}
//关闭指定页面
function closeurl(title) {
    $("#tabsbrowser").tabs("close", title);
}
//打开指定页面
function openurl(id,title,url,ico){	
	var obj=$("#tabsbrowser").tabs("getTab",title);
	if(obj){
		$("#tabsbrowser").tabs("select",title);
	}else{		
		tabsunbindcontextmenu();
		$("#tabsbrowser").tabs('add',{  
			id:"tab_"+id,
			title: title,  
			tools:[
				{
					iconCls:'icon-mini-refresh tab_'+id,
					handler:function(){  
						try{
							var cls=$(this).attr("class");  
							cls=cls.split(" ")[1];						
							$("#page_"+cls).attr("src",$("#page_"+cls).attr("src"));
						}catch(err){
							$.messager.alert('Error',err);  
						}
					} 	
				}
			],
			content: '<iframe src="'+url+'" id="page_tab_'+id+'" style="width:100%; height:100%;" scrolling="auto" frameborder="0"  data-options="fit:true"></iframe>',  
			closable: true  
		});
		tabsbindcontextmenu();
	}
}

/*              待              */

//-------------